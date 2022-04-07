import 'package:get/get.dart';
import '../first_screen.dart';
import '../second_screen.dart';

const String firstScreen = "/first-screen";
const String secondScreen = "/second-screen";

List<GetPage> getPages = [
  GetPage(
      name: firstScreen,
      page: () => FirstScreen(),
      transition: Transition.circularReveal),
  GetPage(
      name: secondScreen,
      page: () => SecondScreen(),
      transition: Transition.circularReveal)
];
