// import 'package:flutter/material.dart';
// import 'package:we_wed/models/user_model.dart';
// import 'package:we_wed/resources/auth_methods.dart';

// class UserProvider with ChangeNotifier {
//   User? _user;
//   final AuthMethods _authMethods = AuthMethods();

//   User get getUser => _user!;

//   Future<void> refreshUser() async {
//     try {
//       User user = await _authMethods.getUserDetails();
//       _user = user;
//       notifyListeners();
//     } catch (e) {
//       ("Error fetching user details: $e");
//     }
//   }
// }
