import 'package:email_password_firebase_authentication/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../helper/auth_helper.dart';
import 'home.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                controller: _email,
              ),
              TextField(
                controller: _password,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    final userEmail = _email.text;
                    final userPassword = _password.text;
                    var obj = AuthHelper();
                    obj.sighIn(userEmail, userPassword, context);
                    MotionToast.success(
                      title: Text("Successful"),
                      description: Text("userEmail has successfully signed in"),
                      width: 300,
                      toastDuration: const Duration(seconds: 2),
                      animationDuration: const Duration(seconds: 2),
                    ).show(context);
                  },
                  child: Text("Sign In")),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignUp()));
                  },
                  child: Text("Sign Up for new account")),
            ],
          ),
        ),
      ),
    );
  }
}
