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
}
