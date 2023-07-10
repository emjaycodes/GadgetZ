import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oga_bassey/blocs/auth_bloc/authentication_bloc.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/auth/auth_flow_screen.dart';
import 'package:oga_bassey/screens/favourite_screen.dart';
import 'package:oga_bassey/screens/forgot_password/components/email_notication.dart';
import 'package:oga_bassey/screens/forgot_password/forgot_password.dart';
import 'package:oga_bassey/screens/home/home_screen.dart';
import 'package:oga_bassey/screens/login_screen.dart';
import 'package:oga_bassey/screens/new_password/new_password.dart';
import 'package:oga_bassey/screens/product_screen/product_screen.dart';
import 'package:oga_bassey/screens/signup_screen.dart';
import 'package:oga_bassey/screens/splash/IntroScreen.dart';

import 'blocs/product_bloc/product_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      // NOTE: The Bloc must be created once and accessed from anywhere in
      // the app through BlocProvider.of<T>(context) or context.read<T>().
      // It will be autodisposed by the BlocProvider when the app is closed.
    
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      initialRoute: AuthenticationFlowScreen.id,
      routes: {
        IntroScreen.id: (context) => const IntroScreen(),
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        EmailNotifierScreen.id: (context) => const EmailNotifierScreen(),
        NewPasswordScreen.id: (context) => const NewPasswordScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProductScreen.id: (context) => const ProductScreen(),
        AuthenticationFlowScreen.id: (context) => const AuthenticationFlowScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignupBody.id: (context) => const SignupBody(),
        FavouriteScreen.id:(context) => const FavouriteScreen(),
      },
    );
  }
}
