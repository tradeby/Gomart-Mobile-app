import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

   double? latitude;
   double? longitude;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle the case where the user denies permission
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Device Location'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed:()async{
                  await _getLocation();
                },
                child: const Text('Get current location'),
              ),
              if (latitude != null && longitude != null)
                Text(
                  'Latitude: $latitude, Longitude: $longitude',
                  style: TextStyle(fontSize: 24),
                )
              else
                Container(),
            ],
          ),
        ),
      ),
    );
  }
}
