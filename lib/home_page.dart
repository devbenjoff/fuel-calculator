import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Fuel Calculator app',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    ));
  }
}
