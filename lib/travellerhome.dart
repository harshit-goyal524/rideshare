import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<LocationData?> getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
}

class TravellerHomeRoute extends StatefulWidget{
  TravellerHomeRoute({super.key});

  @override
  State<TravellerHomeRoute> createState()=> _TravellerHomeRouteState();
}
class _TravellerHomeRouteState extends State<TravellerHomeRoute>{
  String? _locationLink;
  LocationService _locationService = LocationService();

  Future<void> _generateLink() async{
    LocationData? locationData=await _locationService.getLocation();

    if(locationData!=null){
      double latitude=locationData.latitude!;
      double longitude=locationData.longitude!;

      DocumentReference docRef = await FirebaseFirestore.instance.collection('live_locations').add({
        'latitude': latitude,
        'longitude': longitude,
        'timestamp': FieldValue.serverTimestamp(),
      });

      String link = "https://yourapp.com/share?docId=${docRef.id}";
      setState(() {
        _locationLink = link;
      });
    } else {
      setState(() {
        _locationLink = "Failed to get location.";
      });
    }
  }
  Future<void> _shareOnWhatsApp() async {
    if (_locationLink != null) {
      String url = "whatsapp://send?text=Check my live location: $_locationLink";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Passenger',
          style: TextStyle(
            fontSize: 20,color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        ),
      body: const Stack(
        children: [
          Text(
            "Enter details",
            style: TextStyle(
              fontSize: 20,color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ]
      ),
    );
  }
}