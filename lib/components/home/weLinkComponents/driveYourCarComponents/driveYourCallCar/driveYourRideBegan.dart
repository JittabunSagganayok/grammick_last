import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCarComponents/driveYourCallCar/driveYourReview.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCarComponents/driveYourCallCar/yourCarComponents/yourCarBottom.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCarComponents/driveYourCallCar/yourCarComponents/yourCarTop.dart';

class driveYourRideBegan extends StatefulWidget {
  driveYourRideBegan({Key? key, this.DriveYourRideBegan}) : super(key: key);
  final DriveYourRideBegan;

  @override
  State<driveYourRideBegan> createState() => _driveYourRideBeganState();
}

class _driveYourRideBeganState extends State<driveYourRideBegan> {
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
                  driveYourReview()),
        );
      },
      child: Stack(
        children: [
          _googleMap(context),
          Positioned(top: 70, right: 0, left: 0, child: yourCarTop(DriveYourRideBegan: widget.DriveYourRideBegan)),
          Positioned(bottom: 0, right: 0, left: 0, child: yourCarBottom(DriveYourRideBegan: widget.DriveYourRideBegan))
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
