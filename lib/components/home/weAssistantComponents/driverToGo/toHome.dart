import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weAssistantComponents/driverToGo/driverToGoBottom.dart';
import 'package:we_link/components/home/weAssistantComponents/driverToGo/driverToGoTop.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/review.dart';
import 'package:we_link/components/home/weAssistantComponents/summary.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/custom_info_window.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/infoStart.dart';

class toHome extends StatefulWidget {
  toHome({Key? key, this.ToHome}) : super(key: key);
  final String? ToHome;

  @override
  State<toHome> createState() => _toHomeState();
}

class _toHomeState extends State<toHome> {
  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  LatLng startLocation = LatLng(13.725041168288381, 100.5075085163614);
  LatLng Location1 = LatLng(13.724704906386425, 100.50898942985646);

  @override
  void initState() {
    addMarkers();
    // TODO: implement initState
    super.initState();
  }

  addMarkers() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/driver.png",
    );

    BitmapDescriptor markerstart = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lo2.png",
    );

    markers.add(Marker(
      markerId: MarkerId(Location1.toString()),
      position: Location1,
      icon: markerstart,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoStart(startLoca: 'startLoca'),
          Location1,
        );
      },
    ));

    markers.add(Marker(
      markerId: MarkerId(Location1.toString()),
      position: Location1,
      icon: markerbitmap,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoStart(startLoca: 'startLoca'),
          Location1,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => summary()),
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
          // Positioned(top: 70, right: 0, left: 0, child: driverToGoTop()),
          Positioned(bottom: 0, right: 0, left: 0, child: driverToGoBottom(ToHome: widget.ToHome))
        ],
      ),
    ));
  }

  Widget _googleMap(BuildContext context) {
    return GoogleMap(
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: startLocation,
        zoom: 16.0,
      ),
      markers: markers,
      mapType: MapType.normal,
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
