import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'store_read_data.dart';
import '../route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(StoreData()).initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: firstScreen,
      getPages: getPages,
    );
  }
}
