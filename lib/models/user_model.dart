import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String weddingDate;

  const User({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    this.weddingDate = "",
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'password': password,
        'widding_date': '',
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        uid: snapshot['uid'],
        name: snapshot['name'],
        email: snapshot['email'],
        password: snapshot['password']);
  }
}
