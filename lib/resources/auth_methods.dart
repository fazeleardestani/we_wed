import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:we_wed/models/user_model.dart' as model;
import 'package:we_wed/utils/my_strings.dart';
import 'dart:developer';
class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
    model.User snap = model.User.fromSnap(snapshot);
    return snap;
  }

  //sign up method
  Future<String> signUPUser({
    required String name,
    required String email,
    required String password,
  }) async {
    
    String res = MyStrings.checkInformation;
    try {
      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
        //register the user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //add user to database
        model.User user = model.User(
          uid: credential.user!.uid,
          name: name,
          email: email,
          password: password,
          weddingDate: '',
        );
        _firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
        res = "success";
      } else {
        res = MyStrings.enterAllTheFields;
      }
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          res = MyStrings.invalidEmail;
        case 'weak-password':
          res = MyStrings.weakPassword;
        case 'email-already-in-use':
          res = MyStrings.emailAlreadyInUse;
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  //logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = MyStrings.checkInformation;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = MyStrings.enterAllTheFields;
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        res = MyStrings.invalidEmail;
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future updateUser({
    String? name,
    String? newData,
  }) async {
    User currentUser = _auth.currentUser!;
   await _firestore.collection('users').
        doc(currentUser.uid)
        .update({'$name': newData})
        .then((value) => log("User Updated"))
        .catchError((error) => log("Failed to update user: $error"));
  }
}
