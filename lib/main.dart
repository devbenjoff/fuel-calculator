import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/splash_screen.dart';
import './screens/reminders_screen.dart';

void main() => runApp(FuelCalculatorApp());

class FuelCalculatorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home_page': (context) => HomePage(),
        '/reminders': (context) => Reminders(),
      },
    );
  }
}
