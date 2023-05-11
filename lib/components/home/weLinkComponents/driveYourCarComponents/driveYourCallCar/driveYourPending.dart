import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCarComponents/driveYourCallCar/driveYourArrival.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCarComponents/driveYourCallCar/yourCarComponents/yourCarBottom.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCarComponents/driveYourCallCar/yourCarComponents/yourCarTop.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/custom_info_window.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/infoStart.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/oneLo/infoOneLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/twoLo/infoEndTwoLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/twoLo/infoStartTwoLo.dart';

class driveYourPending extends StatefulWidget {
  driveYourPending({Key? key}) : super(key: key);
  

  @override
  State<driveYourPending> createState() => _driveYourPendingState();
}

class _driveYourPendingState extends State<driveYourPending> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  driveYourArrival(DriveYourArrival: 'DriveYourArrival')),
        );
      },
      child: Stack(
        children: [
          _googleMap(context),
          Positioned(top: 70, right: 0, left: 0, child: yourCarTop()),
          Positioned(bottom: 0, right: 0, left: 0, child: yourCarBottom())
        ],
      ),
    ));
  }

  Widget _googleMap(BuildContext context) {
    return GoogleMap(
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: LatLng(13.722777735632983, 100.50757094887527),
        zoom: 16.4,
      ),
      mapType: MapType.normal,
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
        });
      },
    );
  }
}
