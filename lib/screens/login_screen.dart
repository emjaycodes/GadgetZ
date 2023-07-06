
import 'package:flutter/material.dart';
import 'package:oga_bassey/components/custom_button.dart';
import 'package:oga_bassey/components/email_textfield.dart';
import 'package:oga_bassey/components/password_textfield.dart';
import 'package:oga_bassey/components/social_media_card.dart';
import 'package:oga_bassey/components/textfield_names.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/forgot_password/forgot_password.dart';
import 'package:oga_bassey/screens/signup_screen.dart';
import 'package:oga_bassey/services/auth_services.dart';

import 'home/home_screen.dart';

final AuthService authService = AuthService();

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

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ksmallSizedbox,
              // text that says create account

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
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

              const SizedBox(
                height: 20,
              ),
              // that says email
              const TextfieldName(
                text: 'Email address',
              ),
              const SizedBox(
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
                      child: const Text(
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
                      authService.signInUser(emailController.text,
                          passwordController.text, context);
                      Navigator.popAndPushNamed(context, HomeScreen.id);
                    } catch (e) {
                      print(e);
                    }
                  }),

              kbigSizedbox,

              // row with divider with a text 'row'
              const Row(
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
                      socialImage: const AssetImage('images/google.png'),
                    ),
                    const SocialMediaCard(
                      socialImage: AssetImage('images/apple.png'),
                    ),
                    const SocialMediaCard(
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
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                      //showSigupPage;
                      Navigator.pushReplacementNamed(context, SignupBody.id);
                    },
                    child: const Text(
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
