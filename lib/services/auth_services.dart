import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oga_bassey/models/user_model.dart';

class AuthService {
  final fb_auth.FirebaseAuth _firebaseAuth = fb_auth.FirebaseAuth.instance;

  UserModel? getCurrentUser() {
    final fb_auth.User? firebaseUser = _firebaseAuth.currentUser;

    if (firebaseUser != null) {
      return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName ?? '');
    }
    return null;
  }

 /// sign in the user
  Future<UserModel?> signInUser(
    String email,
    String password,
  ) async {
   
    try {
      final fb_auth.UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final fb_auth.User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return UserModel(
            id: firebaseUser.uid,
            email: firebaseUser.email ?? '',
            displayName: firebaseUser.displayName ?? '');
      }
    } catch (e) {
      print('sign in error: $e');
    }
    return null;
  }

  Future<UserModel?> signUpUser(
    String email,
    String password,
  ) async {
    try {
      final fb_auth.UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final fb_auth.User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName ?? '',
        );
      }
    } on fb_auth.FirebaseAuthException catch (e) {
      print(e);
      rethrow;
    }
    return null;
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
