import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapEditBusiness extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapEditBusiness(
      {Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  State<MapEditBusiness> createState() => MapEditBusinessState();
}

class MapEditBusinessState extends State<MapEditBusiness> {
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _kGooglePlex;
  late Circle circles;

  @override
  void initState() {
    super.initState();

    circles = Circle(
      circleId: CircleId('circle_id_${DateTime.now().millisecondsSinceEpoch}'),
      center: LatLng(widget.latitude, widget.longitude),
      fillColor: const Color(0xffCADDE8).withOpacity(0.54),
      strokeColor: const Color(0xff66B8CA),
      strokeWidth: 2,
      radius: 180,
    );
    _kGooglePlex = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 15.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: GoogleMap(
        mapType: MapType.normal,
        compassEnabled: false,
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition: _kGooglePlex,
        circles: {circles},
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
