import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  GoogleMapController _controller;

  double latitude = 39.925054;
  double longitude = 32.8369439;
  BitmapDescriptor current;
  BitmapDescriptor target;

  Widget _child;

  Future<void> getLocation() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);

    if (permission == PermissionStatus.denied) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.locationAlways]);
    }

    var geolocator = Geolocator();

    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();

    switch (geolocationStatus) {
      case GeolocationStatus.denied:
        showToast('denied');
        break;
      case GeolocationStatus.disabled:
        showToast('disabled');
        break;
      case GeolocationStatus.restricted:
        showToast('restricted');
        break;
      case GeolocationStatus.unknown:
        showToast('unknown');
        break;
      case GeolocationStatus.granted:
        showToast('Access granted');
        _getCurrentLocation();
    }
  }

  void _setStyle(GoogleMapController controller) async {
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map/map_style.json');
    controller.setMapStyle(value);
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId('home'),
          position: LatLng(latitude, longitude),
          icon: current,
          infoWindow: InfoWindow(title: 'Current Location')),
      Marker(
          markerId: MarkerId('target'),
          position: LatLng(latitude + 0.03, longitude + 0.03),
          icon: target,
          infoWindow: InfoWindow(title: 'Target Location')),
    ].toSet();
  }

  void showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void _getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
      latitude = res.latitude;
      longitude = res.longitude;
      camUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    createIcon(context);
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _createMarker(),
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 12.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
          _setStyle(controller);
        },
      ),
    );
  }

  void camUpdate() {
    _controller
        .animateCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
  }

  Future<void> createIcon(BuildContext context) async {
    final ImageConfiguration imageConfiguration =
        createLocalImageConfiguration(context);
    var icon = await BitmapDescriptor.fromAssetImage(
        imageConfiguration, "assets/images/map/currentpin.png");
    current = icon;
    var icontarget = await BitmapDescriptor.fromAssetImage(
        imageConfiguration, "assets/images/map/targetpin.png");
    target = icontarget;

    setState(() {});
  }
}
