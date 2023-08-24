import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';

void showSnackbarMessage(String message,IconData? icon, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        height: 80,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Icon(icon, color: ktertiaryColor, size: 40,),
              Text(message),
            ],
          ),
        )),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 1),
    ),
  );
}
