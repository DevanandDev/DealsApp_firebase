import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  final _auth = FirebaseAuth.instance;
  final CollectionReference users = FirebaseFirestore.instance.collection(
    'users',
  );

  Future<User?> registerService({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userData.user != null) {
        users.add({'name': name, 'email': email, 'userId': userData.user!.uid});
      }
      return userData.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'no data';
    }
  }

  Future<User?> loginService({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userData = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password);

      return userData.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw 'The email address is badly formatted.';
        case 'user-disabled':
          throw 'This account has been disabled.';
        case 'user-not-found':
          throw 'No account found with this email.';
        case 'wrong-password':
          throw 'Incorrect password. Please try again.';
        default:
          throw 'Login failed. Please try again later.';
      }
    } catch (e) {
      throw 'An unexpected error occure, pleace try again';
    }
  }


  Future<UserCredential?> loginGoogle() async {
  try {
    final gooleUser = await GoogleSignIn().signIn();
    final googleAuth = await gooleUser!.authentication;
    final cred = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await _auth.signInWithCredential(cred);
  } catch (e) {
  throw 'Google sign-in failed, try again';
  }
}
}


