import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_wed/resources/auth_methods.dart';
import 'package:we_wed/widgets/show_snack_bar.dart';
import 'package:we_wed/widgets/text_field.dart';
import 'package:we_wed/routes/names.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import '../../controller/login_controller.dart';
import '../../gen/assets.gen.dart';

class LogInScreen extends StatelessWidget {
  final logInController controller = Get.put(logInController());

  LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    void loginUser() async {
      String res = await AuthMethods().loginUser(
          email: controller.emailController.text,
          password: controller.passwordController.text);
      if (res != 'success') {
        // ignore: use_build_context_synchronously
        showSnackBar(context, res);
      } else {
        Get.offAndToNamed(NamedRoute.mainScreen);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(Assets.images.wewedLogo.path),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextFieldWidget(
                  hintText: MyStrings.emailAddress,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxColor: Natural.defaultColor,
                  borderColor: SolidColors.grey50,
                  height: hight / 16.91,
                  textEditingController: controller.emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomTextFieldWidget(
                  textEditingController: controller.passwordController,
                  isPass: true,
                  textInputType: TextInputType.text,
                  hintText: MyStrings.password,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxColor: Natural.defaultColor,
                  borderColor: SolidColors.grey50,
                  height: hight / 16.91,
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 48,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () async {
                      loginUser();
                    },
                    child: Text(
                      MyStrings.login,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.dontHaveAnAccount,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offAndToNamed(NamedRoute.signUp);
                        },
                        child: const Text(
                          MyStrings.register,
                          style: TextStyle(
                            color: SolidColors.violetPrimery,
                            fontSize: 14,
                            fontFamily: 'Iranyekan',
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  color: SolidColors.grey100,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 16,
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
                            MyStrings.loginrWithGoogle,
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
