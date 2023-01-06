import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationService {
  Future<UserCredential> signInWithGoogle(BuildContext context);
  logout();
}
