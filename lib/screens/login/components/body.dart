// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:oga_bassey/components/custom_text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/components/social_media_card.dart';
import 'package:oga_bassey/components/textfield_names.dart';
import 'package:oga_bassey/screens/forgot_password/forgot_password.dart';
import 'package:oga_bassey/screens/sign_up/signup.dart';
import 'package:oga_bassey/components/custom_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          ksmallSizedbox,
          // text that says create account

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Login to your account',
                    style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          kbigSizedbox,
          kdivider,

          SizedBox(
            height: 20,
          ),
          // that says email
          TextfieldName(
            text: 'Email address',
          ),
          SizedBox(
            height: 10,
          ),
          // textfield
          EmailTextfield(),
          kbigSizedbox,
          // text that says passsword
          TextfieldName(
            text: 'Password',
          ),
          ksmallSizedbox,
          // textfield with icon
          PasswordTextfield(),

          // text that says forgot password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ForgotPasswordScreen.id);
                  },
                  child: Text(
                    'forgot password?',
                  ),
                ),
              ],
            ),
          ),
          kbigSizedbox,

          // sign up buttun
          CustomButtom(
              buttonName: 'Login',
              buttonColor: kdisabledButtonColor,
              textStyle: ksignupbuttonTextStyle(),
              onPressed: () {}),

          kbigSizedbox,

          // row wit divder with a text 'row'
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 7,
                  width: 165,
                  child: Divider(
                    thickness: 5,
                    color: Color(0xFFF5F5F5),
                    // indent: 1,
                    endIndent: 10,
                  )),

              // SizedBox(width: 45),
              // text 'or'
              Text('OR'),

              SizedBox(
                  height: 7,
                  width: 175,
                  child: Divider(
                    thickness: 5,
                    color: Color(0xFFF5F5F5),
                    indent: 10,
                  )),
            ],
          ),

          kbigSizedbox,
          //row with three svg buttons

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialMediaCard(
                  socialImage: AssetImage('images/google.png'),
                ),
                SocialMediaCard(
                  socialImage: AssetImage('images/apple.png'),
                ),
                SocialMediaCard(
                  socialImage: AssetImage('images/facebook.png'),
                )
              ],
            ),
          ),

          kbigSizedbox,

          // 2 texts on a row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? ',
                style: TextStyle(
                  color: ksecondaryTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignupScreen.id);
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: kprimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}

// class TextfieldName extends StatelessWidget {

//   // ignore: use_key_in_widget_constructors
//   const TextfieldName({ required this.text, });

//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: [
//         Text( text,
//       style: textboxNameStyle(),
//       ),
//         ],
//       ),
//     );
//   }
// }
