import 'package:flutter/material.dart';
import 'package:shop_list/screens/Authentication/register.dart';
import 'package:shop_list/services/auth.dart';
//in this page we are looging the user is loged in or not and show the login or register page

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //the auth data
  final AuthService _auth = AuthService();
  //form key for check the errors
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
                //email feild
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
                //password feild
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

                //signin button
                ElevatedButton(
                  onPressed: () async {
                    //here check the form is valid. then if the form isvalid,
                    //we can add the data to the firebase
                    if (_formKey.currentState!.validate()) {
                      //take take the result
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = "Coulld not signin this user please register";
                        });
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

                //register page
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
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
