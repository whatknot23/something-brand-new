import 'package:email_password_firebase_authentication/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../helper/auth_helper.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: box.read('email')),
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
