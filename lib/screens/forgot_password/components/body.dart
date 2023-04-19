// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:oga_bassey/components/email_textfield.dart';
import 'package:oga_bassey/components/textfield_names.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/components/custom_button.dart';
import 'package:oga_bassey/screens/forgot_password/components/email_notication.dart';
import 'package:oga_bassey/screens/login/login.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //text
            kbigSizedbox,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  child: Text('Forgot password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kprimaryColor,
                      )),
                ),
              ],
            ),

            kbigSizedbox,
            //text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Text(
                'Enter the email address associated wth your account to reset your password.',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: ksecondaryTextColor),
              ),
            ),

            kbigSizedbox,

            //textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextfieldName(text: 'Email address'),
            ),

            ksmallSizedbox,
            EmailTextfield(),
            kbigSizedbox,
            CustomButtom(
                buttonName: "Forgot password",
                buttonColor: kprimaryColor,
                textStyle: kloginbuttonTextStyle(),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmailNotifierScreen()));
                }),

            kbigSizedbox,
            //text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Return to',
                  style: TextStyle(
                    color: ksecondaryTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    ' Login',
                    style: TextStyle(
                      color: kprimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
