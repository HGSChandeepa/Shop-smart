import 'package:flutter/material.dart';
import 'package:shop_list/screens/Authentication/sign_in.dart';

//this is the wrapper for check the auth state
class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
