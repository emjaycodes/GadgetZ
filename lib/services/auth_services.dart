import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oga_bassey/models/user_model.dart';

class AuthService {
  final fb_auth.FirebaseAuth _firebaseAuth = fb_auth.FirebaseAuth.instance;

 Future <UserModel?> getCurrentUser() async {
    final fb_auth.User? firebaseUser = _firebaseAuth.currentUser;

    if (firebaseUser != null) {
      return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName ?? '');
    }
    return null;
  }

  Future<void> signInUser(
    String email,
    String password,
  ) async {
    //signin the user
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  Future signUpUser(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on fb_auth.FirebaseAuthException catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> signOutUser() async {
    await fb_auth.FirebaseAuth.instance.signOut();
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
    final credential = fb_auth.GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await fb_auth.FirebaseAuth.instance.signInWithCredential(credential);
  }
}


// Navigator.pop(context);

      // //wrong email
      // if (e.code == 'user-not-found') {
      //   DialogHelper.showWrongEmailDialog(context);
      //   print('no user found for that email');
      // } else if (e.code == 'wrong-password') {
      //   DialogHelper.showWrongPasswordDialog(context);
      //   print('wrong password buddy');
      // }

      // const message =
      //     'An error occurred. Please try again.'; // Error message to display in the SnackBar
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text(message)),
      // );