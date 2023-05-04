import 'package:flutter/material.dart';
import 'package:shop_list/screens/Authentication/register.dart';
import 'package:shop_list/screens/Home/all_tems_page.dart';
import 'package:shop_list/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function togglePage;
  const SignIn({super.key, required this.togglePage});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in to Shop List'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) =>
                      value?.isEmpty == true ? "Enter a valid Email" : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) =>
                      value?.isEmpty == true ? "Enter a valid Password" : null,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = "Coulld not signin this user please register";
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AllItemsPage(currentUser: result),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text("Sign In"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  error,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Feel Free to Register"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(
                          togglePage: widget.togglePage,
                        ),
                      ),
                    );
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
