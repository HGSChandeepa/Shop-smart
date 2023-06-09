import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_list/screens/Authentication/authenticate.dart';

import 'package:shop_list/screens/Home/all_tems_page.dart';

//this is the wrapper for checking the auth state
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key, required this.user});

  //user
  final User? user;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Authenticate();
    } else {
      return AllItemsPage(currentUser: user!);
    }
  }
}
