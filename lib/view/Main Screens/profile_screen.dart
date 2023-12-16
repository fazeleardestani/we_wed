import 'package:flutter/material.dart';
import 'package:we_wed/resources/auth_methods.dart';
import 'package:we_wed/widgets/text_field.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import 'package:we_wed/models/user_model.dart' as model;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<model.User>(
      future: AuthMethods().getUserDetails(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final info = snapshot.data!;
          double height = MediaQuery.of(context).size.height;
          return SizedBox(
            height: double.infinity,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, height / 34, 20, 0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                      width: 70,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6Q9YY4_qube_mEewgH_CLcMzNEC4cEe-6t35qv-2U9oSjlWubZVGCaoOhRJlPR65tuK0&usqp=CAU"),
                      ),
                    ),
                    profileTextField(
                      context,
                      height,
                      TextInputType.name,
                      info.name,
                      MyStrings.name,
                    ),
                    SizedBox(
                      height: height / 34,
                    ),
                    profileTextField(
                      context,
                      height,
                      TextInputType.emailAddress,
                      info.email,
                      MyStrings.emailAddress,
                    ),
                    SizedBox(
                      height: height / 34,
                    ),
                    profileTextField(
                      context,
                      height,
                      TextInputType.text,
                      info.password,
                      MyStrings.password,
                    ),
                    SizedBox(
                      height: height / 34,
                    ),
                    profileTextField(
                      context,
                      height,
                      TextInputType.datetime,
                      info.weddingDate,
                      MyStrings.weddingTime,
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () async {
                          await AuthMethods().signOut();
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
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Column profileTextField(
    BuildContext context,
    double height,
    TextInputType textInputType,
    String hintText,
    String labelText,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).inputDecorationTheme.labelStyle,
          textAlign: TextAlign.right,
        ),
        CustomTextFieldWidget(
          hintText: hintText,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxColor: Natural.defaultColor,
          borderColor: SolidColors.grey50,
          height: height / 16.91,
          textInputType: textInputType,
          textEditingController:
              TextEditingController(), // added required parameter
          readOnly: true, // Adjust as needed
        ),
      ],
    );
  }
}
