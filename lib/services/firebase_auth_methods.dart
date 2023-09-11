import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/show_snackbar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // EMAIL SIGN UP
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      context.mounted
          ? await sendEmailVerification(context)
          : debugPrint('context not mounted on - sendEmailVerification');
    } on FirebaseAuthException catch (e) {
      debugPrint(
          e.toString()); // Possible to give custom messages for diff e.codes

      context.mounted
          ? showSnackBar(context, e.toString())
          : debugPrint('context not mounted on - showSnackBar');
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
