// import 'package:firebase_auth/firebase_auth.dart';
import 'package:we_wed/models/fake_data_model.dart';
import '../gen/assets.gen.dart';
import '../utils/my_strings.dart';

List<CategoryModel> categoryList = [
  CategoryModel(
      id: 1,
      imagePath: Assets.icons.talarCategory.path,
      title: MyStrings.talarCategory),
  CategoryModel(
      id: 2,
      imagePath: Assets.icons.arayeshgahCategory.path,
      title: MyStrings.arayeshgahCategory),
  CategoryModel(
      id: 3,
      imagePath: Assets.icons.photographyCategory.path,
      title: MyStrings.photographyCategory),
  CategoryModel(
      id: 4,
      imagePath: Assets.icons.mashinCategory.path,
      title: MyStrings.carCategory),
  CategoryModel(
      id: 5,
      imagePath: Assets.icons.cakeCategory.path,
      title: MyStrings.cakeCategory),
  CategoryModel(
      id: 6,
      imagePath: Assets.icons.lebasCategory.path,
      title: MyStrings.lebasCategory),
];
