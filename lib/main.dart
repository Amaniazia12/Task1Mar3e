import 'package:flutter/material.dart';
import 'package:task1/screens/movementConfiguration_screen.dart';
import 'package:task1/screens/setting_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal[400],
      ),
      //title: "App Onborading",
      home: AnimatedSplashScreen(
          splash:Icons.tablet_mac_sharp,
          backgroundColor:  Colors.teal[400],
          nextScreen: Setting_Screen(),
        ),
      debugShowCheckedModeBanner:false,
      routes: {
        MovementConfigration_screen.routName:(ctx)=>MovementConfigration_screen(), 
      }
    );
  }
}



