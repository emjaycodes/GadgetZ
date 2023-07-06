import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oga_bassey/screens/home/home_screen.dart';
import 'package:oga_bassey/screens/splash/IntroScreen.dart';

class AuthenticationFlowScreen extends StatelessWidget {
  const AuthenticationFlowScreen({super.key});
  static String id = 'main screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: This StreamBuilder is useless since you handle Navigation again
      // normally in the app. To implement what you have in mind, a you'll have
      // to use a Bloc to handle authentication. Then you can use a listener on
      // the Bloc.
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return const IntroScreen();
          }
        },
      ),
    );
  }
}
