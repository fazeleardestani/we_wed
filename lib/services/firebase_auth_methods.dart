import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:we_wed/component/show_snack_bar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);
  //EMAIL SIGNUP
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        showSnackBar(context, "its weak password");
      }
    }
  }
}
