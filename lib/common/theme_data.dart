import 'package:coffee_shop/common/app_color.dart';
import 'package:flutter/material.dart';

final themeDataLigth = ThemeData(
  primaryColor: primary,
  appBarTheme: const AppBarTheme(
    backgroundColor: primary,
    foregroundColor: textColor,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      side: const MaterialStatePropertyAll(
        BorderSide(color: primary),
      ),
      overlayColor: const MaterialStatePropertyAll(hover),
      foregroundColor: const MaterialStatePropertyAll(primary),
      backgroundColor: const MaterialStatePropertyAll(textColor),
      elevation: const MaterialStatePropertyAll(0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(primary),
      foregroundColor: const MaterialStatePropertyAll(textColor),
      elevation: const MaterialStatePropertyAll(0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  ),
);
