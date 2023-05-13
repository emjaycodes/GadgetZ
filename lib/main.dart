import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/auth/main_page.dart';
import 'package:oga_bassey/screens/forgot_password/components/email_notication.dart';
import 'package:oga_bassey/screens/forgot_password/forgot_password.dart';
import 'package:oga_bassey/screens/login_body.dart';

import 'package:oga_bassey/screens/new_password/new_password.dart';
import 'package:oga_bassey/screens/product_screen/product_screen.dart';
import 'package:oga_bassey/screens/signup_body.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:oga_bassey/screens/splash/splash.dart';
import 'package:oga_bassey/screens/home/home_screen.dart';

import 'components/utils.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ScaffoldMessengerkey:
    // Utils.messengerKey;
    return MaterialApp(
      title: 'Oga Bassey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:kprimaryColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        //inputTextField Style
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xFFDBDFE4))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kprimaryColor),
          ),
        ),
      ),
      initialRoute: MainPage.id,
      routes: {
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        EmailNotifierScreen.id: (context) => const EmailNotifierScreen(),
        NewPasswordScreen.id: (context) => const NewPasswordScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProductScreen.id: (context) => const ProductScreen(),
        MainPage.id: (context) => const MainPage(),
        LoginScreen.id:(context) => LoginScreen(),
        SignupBody.id:(context) => const SignupBody(),
        SplashScreen.id:(context) => SplashScreen(),
      },
    );
  }
}
