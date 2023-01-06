import 'package:chat_application/feature/authentication/service/authentication_service_impl.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            await AuthenticationServiceImpl().signInWithGoogle(context);
          },
          child: Container(
            height: 50,
            width: 100,
            decoration: const BoxDecoration(color: Colors.red),
            child: const Text("Sign in with Google"),
          ),
        ),
      ),
    );
  }
}
