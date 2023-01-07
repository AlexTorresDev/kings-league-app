import 'package:flutter/material.dart';

class AppTheme {
  static final defaultLightColorScheme = ColorScheme.light(
    primary: const Color(0xFFCD5500),
    primaryContainer: Colors.blueAccent,
    secondary: const Color(0xFFFF6900),
    secondaryContainer: Colors.teal.shade100,
    background: Colors.white,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.black,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
  );

  static final defaultDarkColorScheme = ColorScheme.dark(
    primary: const Color(0xFFCD5500),
    primaryContainer: Colors.blueAccent,
    secondary: const Color(0xFFFF6900),
    secondaryContainer: Colors.teal.shade100,
    background: Colors.black,
    surface: Colors.black,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.white,
    onSurface: Colors.white,
    error: Colors.red,
    onError: Colors.white,
  );
}
