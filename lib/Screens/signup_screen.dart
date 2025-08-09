import 'package:chatbox/Controllers/sign_up_controller.dart';
import 'package:chatbox/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  TextEditingController Email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController country = TextEditingController();
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              AnimatedBuilder(
                  animation: opacity,
                  builder: (context, child) {
                    return Opacity(
                      opacity: opacity.value,
                      child: login(Email, password, username),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget login(
    TextEditingController Email,
    TextEditingController password,
    TextEditingController username,
  ) {
    var userForm = GlobalKey<FormState>();

    return Form(
      key: userForm,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
            height: 150,
            width: 150,
            child: Image.asset('Assets/Images/playstore.png')),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            shadowColor: const Color.fromARGB(255, 0, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (userForm) {
                      if (userForm == null || userForm.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                    controller: Email,
                    decoration: InputDecoration(
                      label: Text('Email'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: TextFormField(
                    validator: (userForm) {
                      if (userForm == null || userForm.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    controller: password,
                    decoration: InputDecoration(
                      label: Text('Password'),
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autofocus: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (userForm) {
                      if (userForm == null || userForm.isEmpty) {
                        return 'Please enter Username';
                      }
                      return null;
                    },
                    controller: username,
                    decoration: InputDecoration(
                      label: Text('Username'),
                    ),
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: ElevatedButton(
            onPressed: () {
              if (userForm.currentState!.validate()) {
                SignUpController.createAccount(
                  context: context,
                  username: username.text,
                  password: password.text,
                  Email: Email.text,
                );
              }
            },
            child: const Text('Create Account'),
          ),
        ),
      ]),
    );
  }
}
