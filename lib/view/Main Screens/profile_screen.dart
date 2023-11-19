import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_wed/widgets/text_field.dart';
import 'package:we_wed/models/fake_data.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    RxBool nameReadOnly = true.obs;
    RxBool passwordReadOnly = true.obs;
    RxBool emailReadOnly = true.obs;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(20, height / 34, 20, 0),
        child: Column(
          children: [
            profileTextFiled(context, height, nameReadOnly, TextInputType.name,
                userList[0].name, MyStrings.name),
            SizedBox(
              height: height / 34,
            ),
            profileTextFiled(
                context,
                height,
                emailReadOnly,
                TextInputType.emailAddress,
                userList[0].email,
                MyStrings.emailAddress),
            SizedBox(
              height: height / 34,
            ),
            profileTextFiled(context, height, passwordReadOnly,
                TextInputType.text, userList[0].password, MyStrings.password),
            SizedBox(
              height: height / 34,
            ),
            profileTextFiled(
                context,
                height,
                emailReadOnly,
                TextInputType.datetime,
                userList[0].weddingTime,
                MyStrings.weddingTime),
            SizedBox(
              height: height / 34,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Container(
                height: 48,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    nameReadOnly.value = false;
                    passwordReadOnly.value = false;
                  },
                  child: Text(
                    MyStrings.editInformation,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  //TODO: logout
                },
                child: const Text(
                  MyStrings.logout,
                  style: TextStyle(
                    color: SolidColors.violetText,
                    fontSize: 14,
                    fontFamily: 'Iranyekan',
                    fontWeight: FontWeight.w500,
                  ),
                )),
                SizedBox(
                  height: height / 10.5,
                )
          ],
        ),
      )),
    );
  }

  Column profileTextFiled(BuildContext context, double height, RxBool readOnly,
      TextInputType textInputType, String hintText, String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).inputDecorationTheme.labelStyle,
          textAlign: TextAlign.right,
        ),
        Obx(() => CustomTextFieldWidget(
              hintText: hintText,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxColor: Natural.defaultColor,
              borderColor: SolidColors.grey50,
              height: height / 16.91,
              textInputType: textInputType,
              textEditingController: null,
              readOnly: readOnly.value,
            )),
      ],
    );
  }
}
