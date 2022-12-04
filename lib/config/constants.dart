import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimaryColor = Color.fromARGB(255, 196, 19, 49);
  static const Color kPrimaryVariant = Color.fromARGB(255, 255, 131, 152);
  static const Color kSecondaryColor = Colors.black12;
  static const Color kSecondaryColorVariant =
      Color.fromARGB(255, 255, 116, 139);
  static const Color kDarkColor = Color.fromARGB(255, 0, 0, 0);
}

class AppTheme {
  static final defaultTheme = ThemeData(
      // scaffoldBackgroundColor: Colors.grey.shade300,
      primaryColor: const Color.fromARGB(255, 196, 19, 49),
      appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 196, 19, 49)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 196, 19, 49),
      ),
      brightness: Brightness.light);
      
  static final darkTheme = ThemeData(
      // scaffoldBackgroundColor: Colors.grey.shade700,
      primaryColor: Colors.black12,
      appBarTheme: const AppBarTheme(color: Colors.black12),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black12,
      ),
      brightness: Brightness.dark);
}
