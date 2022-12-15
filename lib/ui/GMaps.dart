import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMaps extends StatefulWidget {
  const GMaps({Key? key}) : super(key: key);

  @override
  State<GMaps> createState() => _GMapsState();
}

class _GMapsState extends State<GMaps> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> markers = new Set();
  LatLng latLng1 = LatLng(-6.9071672, 107.6211718);
  LatLng latLng2 = LatLng(-6.8948984, 107.6210657);
  LatLng latLng3 = LatLng(-6.8986393, 107.6173803);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        compassEnabled: false,
        initialCameraPosition: CameraPosition(target: latLng1, zoom: 15),
        markers: getmarkers(),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Set<Marker> getmarkers() {
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(latLng1.toString()),
        position: latLng1,
        infoWindow: InfoWindow(
          title: 'SATU',
          snippet: 'SATU',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(latLng2.toString()),
        position: latLng2,
        infoWindow: InfoWindow(
          title: 'DUA',
          snippet: 'DUA',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
    return markers;
  }
}
