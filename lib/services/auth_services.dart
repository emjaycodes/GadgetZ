import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:oga_bassey/screens/login_screen.dart';
import 'package:oga_bassey/services/Error_dialog_helpers.dart';

import '../screens/home/home_screen.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInUser(
      String email, String password, BuildContext context) async {
    //show loading
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //signin the user
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      // TODO: All these popping for login and signup screens are unneccessary.
      // If you want to remove all screens under,
      // use Navigator.of(context).pushAndRemoveUntil() or popUntil();

      Navigator.of(context).pushNamedAndRemoveUntil(
        HomeScreen.id,
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      //wrong email
      if (e.code == 'user-not-found') {
        DialogHelper.showWrongEmailDialog(context);
        print('no user found for that email');
      } else if (e.code == 'wrong-password') {
        DialogHelper.showWrongPasswordDialog(context);
        print('wrong password buddy');
      }
      rethrow;
    }
  }

   // TODO: Extract the sign in and sign up functions to service or Bloc files
  Future signUpUser(String email, String password, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      // TODO: I don't think signing up is signin in. After successful signin up,
      // re-route to sign in screen or call signin function.
        Navigator.of(context).pushNamedAndRemoveUntil(
        LoginScreen.id,
        (Route<dynamic> route) => false,
        );

    } on FirebaseAuthException catch (e) {
      // TODO: Handle the error visually. Maybe show a SnackBar
      
      const message = 'An error occurred. Please try again.'; // Error message to display in the SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(message)),
    );
      print(e);
      rethrow;
    }
    // TODO: I can't figure out these poppings. If the signin was not successful,
    // you should remove the CircularProgressIndicator. In fact, you should not use
    // AlertDialog to cover the screen. Bad UX cos the user can dismiss it.
    // You should create a cover controlled by a bool or a Bloc manually.

    // removed the if mounted for now : justice
      Navigator.pop(context);
  }
 
 
  // TODO: Google sign in and sign up not working. App not registered.
  //  Google the error message for how to solve it.
  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    Future<GoogleSignInAccount?> handleGoogleSignIn() async {
      
      try {
        return googleSignIn.signIn();
      } catch (error) {
        print(error);
        rethrow;
      }
    }

    final GoogleSignInAccount? gUser = await handleGoogleSignIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for users
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


}
