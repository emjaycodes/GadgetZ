// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oga_bassey/components/email_textfield.dart';
import 'package:oga_bassey/components/textfield_names.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/components/custom_button.dart';
import 'package:oga_bassey/screens/forgot_password/components/email_notication.dart';
import 'package:oga_bassey/screens/login_screen.dart';


class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  final emailController = TextEditingController();

  void resetPasword() async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });

      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      emailMessageError(e);
    }
  }

  void emailMessageError(error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(error),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //text
              kbigSizedbox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
              TextfieldName(text: 'Email address'),
              ksmallSizedbox,
        
              //emailtextfield
              EmailTextfield(
                emailController: emailController,
              ),
              kbigSizedbox,
              CustomButtom(
                  buttonName: "Forgot password",
                  buttonColor: kprimaryColor,
                  textStyle: kloginbuttonTextStyle(),
                  onPressed: () {
                    resetPasword();
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
      ),
    );
  }
}
