import 'package:email_sms_auth_firebase_example/services/firebase_auth_methods.dart';
import 'package:email_sms_auth_firebase_example/utils/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpEmailPasswordView extends StatefulWidget {
  const SignUpEmailPasswordView({super.key});

  @override
  State<SignUpEmailPasswordView> createState() =>
      _SignUpEmailPasswordViewState();
}

class _SignUpEmailPasswordViewState extends State<SignUpEmailPasswordView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
  }

  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
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
                  const Text('Sign Up'),
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
                  TextField(
                    decoration:
                        const InputDecoration(hintText: 'Repeat your password'),
                    controller: repeatPasswordController,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: mediaQueryWidth - 100,
                    child: FloatingActionButton(
                      child: const Text('Sign up'),
                      onPressed: () {
                        if (passwordController.text ==
                            repeatPasswordController.text) {
                          signUpUser();
                        } else {
                          showSnackBar(
                            context,
                            'Password and repeat password values are not the same',
                          );
                        }
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
