import 'package:flutter/material.dart';
import 'package:we_wed/utils/my_colors.dart';

// ignore: must_be_immutable
class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final bool isPass;
  final bool readOnly;
  final bool autofocus;
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
  final int maxLines;

  CustomTextFieldWidget({
    super.key,
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
    this.readOnly = false,
    this.autofocus = true,
    required this.textInputType,
    this.maxLines = 1
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        style: const TextStyle(fontFamily: 'IRANYekan'),
        obscureText: isPass,
        readOnly: readOnly,
        autofocus: autofocus,
        maxLines: maxLines,
        keyboardType: textInputType,
        controller: textEditingController,
        onChanged: (value) {
          // Handle the text input changes here if needed
        },
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
