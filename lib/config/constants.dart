import 'package:flutter/material.dart';

import 'theme/text_theme.dart';

class AppColors {
  static const Color kPrimaryColor = Color.fromARGB(255, 196, 19, 49);
  static const Color kPrimaryVariant = Color.fromARGB(255, 255, 131, 152);
  static const Color kSecondaryColor = Colors.black12;
  static const Color kSecondaryColorVariant =
      Color.fromARGB(255, 255, 116, 139);
  static const Color kDarkColor = Color.fromARGB(255, 0, 0, 0);

   
}



class AppTheme {
  static ColorScheme colorScheme = ColorScheme(
    primary: const Color.fromARGB(255, 196, 19, 49) ,
    secondary: Colors.grey.shade300,
    onPrimary: const Color.fromARGB(255, 196, 19, 49),
    onSecondary: Colors.grey.shade300,
    brightness: Brightness.light,
    error: Colors.red,
    onError: Colors.red,
    background: Colors.grey.shade300,
    onBackground: Colors.grey.shade300,
    surface: Colors.white,
    onSurface: Colors.white,
  );
  
  static final defaultTheme = ThemeData.light().copyWith(
    primaryColor: const Color.fromARGB(255, 196, 19, 49),
    scaffoldBackgroundColor: Colors.grey.shade300,
    appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 196, 19, 49)),
    brightness: Brightness.light,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 196, 19, 49),
      
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Rubik',
          letterSpacing: -0.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        minimumSize: const Size.fromHeight(48),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Rubik',
          letterSpacing: -0.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        side: BorderSide(
          width: 2,
          color:
              colorScheme.onSurface.withOpacity(0.12), // Default configuration
        ),
        minimumSize: const Size.fromHeight(48),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          fontFamily: 'Rubik',
          letterSpacing: -0.2,
        ),
      ),
    ),
    textTheme: buildTextTheme(const Color.fromARGB(255, 255, 255, 255)),

      );
  static final darkTheme = ThemeData.light().copyWith(
    primaryColor: Colors.black12,
    scaffoldBackgroundColor: Colors.grey.shade800,
    appBarTheme: const AppBarTheme(color: Colors.black12),
    brightness: Brightness.dark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black12,
      
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Rubik',
          letterSpacing: -0.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        minimumSize: const Size.fromHeight(48),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Rubik',
          letterSpacing: -0.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        side: BorderSide(
          width: 2,
          color:
              colorScheme.onSurface.withOpacity(0.12), // Default configuration
        ),
        minimumSize: const Size.fromHeight(48),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          fontFamily: 'Rubik',
          letterSpacing: -0.2,
        ),
      ),
    ),
    textTheme: buildTextTheme(const Color.fromARGB(255, 255, 255, 255)),

      );
      
}


ThemeData lightThemeData(BuildContext context) {
   ColorScheme colorScheme = ColorScheme(
    primary: const Color.fromARGB(255, 196, 19, 49) ,
    secondary: Colors.grey.shade300,
    onPrimary: const Color.fromARGB(255, 196, 19, 49),
    onSecondary: Colors.grey.shade300,
    brightness: Brightness.light,
    error: Colors.red,
    onError: Colors.red,
    background: Colors.grey.shade300,
    onBackground: Colors.grey.shade300,
    surface: Colors.white,
    onSurface: Colors.white,
  );

  return ThemeData.light().copyWith(
    colorScheme: colorScheme,
    primaryColor: colorScheme.primary,
    primaryColorLight: colorScheme.primary,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Rubik',
          letterSpacing: -0.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        minimumSize: const Size.fromHeight(48),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Rubik',
          letterSpacing: -0.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        side: BorderSide(
          width: 2,
          color:
              colorScheme.onSurface.withOpacity(0.12), // Default configuration
        ),
        minimumSize: const Size.fromHeight(48),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          fontFamily: 'Rubik',
          letterSpacing: -0.2,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: colorScheme.secondary,
      ),
    ),
    textTheme: buildTextTheme(const Color.fromARGB(255, 255, 255, 255)),
  );
}