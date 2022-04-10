import 'languages/languages.dart';
import 'screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/register_user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  //form validation key and password passed.
  final _formKey = GlobalKey<FormState>();
  final _givenPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //Localizaation with Getx.
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('bn', 'BD'),
      title: 'Flutter Demo',
      //Theme design
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shadowColor: const Color.fromARGB(255, 0, 0, 0),
                visualDensity: const VisualDensity(horizontal: 1, vertical: 0),
                elevation: 2,
                primary: const Color.fromARGB(43, 53, 50, 50))),
        primarySwatch: Colors.blueGrey,
        textTheme:
            GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme.apply()),
      ),
      //Route
      home: RegisterScreen(formKey: _formKey, givenPass: _givenPass),
      initialRoute: '/',
      routes: {
        '/home_screen': (context) => const HomeScreen(),
      },
    );
  }
}
