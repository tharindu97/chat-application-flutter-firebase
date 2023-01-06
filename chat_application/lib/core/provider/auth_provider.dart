import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  User? authenticationUserDetails;
  setAuthenticationUserDetails(User user) {
    authenticationUserDetails = user;
    notifyListeners();
  }
}
