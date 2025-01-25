import 'package:chatbox/Screens/dashboard.dart';
import 'package:chatbox/Screens/details.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    //checks for login status
    Future.delayed(const Duration(seconds: 2), () {
      if (user == null) {
        openLoginScreen();
      } else {
        openDashboard();
      }
    });
    // TODO: implement initState
    super.initState();
  }

  void openDashboard() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Dashboard();
    }));
  }

  void openLoginScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Details();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'Assets/Images/image.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
