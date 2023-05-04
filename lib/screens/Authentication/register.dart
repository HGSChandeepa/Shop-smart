import 'package:flutter/material.dart';
import 'package:shop_list/screens/Authentication/sign_in.dart';
import 'package:shop_list/services/auth.dart';

class Register extends StatefulWidget {
  final Function togglePage;
  const Register({super.key, required this.togglePage});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //auth data
  final AuthService _auth = AuthService();
  //formkey
  final _formKey = GlobalKey<FormState>();
  //data by user
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register to Shop List'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                //email feild
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? "Enter a valid Email" : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
                //password feild
                TextFormField(
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? "Enter a valid Password" : null,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),

                //register button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      //go to all-items page

                      if (result == null) {
                        setState(() {
                          error = "please enter a valid email";
                        });
                      }
                    }
                  },
                  child: const Text("Register"),
                ),
                Text(
                  error,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Already have and account?"),

                //register page
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SignIn(togglePage: widget.togglePage),
                      ),
                    );
                  },
                  child: const Text("Sign in"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
