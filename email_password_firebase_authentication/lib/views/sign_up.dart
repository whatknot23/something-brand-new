import 'package:email_password_firebase_authentication/helper/auth_helper.dart';
import 'package:email_password_firebase_authentication/views/sign_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
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
                    final userEmail = _email;
                    final userPassword = _password;
                    var obj = AuthHelper();
                    obj.sighUp(userEmail.text, userPassword.text, context);
                  },
                  child: Text("Sign Up")),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignIn()));
                  },
                  child: Text("Login for existing account")),
            ],
          ),
        ),
      ),
    );
  }
}
