import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oga_bassey/constants.dart';

class AppTheme {
  
  static final lightTheme = ThemeData(
    primaryColor: kprimaryColor,  // Adjust primary color
    hintColor: kprimaryColor,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 24,
        color: kprimaryTextColor, // Set the text color here
        fontWeight: FontWeight.bold,
      ),
    ),
     inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Color(0xFFDBDFE4))),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kprimaryColor),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kwhiteColor
    ),
    colorScheme: const ColorScheme.light(
      primary: kprimaryColor,
      background: kwhiteColor,
      secondary: kwhiteColor,
      tertiary: kprimaryColor,
      primaryContainer: ktertiaryColor,
      onPrimaryContainer: kwhiteColor
    )

  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,

    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Color(0xFFDBDFE4))),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kprimaryColor),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
    ),
    colorScheme:  ColorScheme.dark(
      primary:  Colors.grey[900]!,
      secondary: kwhiteColor,
      background: Colors.black,
      tertiary: kwhiteColor,
      primaryContainer: Colors.grey[900]!,
      onPrimaryContainer: Colors.grey,
      secondaryContainer: ksecondaryColor,
    )
  );


    static ThemeData getThemeData(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    return themeMode == Brightness.dark ? darkTheme : lightTheme;
  }
 
}
