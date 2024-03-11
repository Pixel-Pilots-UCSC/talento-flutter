import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFF3EB489),
    hintColor: Colors.blue,
    dividerColor: Colors.white54,
    colorScheme: ColorScheme.light(
      primary: Colors.blue, // A blue color for primary elements
      secondary: Colors.teal, // A teal color for secondary elements
      background: Colors.white, // A white background
      surface: Colors.white, // A slightly lighter surface color
      error: Colors.red, // A red accent color for errors
      onPrimary: Colors.blue, // Text color on primary elements
      onSecondary: Colors.white, // Text color on secondary elements
      onBackground: Colors.black, // Text color on background
      onSurface: Colors.black, // Text color on surface
      onError: Colors.white, // Text color on error
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black
    ),
    inputDecorationTheme: InputDecorationTheme(
      //no border
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFF3EB489),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      filled: true,
      fillColor: Color(0XFFF5F9FE),
      labelStyle: const TextStyle(
        color: Colors.black,
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF3EB489)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),

          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Color(0xFF7C8BA0)),
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
    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xFF3EB489),
      inactiveTrackColor: Colors.grey,
      thumbColor: Color(0xFF3EB489),
      overlayColor: Color(0x293EB489),
      valueIndicatorColor: Color(0xFF3EB489),
      valueIndicatorTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black,
        fontFamily: GoogleFonts. inter().fontFamily,
        fontSize: 14,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white24,
      selectedColor: Color(0xFF00EC9E),
      secondarySelectedColor: Colors.grey[200],
      surfaceTintColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey[500]!,
          width: 1,
        ),
      ),
      labelPadding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 5,
      ),

      labelStyle: TextStyle(
        color: Colors.grey[800],
      ),
      secondaryLabelStyle: TextStyle(
        color: Colors.white,
      ),
      brightness: Brightness.dark,
    ),

  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Color(0xFF048658),
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
    drawerTheme: const DrawerThemeData(
      surfaceTintColor: Colors.black,
      elevation: 0,
      backgroundColor: Colors.black,
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
      iconColor: Colors.white,
      suffixIconColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF3EB489)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Color(0xFF303C4E),
            ),
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Color(0xFF7C8BA0)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          Colors.white
        ),
        iconColor: MaterialStateProperty.all(
          Colors.white
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Color(0XFF404040)),
      checkColor: MaterialStateProperty.all(Colors.white),
      side: const BorderSide(
        color: Colors.white10,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    cardColor: Colors.black,
    cardTheme: const CardTheme(
      color: Colors.black,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.black,
      textColor: Colors.grey[400]!,
      contentPadding: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white24,
      selectedColor: Color(0xFF00603F),
      secondarySelectedColor: Colors.grey[200],
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.white38!,
          width: 0.5,
        ),
      ),
      labelStyle: TextStyle(
        color: Colors.grey[200],
      ),
      secondaryLabelStyle: TextStyle(
        color: Colors.black,
      ),
      brightness: Brightness.dark,
    ),
  );
}
