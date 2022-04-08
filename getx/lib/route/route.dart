import 'package:get/get.dart';
import '../screens/first_screen.dart';
import '../screens/second_screen.dart';

const String firstScreen = "/first-screen";
const String secondScreen = "/second-screen";

List<GetPage> getPages = [
  GetPage(
      name: firstScreen,
      page: () => const FirstScreen(),
      transition: Transition.size),
  GetPage(
      name: secondScreen,
      page: () => SecondScreen(),
      transition: Transition.downToUp)
];
