import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_wed/utils/my_colors.dart';

class CustomTextFieldController extends GetxController {
  var textEditingController = TextEditingController();
}

// ignore: must_be_immutable
class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final TextInputType textInputType;
  String? hintText;
  Color? hintTextColor;
  Color? boxColor;
  Color borderColor;
  Widget? myIcon;
  BorderRadius? borderRadius;
  double height;
  double? width;
  double? heightScale;
  double? widthtScale;
  double? padding;

  CustomTextFieldWidget({
    Key? key,
    this.padding,
    this.heightScale,
    this.widthtScale,
    this.myIcon,
    this.boxColor,
    required this.borderColor,
    this.borderRadius,
    this.hintText,
    this.hintTextColor,
    required this.height,
    this.width,
    required this.textEditingController,
    this.isPass = false,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CustomTextFieldController());

    return SizedBox(
      width: width,
      child: TextFormField(
        style: const TextStyle(fontFamily: 'IRANYekan'),
        obscureText: isPass,
        keyboardType: textInputType,
        controller: textEditingController,
        onChanged: (value) {
          // Handle the text input changes here if needed
        },
        // style: selectedTextFieldTextStyle, TODO: style: selectedTextField
        decoration: InputDecoration(
          fillColor: boxColor,
          filled: true,
          hintText: hintText,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          prefixIcon: heightScale != null || widthtScale != null
              ? Transform.scale(
                  scaleX: widthtScale,
                  scaleY: heightScale,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: padding ?? 0,
                      right: padding ?? 0,
                    ),
                    child: myIcon,
                  ),
                )
              : myIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.zero,
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.zero,
            borderSide: const BorderSide(color: SolidColors.violetPrimery),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.zero,
            borderSide: BorderSide(color: borderColor),
          ),
        ),
      ),
    );
  }
}
