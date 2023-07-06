import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/auth/main_page.dart';
import 'package:oga_bassey/screens/forgot_password/components/email_notication.dart';
import 'package:oga_bassey/screens/forgot_password/forgot_password.dart';
import 'package:oga_bassey/screens/home/home_screen.dart';
import 'package:oga_bassey/screens/login_screen.dart';
import 'package:oga_bassey/screens/new_password/new_password.dart';
import 'package:oga_bassey/screens/product_screen/product_screen.dart';
import 'package:oga_bassey/screens/signup_screen.dart';
import 'package:oga_bassey/screens/splash/splash.dart';

import 'blocs/product_bloc/product_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    BlocProvider<ProductBloc>(
      // NOTE: The Bloc must be created once and accessed from anywhere in
      // the app through BlocProvider.of<T>(context) or context.read<T>().
      // It will be autodisposed by the BlocProvider when the app is closed.
      create: (context) => ProductBloc(),
      child: const MyApp(),
    ),
  );
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
        primaryColor: kprimaryColor,
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
      // TODO: Pay attention to the navigation stack. Splash screen should be under
      // login screen. When you move to Sign up screen, login screen should be replaced with
      // sign up screen. When you finally move to home screen, Nothing should be under.
      // Using a StreamBuilder is not the best way.
      initialRoute: MainPage.id,
      routes: {
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        EmailNotifierScreen.id: (context) => const EmailNotifierScreen(),
        NewPasswordScreen.id: (context) => const NewPasswordScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProductScreen.id: (context) => const ProductScreen(),
        MainPage.id: (context) => const MainPage(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignupBody.id: (context) => const SignupBody(),
        SplashScreen.id: (context) => SplashScreen(),
      },
    );
  }
}
