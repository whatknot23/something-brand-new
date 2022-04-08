import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/model/user.dart';
import 'package:getx/store_read_data.dart';

import '../route/route.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _ageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () => Get.toNamed(secondScreen),
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
                  child: const Text("Add"),
                  onPressed: () {
                    final user = User(
                        userName: _nameController.text,
                        userAge: _ageController.text);
                    Get.find<StoreData>().storeData(user);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
