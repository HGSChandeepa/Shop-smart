import 'package:flutter/material.dart';
import 'package:shop_list/screens/Authentication/sign_in.dart';
import 'package:shop_list/screens/Authentication/register.dart';
//in this page we are looging the user is loged in or not and show the login or register page

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signInPage = true;

  //change page
  void togglePage() {
    setState(() {
      signInPage = !signInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signInPage) {
      return SignIn(togglePage: togglePage);
    } else {
      return Register(togglePage: togglePage);
    }
  }
}
