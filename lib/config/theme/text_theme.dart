import 'package:flutter/material.dart';

TextTheme buildTextTheme(Color baseColor) {
  var baseTextStyle = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.2,
    color: baseColor,
  );

  return TextTheme(
    // Display
    displayLarge: baseTextStyle.copyWith(
      fontSize: 57,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
    ),
    displayMedium: baseTextStyle.copyWith(
      fontSize: 45,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.4,
    ),
    displaySmall: baseTextStyle.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
    ),

    // Headline
    headlineLarge: baseTextStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: baseTextStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),

    // Title
    titleLarge: baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),

    // Label
    labelLarge: baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: baseTextStyle.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),

    // Body
    bodyLarge: baseTextStyle.copyWith(
      fontSize: 16,
    ),
    bodyMedium: baseTextStyle.copyWith(
      fontSize: 14,
    ),
    bodySmall: baseTextStyle.copyWith(
      fontSize: 12,
    ),

    // Button
  );
}
