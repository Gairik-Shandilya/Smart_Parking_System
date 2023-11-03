import 'package:flutter/material.dart';
import 'package:smart_parking_system/auth/login_page.dart';
import 'package:smart_parking_system/auth/register_page.dart';

class AuthPageNew extends StatefulWidget {
  const AuthPageNew({super.key});

  @override
  State<AuthPageNew> createState() => _AuthPageNewState();
}

class _AuthPageNewState extends State<AuthPageNew> {
  bool showLoginPage = true;
  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreen);
    } else {
      return RegisterPage(showLoginPage: toggleScreen);
    }
  }
}
