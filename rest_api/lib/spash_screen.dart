import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crud_adhoc/walk_through.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splashTransition: SplashTransition.sizeTransition,
      animationDuration: const Duration(milliseconds: 2000),
      curve: Curves.fastLinearToSlowEaseIn,
      duration: 500,
      splash: Image.asset('assets/image 16.png'),
      nextScreen: const BottomNavControl(),
    );
  }
}
