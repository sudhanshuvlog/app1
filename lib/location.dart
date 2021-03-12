import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'location_firebase.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
       
          
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
            
      });
    } catch (e) {
      print(e);
    }
      
          
  }

  @override
  Widget build(BuildContext context) {
  // if (_currentPosition != null && _currentAddress != null)
    // Location(_currentAddress);
    //return Container(height:0.0, width:0.0); //if we don't add it then it was giving build error you have to reaturn something
    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD"),
      ),
      body: Column(children: [
        if (_currentPosition != null && _currentAddress != null)
          Location(_currentAddress)
      ]),
      
    );  
  }
}
