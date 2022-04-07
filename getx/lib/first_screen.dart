import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/model/user.dart';
import 'package:getx/second_screen.dart';

class FirstScreen extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  final box = GetStorage();

  FirstScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () => Get.to(SecondScreen()),
            icon: const Icon(Icons.arrow_forward))
      ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
              ),
              TextField(
                controller: _ageController,
              ),
              ElevatedButton(
                onPressed: () {
                  final name = _nameController.text;
                  final age = _ageController.text;
                  box.write('data', User(name: name, age: age));
                  if (kDebugMode) {
                    print("All good");
                  }
                },
                child: const Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
