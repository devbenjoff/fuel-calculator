import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fuel_calculator/main_drawer.dart';
import '../services/location.dart';

class MapScreen extends StatefulWidget {
  MapScreen({@required this.latitude, @required this.longitude});

  double latitude;
  double longitude;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(
      () {
        _markers.add(Marker(
            markerId: MarkerId('id-1'),
            position: LatLng(widget.latitude, widget.longitude),
            infoWindow: InfoWindow(title: 'My Location')));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuel Calc'),
      ),
      drawer: MainDrawer(),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude), zoom: 15),
      ),
    );
  }
}
