import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oga_bassey/screens/home/home_screen.dart';
import 'package:oga_bassey/screens/login/login.dart';
import 'package:oga_bassey/screens/sign_up/signup.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static String id = 'auth screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
             return HomeScreen();
          }
          else {
            return const SignupScreen();
          }
        },
        
        ),
    );
  }
}
