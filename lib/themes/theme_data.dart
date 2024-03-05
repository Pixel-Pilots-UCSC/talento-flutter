import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    hintColor: Colors.blue,
    dividerColor: Colors.white54,
    colorScheme: ColorScheme.light(
      primary: Colors.blue, // A blue color for primary elements
      secondary: Colors.teal, // A teal color for secondary elements
      background: Colors.white, // A white background
      surface: Colors.grey[200]!, // A slightly lighter surface color
      error: Colors.red, // A red accent color for errors
      onPrimary: Colors.blue, // Text color on primary elements
      onSecondary: Colors.white, // Text color on secondary elements
      onBackground: Colors.black, // Text color on background
      onSurface: Colors.black, // Text color on surface
      onError: Colors.white, // Text color on error
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    hintColor: Colors.blue,
    dividerColor: Colors.black12,
    colorScheme: ColorScheme.dark(
      primary: Colors.deepPurple, // A deep purple color for primary elements
      secondary: Colors.teal, // A teal color for secondary elements
      background: Colors.grey[900]!, // Dark grey background
      surface: Colors.grey[800]!, // Slightly lighter surface color
      error: Colors.redAccent, // A red accent color for errors
      onPrimary: Colors.green, // Text color on primary elements
      onSecondary: Colors.white, // Text color on secondary elements
      onBackground: Colors.white, // Text color on background
      onSurface: Colors.white, // Text color on surface
      onError: Colors.white, // Text color on error
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),

  );
}
