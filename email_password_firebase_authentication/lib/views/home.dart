import 'package:email_password_firebase_authentication/views/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SignIn())),
              icon: Icon(Icons.logout_rounded))
        ]),
        body: Center(
          child: Text("Home"),
        ));
  }
}
