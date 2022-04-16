import 'dart:async';

import 'package:email_password_firebase_authentication/views/home.dart';
import 'package:email_password_firebase_authentication/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  GetStorage box = GetStorage();
  choseScreen(context) async {
    if (box.read('id') != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SignUp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      choseScreen(context);
    });
    return const Scaffold(
      body: Center(child: Icon(Icons.alarm)),
    );
  }
}
