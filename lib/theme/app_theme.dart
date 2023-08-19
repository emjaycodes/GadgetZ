import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oga_bassey/constants.dart';

class AppTheme {
  
  static final lightTheme = ThemeData(
    primaryColor: kprimaryColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
     inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Color(0xFFDBDFE4))),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kprimaryColor),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: kprimaryColor,
      background: ksecondaryColor
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
    primaryColor: ksecondaryColor,
    colorScheme: ColorScheme.dark(
      primary: ktertiaryColor
    )
  );

 
}
