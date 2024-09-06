import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_map/services/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}


class _MapPageState extends State<MapPage> {
  static LatLng? center = const LatLng(22.211174451826803, 95.186509299462);
  Completer<GoogleMapController> _controller = Completer();

  LocationService locationService = LocationService();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }


  String? _currentAddress;
  Position? _currentPosition;

  /* GET CURRENT LOCATION LAT LONG */
  // Future<void> _getCurrentPosition() async {
  //   final hasPermission = await locationService.handleLocationPermission();
  //   if (!hasPermission) return;
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
  //     setState(() => _currentPosition = position);
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }

  /* GET MAP TYPE */
  MapType _currentMapType = MapType.normal;
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: GoogleMap(
        mapType: _currentMapType,
       // liteModeEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: center!,
          zoom: 11.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Icon(Icons.location_on),
        onPressed: () {
          _onMapTypeButtonPressed();
        },
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        onPressed: (){
          _getCurrentPosition();
          log("Position value : ${_currentPosition?.latitude} and ${_currentPosition?.longitude}");
          setState(() {

            center =  LatLng(_currentPosition?.latitude ?? 0.0 , _currentPosition?.longitude ?? 0.0);
          });

          log("Center value : $center");
        },),*/
    );
  }
}
