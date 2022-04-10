import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController givenPass,
  })  : _formKey = formKey,
        _givenPass = givenPass,
        super(key: key);
  //Validation keys. form key and password key using controller for password match
  final GlobalKey<FormState> _formKey;
  final TextEditingController _givenPass;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Switch state to toggle language
  bool toggleSwitch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Align(alignment: Alignment.center, child: Text("translate".tr)),
            Switch(
                value: toggleSwitch,
                onChanged: (_) {
                  setState(() {
                    toggleSwitch = _;
                    if (toggleSwitch) {
                      Get.updateLocale(const Locale('bn', 'BD'));
                    } else {
                      Get.updateLocale(const Locale('en', 'US'));
                    }
                  });
                })
          ],
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              //imported get.dart to use '.tr'
              'register_page'.tr,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: widget._formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(labelText: 'user_name'.tr),
                    //used regex for validation
                    validator: ((value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-zA-Z]{4,15}').hasMatch(value)) {
                        return "Enter correct username";
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "email_address".tr),
                    validator: ((value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                              .hasMatch(value)) {
                        return "Enter correct email address";
                      }
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    //controller to store input
                    controller: widget._givenPass,
                    //auto validate so that its easy for user to varify correct format.
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    //obsecure to hide password
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(labelText: "password".tr),
                    validator: ((value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
                              .hasMatch(value)) {
                        return "Enter correct password";
                      }
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration:
                        InputDecoration(labelText: "confirm_password".tr),
                    //password matching condition
                    validator: ((value) {
                      if (value != widget._givenPass.text) {
                        return "Password did not match";
                      }
                    }),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                          onPressed: () {
                            if (widget._formKey.currentState!.validate()) {
                              //snackbar used as log
                              const snackBar = SnackBar(
                                content: Text("submitting..."),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              //Navigator used to change route
                              Navigator.pushNamed(context, "/home_screen");
                            }
                          },
                          child: Text(
                            "submit".tr,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
