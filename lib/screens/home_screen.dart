import 'package:flutter/material.dart';
import 'package:fuel_calculator/main_drawer.dart';
import '../services/location.dart';
import 'map_screen.dart';
import 'package:http/http.dart';
import '../constants.dart';

class HomePage extends StatefulWidget {
  HomePage({@required this.latitude, @required this.longitude});

  double latitude;
  double longitude;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedItem = '';
  List _options = ['Record Trip', 'Add Vehicle'];

  double longitude;
  double latitude;

  void getData() async {
    longitude = widget.longitude;
    latitude = widget.latitude;

    Response response = await get(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=123+main+street&location=42.3675294,-71.186966&radius=10000&key=$kApiKey');
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fuel Calc'),
        ),
        drawer: MainDrawer(),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton.icon(
                      icon: Icon(Icons.near_me),
                      label: Text('Nearby'),
                      color: Colors.blue,
                      onPressed: () async {
                        getData();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapScreen(
                                latitude: widget.latitude,
                                longitude: widget.longitude),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ],
                ),
              ),
              Expanded(child: Text('me'))
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 55,
          height: 55,
          child: FloatingActionButton(
            backgroundColor: Colors.red,
            child: PopupMenuButton(
              elevation: 5.0,
              itemBuilder: (BuildContext bc) {
                return _options
                    .map((e) => PopupMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList();
              },
              color: Colors.blue,
              shape: RoundedRectangleBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
