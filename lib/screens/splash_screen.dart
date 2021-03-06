import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';
import '../services/location.dart';
import 'package:fuel_calculator/constants.dart';

class SplashScreen extends StatefulWidget {
  double latitude;
  double longitude;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getLocationData() async {
    Location location = Location();

    await location.getLocation();

    widget.latitude = location.latitude;
    widget.longitude = location.longitude;
    kLatitude = widget.latitude;
    kLongitude = widget.longitude;
  }

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    await getLocationData();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            HomePage(latitude: widget.latitude, longitude: widget.longitude),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Image(
                  image: AssetImage('images/ic_launcher.png'),
                  height: 120,
                  width: 120,
                ),
                Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'DotGothic16',
                    color: Colors.white,
                  ),
                ),
              ]),
              const SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  Text(
                    'FACT OF THE DAY',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'This is the fact of the day that you need to know',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
