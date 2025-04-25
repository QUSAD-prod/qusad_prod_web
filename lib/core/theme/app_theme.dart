import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: const Color(0xFFF5F5F5),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF121212),
      onPrimary: Colors.white,
      secondary: Color(0xFF7C4DFF),
      onSecondary: Colors.white,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Color(0xFF2C2C2C)),
      bodySmall: TextStyle(fontFamily: 'JetBrainsMono', fontSize: 14, color: Color(0xFF757575)),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF000000),
    cardColor: const Color(0xFF1E1E1E),
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      onPrimary: Color(0xFF121212),
      secondary: Color(0xFF7C4DFF),
      onSecondary: Colors.white,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Color(0xFFE0E0E0)),
      bodySmall: TextStyle(fontFamily: 'JetBrainsMono', fontSize: 14, color: Color(0xFFB0B0B0)),
    ),
  );
}
