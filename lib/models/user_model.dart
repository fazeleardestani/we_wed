import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? uid;
  final String? name;
  final String? email;
  final String password;
  final String weddingDate;
  int totalCost;

  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.totalCost,
    this.password = "",
    this.weddingDate = "",
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'displayName': name,
        'email': email,
        'password': password,
        'totalCost': totalCost,
      };

  factory User.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    String password = snapshot['password'] ?? "";

    return User(
      uid: snapshot['uid'],
      name: snapshot['displayName'],
      email: snapshot['email'],
      password: password,
      weddingDate: snapshot['weddingDate'],
      totalCost: snapshot['totalCost'] ?? 0,
    );
  }
}
