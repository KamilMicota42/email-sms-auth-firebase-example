import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/firebase_auth_methods.dart';

class LoginEmailPasswordView extends StatefulWidget {
  const LoginEmailPasswordView({super.key});

  @override
  State<LoginEmailPasswordView> createState() => _LoginEmailPasswordViewState();
}

class _LoginEmailPasswordViewState extends State<LoginEmailPasswordView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 50),
            child: IconButton.filled(
              disabledColor: Colors.deepPurple,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: SizedBox(
              width: mediaQueryWidth - 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Log in'),
                  const SizedBox(height: 30),
                  TextField(
                    decoration:
                        const InputDecoration(hintText: 'Enter your email'),
                    controller: emailController,
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration:
                        const InputDecoration(hintText: 'Enter your password'),
                    controller: passwordController,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: mediaQueryWidth - 100,
                    child: FloatingActionButton(
                      child: const Text('Sign up'),
                      onPressed: () {
                        loginUser();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
