// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oga_bassey/components/custom_button.dart';
import 'package:oga_bassey/components/email_textfield.dart';
import 'package:oga_bassey/components/password_textfield.dart';
import 'package:oga_bassey/components/social_media_card.dart';
import 'package:oga_bassey/components/textfield_names.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/forgot_password/forgot_password.dart';
import 'package:oga_bassey/screens/signup_body.dart';
import 'package:oga_bassey/services/auth_services.dart';

import 'home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  // final VoidCallback showSigupPage;

  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //signInUser
  Future<void> signInUser() async {
    //show loading
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (mounted) {
        // TODO: All these popping for login and signup screens are unneccessary.
        // If you want to remove all screens under,
        // use Navigator.of(context).pushAndRemoveUntil() or popUntil();
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      //wrong email
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
        print('no user found for that email');
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
        print('wrong password buddy');
      }
      rethrow;
    }
  }

  // wrong email message pupup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Incorrect password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ksmallSizedbox,
              // text that says create account

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
              EmailTextfield(
                emailController: emailController,
              ),
              kbigSizedbox,
              // text that says passsword
              PasswordTextfield(
                passwordController: passwordController,
              ),
              ksmallSizedbox,
              // textfield with icon
              // PasswordTextfield(),

              // text that says forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                        style: TextStyle(
                          color: kprimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kbigSizedbox,

              // login up buttun
              CustomButtom(
                  buttonName: 'Login',
                  buttonColor: kdisabledButtonColor,
                  textStyle: ksignupbuttonTextStyle(),
                  onPressed: () {
                    try {
                      signInUser();
                      Navigator.popAndPushNamed(context, HomeScreen.id);
                    } catch (e) {
                      print(e);
                    }
                  }),

              kbigSizedbox,

              // row with divider with a text 'row'
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
                      onTap: () {
                        AuthService().signInWithGoogle();
                      },
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //showSigupPage;
                      Navigator.pushNamed(context, SignupBody.id);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: kprimaryColor,
                        // fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
