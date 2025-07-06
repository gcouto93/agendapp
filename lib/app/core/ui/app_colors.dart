import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF786FB6,
    <int, Color>{
      50: Color(0xFFEDEBFA),
      100: Color(0xFFD2CEF2),
      200: Color(0xFFB5AFE9),
      300: Color(0xFF988FE0),
      400: Color(0xFF8377D9),
      500: Color(0xFF786FB6), // Primary
      600: Color(0xFF6C63A4),
      700: Color(0xFF5C548C),
      800: Color(0xFF4C4474),
      900: Color(0xFF39325A),
    },
  );

  static const Color primary = Color(0xFF786FB6);
  static const Color primaryDark = Color(0xFF5C548C);
  static const Color primaryLight = Color(0xFFD2CEF2);
  static const Color secondary = Color(0xFFC3B1E1);
  static const Color background = Colors.white;
  static const Color error = Color(0xFFE57373);
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF757575);
  static const Color inversePrimary = Color.fromARGB(255, 34, 112, 223);
  static const Color sand = Color.fromRGBO(249, 244, 241, 1);
}
