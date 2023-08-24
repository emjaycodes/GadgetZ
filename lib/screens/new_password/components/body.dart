// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/components/textfield_names.dart';
import 'package:oga_bassey/components/custom_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          kbigSizedbox,
          // text that says create new pasword
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Text('Create new password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),

          kbigSizedbox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Your new password must be differnt from previous used passwords',
              style: textboxNameStyle(),
            ),
          ),

          kbigSizedbox,

          SizedBox(
            height: 20,
          ),
          // that says new password
          TextfieldName(
            text: 'New password',
          ),
          SizedBox(
            height: 10,
          ),
          // textfield
          // PasswordTextfield(),
          kbigSizedbox,
          // text that says passsword
          TextfieldName(
            text: 'Confirm password',
          ),
          ksmallSizedbox,
          // textfield with icon
          // PasswordTextfield(),

          kbigSizedbox,

          // sign up buttun
          CustomButtom(
              buttonName: 'Reset password',
              buttonColor: kprimaryColor,
              textStyle: kloginbuttonTextStyle(),
              onPressed: () {})
        ],
      ),
    ));
  }
}
