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
    inputDecorationTheme: InputDecorationTheme(
      //no border
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      filled: true,
      fillColor: Colors.grey[200]!,
      labelStyle: const TextStyle(
        color: Colors.black,
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.white),
      checkColor: MaterialStateProperty.all(Colors.black),
      side: const BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),

  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.white,
    hintColor: Colors.blue,
    dividerColor: Colors.black12,
    colorScheme: ColorScheme.dark(
      primary: Colors.blue, // A blue color for primary elements
      secondary: Colors.teal, // A teal color for secondary elements
      background: Colors.black, // A white background
      surface: Colors.grey[200]!, // A slightly lighter surface color
      error: Colors.red, // A red accent color for errors
      onPrimary: Colors.blue, // Text color on primary elements
      onSecondary: Colors.white, // Text color on secondary elements
      onBackground: Colors.white, // Text color on background
      onSurface: Colors.black, // Text color on surface
      onError: Colors.white, // Text color on error
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      //no border
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      filled: true,
      fillColor: Colors.white10,
      labelStyle: const TextStyle(
        color: Colors.black,
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.white),
      checkColor: MaterialStateProperty.all(Colors.black),
      side: const BorderSide(
        color: Colors.white10,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}
