import 'package:chat_application/core/provider/auth_provider.dart';
import 'package:chat_application/feature/authentication/service/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class AuthenticationServiceImpl extends AuthenticationService {
  @override
  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      Provider.of<AuthProvider>(context, listen: false)
          .setAuthenticationUserDetails(userCredential.user!);

      userCredential.user;
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  logout() {
    try {
      FirebaseAuth.instance.signOut();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
