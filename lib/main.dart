import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:estimators_app/pages/introScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
    );
  }
}
