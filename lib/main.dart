import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/forgot_password/components/body.dart';
import 'package:oga_bassey/screens/forgot_password/components/email_notication.dart';
import 'package:oga_bassey/screens/forgot_password/forgot_password.dart';
import 'package:oga_bassey/screens/login/login.dart';
import 'package:oga_bassey/screens/new_password/new_password.dart';
import 'package:oga_bassey/screens/sign_up/signup.dart';
import 'package:oga_bassey/screens/splash/splash.dart';
import 'package:oga_bassey/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oga Bassey',
      theme: ThemeData(
        //inputTextField Style
         inputDecorationTheme:  const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide( width: 2, color: Color(0xFFDBDFE4))
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide( color: kprimaryColor),
         ),
      ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context) => const WelcomeScreen(),
        SignupScreen.id:(context) => const SignupScreen(),
        LoginScreen.id:(context) => const LoginScreen(),
        ForgotPasswordScreen.id:(context) => const ForgotPasswordScreen(),
        EmailNotifierScreen.id:(context) => const EmailNotifierScreen(),
        NewPasswordScreen.id: (context) => const NewPasswordScreen(),
        // SplashScreen.id:(context) => const SplashScreen(),
      },
      
    );
  }
}