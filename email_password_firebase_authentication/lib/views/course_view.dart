// ignore_for_file: prefer_const_constructors

import '../controller/payment_controller.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class CourseView extends StatefulWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  var obj = PaymentController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => obj.makePayment(amount: '5', currency: 'USD'),
          child: Text('Make A Payment'),
        ),
      ),
    );
  }
}
