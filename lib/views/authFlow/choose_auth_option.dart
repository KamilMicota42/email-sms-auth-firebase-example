import 'package:flutter/material.dart';

import 'signup_email_password.dart';

class ChooseAuthOptionView extends StatelessWidget {
  const ChooseAuthOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: mediaQueryWidth - 50,
              child: FloatingActionButton(
                child: const Text('Sign up with email and password'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpEmailPasswordView(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
