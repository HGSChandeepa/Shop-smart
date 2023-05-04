import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_list/services/database.dart';

class AuthService {
  //get the firebase instance for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //register new user usgin email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      User? user = result.user;
      await DataBaseConfig(uid: user!.uid).updateUser('new item', 0);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  // change password
  //forgot password
}
