import 'dart:async';

import 'package:email_password_firebase_authentication/views/sign_up.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SignUp()));
    });
    return const Scaffold(
      body: Center(child: Icon(Icons.alarm)),
    );
  }
}
