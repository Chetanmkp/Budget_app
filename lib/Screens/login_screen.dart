import 'package:chatbox/Controllers/login_controller.dart';
import 'package:chatbox/Screens/dashboard.dart';
import 'package:chatbox/Screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            AnimatedBuilder(
                animation: opacity,
                builder: (context, child) {
                  return Opacity(
                    opacity: opacity.value,
                    child: login(username, password),
                  );
                }),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignupScreen();
                }));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  Text("Signup", style: TextStyle(color: Colors.blue))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget login(TextEditingController username, TextEditingController password) {
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
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (userForm) {
                      if (userForm == null || userForm.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                    controller: username,
                    decoration: InputDecoration(
                      label: Text('Username'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
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
                  child: ElevatedButton(
                    onPressed: () {
                      if (userForm.currentState!.validate()) {
                        LoginController.createAccount(
                            context: context,
                            username: username.text,
                            password: password.text);
                      }
                    },
                    child: const Text('LOGIN'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
