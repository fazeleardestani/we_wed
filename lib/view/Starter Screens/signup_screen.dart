import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_wed/resources/auth_methods.dart';
import 'package:we_wed/widgets/show_snack_bar.dart';
import 'package:we_wed/widgets/text_field.dart';
import 'package:we_wed/controller/signup_controller.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import '../../gen/assets.gen.dart';
import '../../routes/names.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void signUPUser() async {
      String res = await AuthMethods().signUPUser(
          name: controller.nameController.text,
          email: controller.emailController.text,
          password: controller.passwordController.text);
      if (res != 'success') {
        // ignore: use_build_context_synchronously
        showSnackBar(context, res);
      } else {
        Get.offAndToNamed(NamedRoute.pickDate);
      }
    }

    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.wewedLogo.path, height: height / 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextFieldWidget(
                  hintText: MyStrings.name,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxColor: Natural.defaultColor,
                  borderColor: SolidColors.grey50,
                  height: height / 16.91,
                  textEditingController: controller.nameController,
                  textInputType: TextInputType.name,
                ),
                SizedBox(
                  height: height / 33.9,
                ),
                CustomTextFieldWidget(
                  hintText: MyStrings.emailAddress,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxColor: Natural.defaultColor,
                  borderColor: SolidColors.grey50,
                  height: height / 16.91,
                  textEditingController: controller.emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: height / 33.9,
                ),
                CustomTextFieldWidget(
                  textEditingController: controller.passwordController,
                  isPass: true,
                  textInputType: TextInputType.text,
                  hintText: MyStrings.password,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxColor: Natural.defaultColor,
                  borderColor: SolidColors.grey50,
                  height: height / 16.91,
                ),
                SizedBox(
                  height: height / 33.9,
                ),
                CustomTextFieldWidget(
                  hintText: MyStrings.confirmPassword,
                  isPass: true,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxColor: Natural.defaultColor,
                  borderColor: SolidColors.grey50,
                  height: height / 16.91,
                  textEditingController: controller.confirmPasswordController,
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: height / 33.9,
                ),
                Container(
                  height: 48,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () async {
                      if (controller.passwordController.text ==
                          controller.confirmPasswordController.text) {
                        signUPUser();
                      } else {
                        showSnackBar(context, MyStrings.checkPassword);
                      }
                    },
                    child: Text(
                      MyStrings.register,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 67.67,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.haveAnAccount,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offAndToNamed(NamedRoute.signIn);
                        },
                        child: const Text(
                          MyStrings.login,
                          style: TextStyle(
                            color: SolidColors.violetPrimery,
                            fontSize: 14,
                            fontFamily: 'Iranyekan',
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: height / 90,
                ),
                const Divider(
                  color: SolidColors.grey100,
                  thickness: 1,
                ),
                SizedBox(
                  height: height / 70,
                ),
                Container(
                  height: 48,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          return SolidColors.grey50;
                        }),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.icons.google.path),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            MyStrings.registerWithGoogle,
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
