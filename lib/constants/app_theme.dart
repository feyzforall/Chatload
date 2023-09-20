import 'app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.frenchPass,
  scaffoldBackgroundColor: Colors.black,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.frenchPass,
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(
        Colors.black,
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    centerTitle: true,
    foregroundColor: Colors.white,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: AppColors.codGray,
    hintStyle: TextStyle(
      color: Colors.white,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(64.0),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(64.0),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(64.0),
      ),
      borderSide: BorderSide(
        color: AppColors.frenchPass,
      ),
    ),
  ),
);
