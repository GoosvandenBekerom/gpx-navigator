import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:gpx_navigator/location.dart';
import 'package:latlong2/latlong.dart';

class StreetMap extends StatelessWidget {
  StreetMap({super.key});

  final mapController = MapController();
  final double zoom = 16;

  @override
  Widget build(BuildContext context) => FlutterMap(
        mapController: mapController,
        options: MapOptions(
          keepAlive: true,
          maxZoom: 22,
          onMapReady: () {
            getLocationStream().catchError((error, stackTrace) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(error.toString())));
              return const Stream<LatLng>.empty();
            }).then((stream) => {
                  stream.listen((location) {
                    mapController.move(location, zoom);
                  })
                });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'gpx-navigator',
          ),
        ],
      );
}
