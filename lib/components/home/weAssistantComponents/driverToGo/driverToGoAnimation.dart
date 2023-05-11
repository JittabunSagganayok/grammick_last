import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animarker/core/ripple_marker.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weAssistantComponents/driverToGo/atStore.dart';
import 'package:we_link/components/home/weAssistantComponents/driverToGo/driverToGoBottom.dart';
import 'package:we_link/components/home/weAssistantComponents/driverToGo/toHome.dart';


const kMarkerId = MarkerId('MarkerId1');
const kDuration = Duration(seconds: 1);
const kSantoDomingo = CameraPosition(
    target: LatLng(13.722777735632983, 100.50757094887527), zoom: 16.2);
const kLocations = [
  LatLng(13.721620641314464, 100.50823967473586),
  LatLng(13.722114820171464, 100.50693872339764),
  LatLng(13.722382760303931, 100.50552329523975)
];

class driverToGoAnimation extends StatefulWidget {
  driverToGoAnimation({Key? key}) : super(key: key);

  @override
  State<driverToGoAnimation> createState() => _driverToGoAnimationState();
}

class _driverToGoAnimationState extends State<driverToGoAnimation> {
  final controller = Completer<GoogleMapController>();
  BitmapDescriptor? pinLocationIcon;
  // Set<Marker> markers = Set();
  final markers = <MarkerId, Marker>{};
  Set<Marker> markersOneLo = Set();
  Set<Marker> markersTwoLo = Set();

  // LatLng startFocut = LatLng(13.723704251848764, 100.50685786419545);
  LatLng startFocut = LatLng(13.722777735632983, 100.50757094887527);
  LatLng startLocation = LatLng(13.724704906386425, 100.50898942985646);

  LatLng Location4 = LatLng(13.721620641314464, 100.50823967473586); //ล่างขวา

  //OneLoca
  LatLng Location1 = LatLng(13.722382760303931, 100.50552329523975);

  //TwoLoca
  LatLng Location2 = LatLng(13.726595521657162, 100.50892709675821);

  //together
  LatLng Location3 = LatLng(13.727865445288137, 100.50882988853762);

  @override
  void initState() {
    addMarkers();
    setCustomMapPin();
     
    // TODO: implement initState
    super.initState();
  }

  addMarkers() async {
    BitmapDescriptor markerTaxi = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/driver.png",
    );

    BitmapDescriptor markerStart = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lo2.png",
    );

    BitmapDescriptor poinOneLo = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lok6.png",
    );

    BitmapDescriptor poinStartTwoLo = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lok4.png",
    );

    BitmapDescriptor poinEndTwoLo = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lok5.png",
    );

    //OneLoca
    markersOneLo.add(Marker(
      markerId: MarkerId(startLocation.toString()),
      position: startLocation,
      rotation: -83,
      icon: poinOneLo,
    ));

    markersOneLo.add(Marker(
      markerId: MarkerId(Location1.toString()),
      position: Location1,
      icon: markerStart,
    ));

    // markersOneLo.add(Marker(
    //   markerId: MarkerId(Location4.toString()),
    //   position: Location4,
    //   rotation: 60,
    //   icon: markerTaxi,
    // ));

    //TwoLoca
    markersTwoLo.add(Marker(
      markerId: MarkerId(startLocation.toString()),
      position: startLocation,
      rotation: -83,
      icon: poinStartTwoLo,
    ));

    markersTwoLo.add(Marker(
      markerId: MarkerId(Location1.toString()),
      position: Location1,
      icon: markerStart,
      // onTap: () => homeMapAlert(context),
    ));

    markersTwoLo.add(Marker(
      markerId: MarkerId(Location2.toString()),
      position: Location2,
      rotation: 23,
      icon: poinEndTwoLo,
    ));

    // markersTwoLo.add(Marker(
    //   markerId: MarkerId(Location4.toString()),
    //   position: Location4,
    //   rotation: 60,
    //   icon: markerTaxi,
    //   // onTap: () => homeMapAlert(context),
    // ));
  }

  final stream = Stream.periodic(kDuration, (count) => kLocations[count])
      .take(kLocations.length);

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 0.5),
        'assets/images/animation.png');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => atStore(atStoreTop: 'atStoreTop', ToHome: 'ToHome')),
        );
      },
      child: Stack(
        children: [
          _googleMap(context),
          // Positioned(top: 70, right: 0, left: 0, child: driverToGoTop()),
          Positioned(bottom: 0, right: 0, left: 0, child: driverToGoBottom())
        ],
      ),
    ));
  }

  Widget _googleMap(BuildContext context) {
    return Animarker(
      curve: Curves.bounceOut,
      rippleRadius: 0.0,
      useRotation: false,
      duration: Duration(milliseconds: 3000),
      mapId: controller.future.then<int>((value) => value.mapId),
      markers: markers.values.toSet(),
      child: GoogleMap(
          zoomGesturesEnabled: false,
          initialCameraPosition: kSantoDomingo,
          markers: markersOneLo,
          mapType: MapType.normal,
          // polylines: Set<Polyline>.of(polylines.values),
          onMapCreated: (gController) {
            stream.forEach((value) => newLocationUpdate(value));
            controller.complete(gController);
            //Complete the future GoogleMapController
          }),
    );
  }

  void newLocationUpdate(LatLng latLng) {
    var marker = RippleMarker(
        markerId: kMarkerId,
        icon: pinLocationIcon,
        position: latLng,
        ripple: true,
        rotation: 10,
        onTap: () {
          print('Tapped! $latLng');
       
        });
    setState(() => markers[kMarkerId] = marker);
  }
}
