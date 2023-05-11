import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gomart/styles/styles.dart';

class GetCurrentLocation extends StatefulWidget {
  final Function(double lat, double lng) onLatitudeSet;

  const GetCurrentLocation({super.key, required this.onLatitudeSet});

  @override
  State<StatefulWidget> createState() => _GetCurrentLocationState();
}

class _GetCurrentLocationState extends State<GetCurrentLocation> {
  double? latitude;
  double? longitude;
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getLocation() async {
    setState(() {
      loading = true;
      latitude = null;
      longitude = null;
    });
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle the case where the user denies permission
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                const Text('Location permission is required to use this app.'),
            duration: const Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Grant',
              onPressed: () {
                Geolocator.openAppSettings();
              },
            ),
          ),
        );
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    widget.onLatitudeSet(position.latitude, position.longitude);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading
          ? null
          : () async {
              await _getLocation();
            },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        color: Styles.colorWhite,
        child:  Row(
          children: [
            loading
                ? const SizedBox(
                height: 14,
                width: 14,
                child: CircularProgressIndicator(strokeWidth: 2))
                : Container(),
            loading
                ? const Padding(padding: EdgeInsets.all(2))
                : Container(),
            const Text(
              'Use my current location as my address',
              style: TextStyle(fontSize: 14, color: Styles.colorPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
