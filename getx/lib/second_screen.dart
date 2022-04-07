import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SecondScreen extends StatelessWidget {
  final box = GetStorage();

  SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () => print(box.read('data')),
            child: const Text("print")),
      ),
    );
  }
}
