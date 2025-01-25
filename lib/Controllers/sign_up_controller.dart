import 'package:chatbox/Screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpController {
  static Future<void> createAccount(
      {required BuildContext context,
      required String Email,
      required String password,
      required String username,
      required String country}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email, password: password)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created successfully')));
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
