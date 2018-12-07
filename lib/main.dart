import 'package:flutter/material.dart';
import './ui/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    title: "Calculazzi",
    //theme: ThemeData(primaryColor:  Colors.lightBlueAccent,accentColor: Colors.white30),
    home: new SplashScreen(),
    theme: ThemeData(
        canvasColor: Color(0xFF12125B),
        iconTheme: IconThemeData(
          color: Color(0xFF663399),
        ),
        accentColor: Colors.pink,
        //brightness: Brightness.dark,
      ),
  debugShowCheckedModeBanner: false,
  ));
}

