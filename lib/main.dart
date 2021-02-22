import 'package:flutter/material.dart';
import 'package:fuel_calculator/splash_screen.dart';

void main() => runApp(FuelCalculatorApp());

class FuelCalculatorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
