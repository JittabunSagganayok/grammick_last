import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/review.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/contextBotton.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/contextTop.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/rideTwo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/custom_info_window.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/twoLo/infoEndTwoLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/twoLo/infoStartTwoLo.dart';
import 'package:we_link/constant/stylesConstants.dart';

import 'carPending.dart';

class rideOne extends StatefulWidget {
  rideOne({Key? key, this.rideOneTop, this.twoLoca, this.oneLoFinish}) : super(key: key);
  final String? rideOneTop;
  final bool? twoLoca;
  final String? oneLoFinish;

  @override
  State<rideOne> createState() => _rideOneState();
}

class _rideOneState extends State<rideOne> {
  GoogleMapController? mapController;
  Set<Marker> markersTwoLo = Set();
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
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
      markerId: MarkerId(LocaTwo.toString()),
      position: LocaTwo,
      icon: markerTaxi,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoStartTwoLo(),
          LocaTwo,
        );
      },
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
      PointLatLng(13.724432518333485, 100.5067394040784),
      PointLatLng(13.726595521657162, 100.50892709675821),
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => rideTwo(twoLoca: widget.twoLoca, rideTwoTop: 'rideTwoTop', oneLoFinish: widget.oneLoFinish)),
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
          Positioned(top: 70, right: 0, left: 0, child: ActivityStatusWidget(ActivityStatus.PROCESS)),
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
      markers: markersTwoLo,
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
