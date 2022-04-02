import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Too many variables taken. Not sure how to restructure it :/
  //NEW: Learnt about window.physicalSize and window.devicePixelRatio (very helpful)

  var greenScreenHeight = window.physicalSize.height / window.devicePixelRatio;
  var greenScreenWidth = window.physicalSize.width / window.devicePixelRatio;
  Color? _greenColor = Colors.green[700];
  var redScreenHeight = window.physicalSize.height / window.devicePixelRatio;
  var redScreenWidth = window.physicalSize.width / window.devicePixelRatio;
  Color? _redColor = Colors.red[300];
  var blueScreenHeight = window.physicalSize.height / window.devicePixelRatio;
  var blueScreenWidth = window.physicalSize.width / window.devicePixelRatio;
  Color? _blueColor = Colors.blue[300];
  FontWeight _fontWeight = FontWeight.w200;
  double _fontsize = 11;

  //In order to disable button
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 3),
            alignment: Alignment.topCenter,
            height: greenScreenHeight / 3,
            width: greenScreenWidth,
            color: _greenColor,
            curve: Curves.bounceInOut,
            child: const RiveAnimation.asset(
              'assets/lumberjack_squats.riv',
              animations: ['Demo'],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: AnimatedContainer(
                duration: const Duration(seconds: 3),
                alignment: Alignment.center,
                height: blueScreenHeight / 15,
                width: blueScreenWidth / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: _blueColor,
                ),
                curve: Curves.slowMiddle,
                child: AnimatedDefaultTextStyle(
                  child: const Text("Task Completed!"),
                  style:
                      TextStyle(fontWeight: _fontWeight, fontSize: _fontsize),
                  curve: Curves.elasticInOut,
                  duration: const Duration(seconds: 3),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              alignment: Alignment.center,
              height: redScreenHeight / 4,
              width: redScreenWidth / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: _redColor),
              curve: Curves.slowMiddle,
              child: AnimatedDefaultTextStyle(
                child: const Text(
                  "Form Validation & user's input\n\nRoute & Navigation\n\nGoogle Fonts & Custom Fonts\n\nLocalization with Getx\n\nTheme\n\nAnimations\n\nFlutter Responsive Design",
                ),
                style: TextStyle(
                  fontWeight: _fontWeight,
                  fontSize: _fontsize,
                ),
                curve: Curves.elasticInOut,
                duration: const Duration(seconds: 3),
              ),
            ),
          ),
          ElevatedButton(
            child: const Text("Animate"),
            onPressed: _isButtonPressed == false ? mySetState : null,
          )
        ],
      ),
    ));
  }

  void mySetState() {
    return setState(() {
      greenScreenWidth = greenScreenWidth / 1.4;
      blueScreenHeight = blueScreenHeight / 1.5;
      blueScreenWidth = blueScreenWidth * 5;
      redScreenHeight = redScreenHeight * 1.5;
      redScreenWidth = redScreenWidth * 2;
      _fontWeight = FontWeight.bold;
      _greenColor = Colors.green[400];
      _redColor = Colors.red[700];
      _blueColor = Colors.blue[700];
      _fontsize = 15;
      _isButtonPressed = true;
    });
  }
}
