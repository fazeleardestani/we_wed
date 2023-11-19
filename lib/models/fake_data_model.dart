import 'package:we_wed/gen/assets.gen.dart';

class CategoryModel {
  int id;
  String imagePath;
  String title;

  CategoryModel({
    required this.id,
    required this.imagePath,
    required this.title,
  });
}

class UserModel {
  int id;
  String imagePath = Assets.images.userProfile.path;
  String name;
  String email;
  String password;
  String weddingTime;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.weddingTime,
  });
}
