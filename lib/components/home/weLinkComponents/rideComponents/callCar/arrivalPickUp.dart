import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/animation/arrivalPickUpAnimation.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/carPending.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/contextBotton.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/contextTop.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/rideBegan.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/custom_info_window.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/oneLo/infoOneLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/twoLo/infoEndTwoLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/twoLo/infoStartTwoLo.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class arrivalPickUp extends StatefulWidget {
  arrivalPickUp({Key? key, this.buttonTop}) : super(key: key);
  final int? buttonTop;

  @override
  State<arrivalPickUp> createState() => _arrivalPickUpState();
}

class _arrivalPickUpState extends State<arrivalPickUp> {
  GoogleMapController? mapController;
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

  //TwoLoca
  LatLng Location2 = LatLng(13.726595521657162, 100.50892709675821);

  //together
  LatLng Location3 = LatLng(13.727865445288137, 100.50882988853762);
  LatLng Location4 = LatLng(13.721620641314464, 100.50823967473586); //ล่างขวา

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

    markersOneLo.add(Marker(
      markerId: MarkerId(Location1.toString()),
      position: Location1,
      icon: markerStart,
    ));

    markersOneLo.add(Marker(
      markerId: MarkerId(Location1.toString()),
      position: Location1,
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
      markerId: MarkerId(Location1.toString()),
      position: Location1,
      rotation: 60,
      icon: markerTaxi,
    ));
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      color:  Colors.blue,
      width:  5,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAzek4URP6XKcLG6isG7kHWDeoqRbvfboI",
      PointLatLng(13.722382760303931, 100.50552329523975),
     PointLatLng(13.724704906386425, 100.50898942985646),
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
      onTap: () async {
        navigator?.pop();
        await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => arrivalPickUpAnimation(
                  buttonTopBegan: 2,
                  oneLoFinish: 'oneLoFinish')),
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
      markers:  markersOneLo,
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
