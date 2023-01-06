import 'package:chat_application/core/provider/auth_provider.dart';
import 'package:chat_application/feature/authentication/service/authentication_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  authProvider.authenticationUserDetails!.photoURL ?? "",
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(authProvider.authenticationUserDetails!.displayName ??
              "display name"),
          Text(authProvider.authenticationUserDetails!.email ?? "email"),
          Text(authProvider.authenticationUserDetails!.uid),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              AuthenticationServiceImpl().logout();
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Text("LogOut"),
            ),
          ),
        ],
      ),
    );
  }
}
