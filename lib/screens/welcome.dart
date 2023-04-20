// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/login_body.dart';

import 'package:oga_bassey/screens/signup_body.dart';

import 'package:oga_bassey/components/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeSreenState();
}

class _WelcomeSreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/ip.png'),
            fit: BoxFit.cover,
          )),
        ),
        Positioned(
            // bottom: 70,
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.7),
              kprimaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        )),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // row wit a text and image
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 17)),
                  Text(
                    'welcome to',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset('images/logo.png')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Buy Gadgets Now Pay Later',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 170),

              SizedBox(height: 20),
              //a sign up elevated button
              CustomButtom(
                  buttonName: 'Signup',
                  buttonColor: ktertiaryColor,
                  textStyle: ksignupbuttonTextStyle(),
                  onPressed: () {
                    Navigator.pushNamed(context, SignupBody.id);
                  }),

              kbigSizedbox,

              // another sign up elevated button
              CustomButtom(
                buttonName: 'Login',
                buttonColor: kprimaryColor,
                textStyle: kloginbuttonTextStyle(),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              )
            ],
            // another text
          ),
        )
      ],
    ));
  }
}
