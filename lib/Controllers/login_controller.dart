import 'package:chatbox/Screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  static Future<void> createAccount(
      {required BuildContext context,
      required String username,
      required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username, password: password)
        .then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return Dashboard();
      }), (route) => false);
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}
