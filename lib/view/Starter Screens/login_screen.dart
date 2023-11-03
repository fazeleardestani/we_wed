import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_wed/component/text_field.dart';
import 'package:we_wed/route_manager/names.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import '../../controller/login_controller.dart';
import '../../gen/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
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
                    onPressed: () {},
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
                          Get.offAndToNamed(NamedRoute.register);
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
