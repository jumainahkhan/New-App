import 'package:flutter/material.dart';
import 'package:news_app/Screens/LogInScreen/components/login_screen_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const LoginScreenBody();
  }
}
