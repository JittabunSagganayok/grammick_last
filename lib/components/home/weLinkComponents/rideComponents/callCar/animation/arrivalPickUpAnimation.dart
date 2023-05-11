import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animarker/core/ripple_marker.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/arrivalPickUp.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/contextBotton.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/rideBegan.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/custom_info_window.dart';

const kMarkerId = MarkerId('MarkerId1');
const kDuration = Duration(seconds: 1);
const kSantoDomingo = CameraPosition(
    target: LatLng(13.722777735632983, 100.50757094887527), zoom: 16.2);
const kLocations = [
  LatLng(13.722382760303931, 100.50552329523975),
  LatLng(13.722114820171464, 100.50693872339764),
  LatLng(13.721620641314464, 100.50823967473586),
];

class arrivalPickUpAnimation extends StatefulWidget {
  arrivalPickUpAnimation(
      {Key? key,
      this.buttonTop,
      this.buttonTopBegan,
      this.oneLoFinish})
      : super(key: key);
  final int? buttonTop;
  final int? buttonTopBegan;
  final String? oneLoFinish;

  @override
  State<arrivalPickUpAnimation> createState() => _arrivalPickUpAnimationState();
}

class _arrivalPickUpAnimationState extends State<arrivalPickUpAnimation> {
  var timerEnd = 'start';
  final controller = Completer<GoogleMapController>();
  BitmapDescriptor? pinLocationIcon;
  final markers = <MarkerId, Marker>{};
  Set<Marker> markersOneLo = Set();
  Set<Marker> markersTwoLo = Set();
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

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
  LatLng LocaTwo = LatLng(13.724432518333485, 100.5067394040784);

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
      "assets/images/loca7.png",
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
      icon: poinOneLo,
    ));

    // markersOneLo.add(Marker(
    //   markerId: MarkerId(Location1.toString()),
    //   position: Location1,
    //   icon: markerStart,
    // ));

    // markersOneLo.add(Marker(
    //   markerId: MarkerId(Location4.toString()),
    //   position: Location4,
    //   rotation: 60,
    //   icon: markerTaxi,
    // ));

    //TwoLoca
    markersTwoLo.add(Marker(
      markerId: MarkerId(LocaTwo.toString()),
      position: LocaTwo,
      icon: poinStartTwoLo,
    ));

    // markersTwoLo.add(Marker(
    //   markerId: MarkerId(Location1.toString()),
    //   position: Location1,
    //   icon: markerStart,
    //   // onTap: () => homeMapAlert(context),
    // ));

    markersTwoLo.add(Marker(
      markerId: MarkerId(Location2.toString()),
      position: Location2,
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
      onTap: () async {
      navigator?.pop();
      await  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => rideBegan(
                  buttonTopBegan: widget.buttonTopBegan,
                  oneLoFinish: widget.oneLoFinish)),
        );
      },
      child: Stack(
        children: [
          _googleMap(context),
          // Positioned(top: 70, right: 0, left: 0, child: contextTop()),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 75,
            width: 150,
            offset: 50,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: ActivityDriverDetailWidget())
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
          markers:  markersOneLo,
          mapType: MapType.normal,
          // polylines: Set<Polyline>.of(polylines.values),
          onTap: (position) {
            _customInfoWindowController.hideInfoWindow!();
          },
          onCameraMove: (position) {
            _customInfoWindowController.onCameraMove!();
          },
          onMapCreated: (gController) {
            _customInfoWindowController.googleMapController = gController;
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
          setState(() {
            latLng == LatLng(13.722382760303931, 100.50552329523975)
                ? timerEnd = 'end'
                : timerEnd = 'start';
          });
          print('Tapped! $latLng');
          print(timerEnd);
        });
    setState(() => markers[kMarkerId] = marker);
  }
}
