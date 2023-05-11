import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/review.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/contextBotton.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/contextTop.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/rideOne.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/custom_info_window.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/oneLo/infoOneLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/twoLo/infoEndTwoLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/twoLo/infoStartTwoLo.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

import 'carPending.dart';

class rideBegan extends StatefulWidget {
  rideBegan({Key? key, this.twoLoca, this.buttonTopBegan, this.oneLoFinish}) : super(key: key);
  final bool? twoLoca;
  final int? buttonTopBegan;
  final String? oneLoFinish;

  @override
  State<rideBegan> createState() => _rideBeganState();
}

class _rideBeganState extends State<rideBegan> {
  GoogleMapController? mapController;
  // Set<Marker> markers = Set();
  Set<Marker> markersOneLo = Set();
  Set<Marker> markersTwoLo = Set();
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  LatLng startFocut = LatLng(13.722777735632983, 100.50757094887527);
  LatLng startLocation = LatLng(13.724704906386425, 100.50898942985646);

  //OneLoca
  LatLng Location1 = LatLng(13.722382760303931, 100.50552329523975);
  LatLng Location3 = LatLng(13.727865445288137, 100.50882988853762);
  LatLng Location5 = LatLng(13.722382760303931, 100.50552329523975);

  //TwoLoca
  LatLng Location2 = LatLng(13.726595521657162, 100.50892709675821);
  LatLng Location4 = LatLng(13.72403269527092, 100.5092430522058);
  LatLng Location6 = LatLng(13.721620641314464, 100.50823967473586); 
  LatLng LocaTwo = LatLng(13.724432518333485, 100.5067394040784);

  @override
  void initState() {
    addMarkers();
    _getPolyline();
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
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoOneLo(startOneLo: 'startOneLo'),
          startLocation,
        );
      },
    ));

    // markersOneLo.add(Marker(
    //   markerId: MarkerId(Location2.toString()),
    //   position: Location2,
    //   rotation: -29,
    //   icon: markerTaxi,
    // ));

    markersOneLo.add(Marker(
      markerId: MarkerId(Location6.toString()),
      position: Location6,
      rotation: 60,
      icon: markerTaxi,
    ));

    //TwoLoca
    markersTwoLo.add(Marker(
      markerId: MarkerId(LocaTwo.toString()),
      position: LocaTwo,
      icon: poinStartTwoLo,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoStartTwoLo(),
          LocaTwo,
        );
      },
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
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoEndTwoLo(),
          Location2,
        );
      },
    ));

    markersTwoLo.add(Marker(
      markerId: MarkerId(Location6.toString()),
      position: Location6,
      rotation: 60,
      icon: markerTaxi,
      // onTap: () => homeMapAlert(context),
    ));
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      color: Colors.blue,
      width: 5,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAzek4URP6XKcLG6isG7kHWDeoqRbvfboI",
      widget.twoLoca!
          ? PointLatLng(13.721620641314464, 100.50823967473586)
          : PointLatLng(13.721620641314464, 100.50823967473586),
      widget.twoLoca!
          ? PointLatLng(13.724432518333485, 100.5067394040784)
          : PointLatLng(13.724704906386425, 100.50898942985646),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        widget.twoLoca!
            ? Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => rideOne(rideOneTop: 'rideOneTop', twoLoca: widget.twoLoca, oneLoFinish: widget.oneLoFinish)),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityReviewScreen()),
              );
      },
      child: Stack(
        children: [
          _googleMap(context),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 75,
            width: 150,
            offset: 50,
          ),
          Positioned(
              top: 70,
              right: 0,
              left: 0,
              child: ActivityStatusWidget(ActivityStatus.PROCESS)),
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
    return GoogleMap(
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: startFocut,
        zoom: 16.2,
      ),
      markers: widget.twoLoca! ? markersTwoLo : markersOneLo,
      mapType: MapType.normal,
      polylines: Set<Polyline>.of(polylines.values),
      onTap: (position) {
        _customInfoWindowController.hideInfoWindow!();
      },
      onCameraMove: (position) {
        _customInfoWindowController.onCameraMove!();
      },
      onMapCreated: (controller) {
        _customInfoWindowController.googleMapController = controller;
        setState(() {
          mapController = controller;
        });
      },
    );
  }
}
