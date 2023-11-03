import 'package:flutter/material.dart';
import '../utils/my_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    ////////////////////////////////////////////
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        color: SolidColors.grey300,
        fontSize: 12,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: SolidColors.grey50,
          width: 1,
        ),
      ),
      labelStyle: const TextStyle(
        color: SolidColors.grey300,
        fontSize: 12,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w400,
      ),
      suffixIconColor: SolidColors.grey200,
    ),
    ////////////////////////////////////////////
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return SolidColors.violetPrimery;
        }),
        textStyle: MaterialStateProperty.resolveWith((states) {
          return TextStyle(
            color: Natural.defaultColor,
            fontSize: 14,
            fontFamily: 'Iranyekan',
            fontWeight: FontWeight.w500,
          );
        }),
      ),
    ),
    ///////////////////////////////////////////
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: SolidColors.violetPrimery,
            textStyle: TextStyle(
              color: Natural.defaultColor,
              fontSize: 14,
              fontFamily: 'Iranyekan',
              fontWeight: FontWeight.w500,
            ))),

    //////////////////////////////////////////
    fontFamily: 'Iranyekan',
    brightness: Brightness.light,
    hintColor: SolidColors.violetPrimery,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: SolidColors.grey900,
        fontSize: 14,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        
        color: SolidColors.grey900,
        fontSize: 16,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        color: SolidColors.grey900,
        fontSize: 14,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        color: SolidColors.grey500,
        fontSize: 14,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        color: SolidColors.grey900,
        fontSize: 14,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: SolidColors.grey900,
        fontSize: 13,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w300,
      ),
      titleMedium: TextStyle(
        color: SolidColors.grey900,
        fontSize: 12,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: SolidColors.grey700,
        fontSize: 14,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        color: SolidColors.grey700,
        fontSize: 14,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: SolidColors.grey500,
        fontSize: 10,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: SolidColors.violetText,
        fontSize: 16,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: SolidColors.violet600,
        fontSize: 11,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: SolidColors.violetPrimery,
        fontSize: 12,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        color: SolidColors.violetPrimery,
        fontSize: 14,
        fontFamily: 'Iranyekan',
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
