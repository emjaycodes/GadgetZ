
import 'package:flutter/material.dart';

class ConstantKey {
  // ignore: constant_identifier_names
  static const String PAYSTACK_KEY = "pk_test_291cd3614d62fa2ab67955bd533f1d210660212d";
}

const ksecondaryColor = Color(0xFFE30008);
const kprimaryColor = Color(0xFF081658);
const kprimaryTextColor = Color(0xFF37474F);
const ksecondaryTextColor = Color(0xFF7F90A0);
const kdisabledButtonColor = Color(0xFFDBDFE4);
const ktertiaryColor = Color(0xFFDBDFE4);

const kbigSizedbox = SizedBox(height: 20);
const ksmallSizedbox = SizedBox(height: 10);

 TextStyle textboxNameStyle() {
    return const TextStyle(
            color: kprimaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          );
  }

TextStyle ksignupbuttonTextStyle(){
  return const TextStyle(
    fontSize: 15,
    color: Color(0xFF081658),
    fontWeight: FontWeight.w500,
    );
}

TextStyle kloginbuttonTextStyle(){
  return const TextStyle(
    fontSize: 15,
    color: ktertiaryColor,
    fontWeight: FontWeight.w500,
    );
}
     

const kdivider = SizedBox(
              height: 12, 
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F8FA)                  ),
                  ),
              );