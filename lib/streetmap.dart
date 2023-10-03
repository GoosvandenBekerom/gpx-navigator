import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:gpx_navigator/location.dart';
import 'package:latlong2/latlong.dart';

class StreetMap extends StatefulWidget {
  const StreetMap({super.key});

  @override
  State<StatefulWidget> createState() => _StreetMapState();
}

class _StreetMapState extends State<StreetMap> {
  LatLng? location;

  @override
  initState() {
    super.initState();

    getLocationStream()
        .then((stream) => {
              stream.listen((currentLocation) {
                setState(() {
                  location = currentLocation;
                  print('lat: ${currentLocation.latitude}, long: ${currentLocation.longitude}');
                });
              })
            })
        .catchError((error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
        }); // todo: handle error properly

  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: location,
        zoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
      ],
    );
  }
}
