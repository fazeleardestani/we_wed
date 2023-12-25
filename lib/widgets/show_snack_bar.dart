import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_wed/utils/my_colors.dart';

void showSnackBar(String status, String content, Color textColor) {
  Get.snackbar(
    status,
    content,
    snackStyle: SnackStyle.FLOATING,
    colorText: textColor,
    backgroundColor: SolidColors.violet50,
    overlayBlur: 0,
    barBlur: 0,
  );
}
