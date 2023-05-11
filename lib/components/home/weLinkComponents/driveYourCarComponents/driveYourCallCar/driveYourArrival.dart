import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCarComponents/driveYourCallCar/driveYourRideBegan.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCarComponents/driveYourCallCar/yourCarComponents/yourCarBottom.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCarComponents/driveYourCallCar/yourCarComponents/yourCarTop.dart';

class driveYourArrival extends StatefulWidget {
  driveYourArrival({Key? key, this.DriveYourArrival}) : super(key: key);
  final String? DriveYourArrival;

  @override
  State<driveYourArrival> createState() => _driveYourArrivalState();
}

class _driveYourArrivalState extends State<driveYourArrival> {
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
                  driveYourRideBegan(DriveYourRideBegan: 'DriveYourRideBegan')),
        );
      },
      child: Stack(
        children: [
          _googleMap(context),
          Positioned(top: 70, right: 0, left: 0, child: yourCarTop(DriveYourArrival: widget.DriveYourArrival)),
          Positioned(bottom: 0, right: 0, left: 0, child: yourCarBottom(DriveYourArrival: widget.DriveYourArrival))
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
