import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(
        Colors.black,
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
  ),
);
