import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // TODO: Google sign in and sign up not working. App not registered.
  //  Google the error message for how to solve it.
  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    Future<GoogleSignInAccount?> handleSignIn() async {
      try {
        return googleSignIn.signIn();
      } catch (error) {
        print(error);
        rethrow;
      }
    }

    final GoogleSignInAccount? gUser = await handleSignIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for users
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
