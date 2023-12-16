import 'package:get/get.dart';
import 'package:we_wed/models/user_model.dart' as model;
import 'package:we_wed/resources/auth_methods.dart';

class UserController extends GetxController {
  late String name = '';
  late String email = '';
  late String password = '';
  late String weddingDate = '';

  Future<model.User> getUserInfo() async {
    model.User info = await AuthMethods().getUserDetails();
    name = info.name;
    email = info.email;
    password = info.password;
    weddingDate = info.weddingDate;
    return info;
  }
}

