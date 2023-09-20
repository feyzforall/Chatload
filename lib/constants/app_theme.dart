import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.frenchPass,
  scaffoldBackgroundColor: Colors.black,
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.frenchPass,
    indicatorColor: Colors.white,
  ),
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
