import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oga_bassey/constants.dart';

class AppTheme {
  
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: kprimaryColor
    )
    // primaryColor: kprimaryColor,
    // hintColor: ksecondaryColor,
    // fontFamily: GoogleFonts.poppins().fontFamily,
    // //inputTextField Style
    // inputDecorationTheme: const InputDecorationTheme(
    //   enabledBorder: OutlineInputBorder(
    //       borderSide: BorderSide(width: 2, color: Color(0xFFDBDFE4))),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: kprimaryColor),
    //   ),
    // ),

    // ... other light mode colors and settings
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: ktertiaryColor
    )
    // primaryColor: kprimaryColor,
    // hintColor: ksecondaryColor,
    // ... other dark mode colors and settings
  );

  // static Color getPrimaryColor(BuildContext context) {
  //   final Brightness brightness = MediaQuery.of(context).platformBrightness;
  //   final bool isDark = brightness == Brightness.dark;

  //   return isDark ? darkTheme.primaryColor : lightTheme.primaryColor;
  // }

  // static Color getSecondaryColor(BuildContext context) {
  //   final Brightness brightness = MediaQuery.of(context).platformBrightness;
  //   final bool isDark = brightness == Brightness.dark;

  //   return isDark ? darkTheme.hintColor : lightTheme.hintColor;
  // }

  // ... other color getters
}
