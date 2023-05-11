import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/custom_info_window.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/infoStart.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/oneLo/infoOneLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/twoLo/infoEndTwoLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/twoLo/infoStartTwoLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/verhicle/verhicle.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/models/address/my_address_response.dart';

class changeLocation extends StatefulWidget {
  changeLocation({Key? key, this.twoLoca}) : super(key: key);
  final bool? twoLoca;

  @override
  State<changeLocation> createState() => _changeLocationState();
}

class _changeLocationState extends State<changeLocation> {
  GoogleMapController? mapController;
  Set<Marker> markersOneLo = Set();
  Set<Marker> markersTwoLo = Set();
  Set<Marker> markersTwoLoChange = Set();
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  bool show = true;
  bool twoLoca1 = true;

  LatLng startFocut = LatLng(13.723704251848764, 100.50685786419545);
  LatLng startLocation = LatLng(13.724704906386425, 100.50898942985646);

  //OneLoca
  LatLng Location1 = LatLng(13.722382760303931, 100.50552329523975);

  //TwoLoca
  LatLng Location2 = LatLng(13.726595521657162, 100.50892709675821);
  LatLng Location3 = LatLng(13.724432518333485, 100.5067394040784);

  @override
  void initState() {
    addMarkers();
    _getPolyline();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
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
      // rotation: -83,
      icon: poinOneLo,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoOneLo(),
          startLocation,
        );
      },
    ));

    markersOneLo.add(Marker(
      markerId: MarkerId(Location1.toString()),
      position: Location1,
      rotation: -53,
      icon: markerStart,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoStart(),
          Location1,
        );
      },
    ));

    /////TwoLoca
    markersTwoLo.add(Marker(
      markerId: MarkerId(Location3.toString()),
      position: Location3,
      icon: poinStartTwoLo,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoStartTwoLo(),
          Location3,
        );
      },
    ));

    markersTwoLo.add(Marker(
      markerId: MarkerId(Location1.toString()),
      position: Location1,
      icon: markerStart,
      rotation: -53,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoStart(),
          Location1,
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

    /////markersTwoLoChange

    markersTwoLoChange.add(Marker(
      markerId: MarkerId(Location2.toString()),
      position: Location2,
      icon: poinStartTwoLo,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          Container(
            child: Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        child: Stack(
                          children: [
                            Container(
                              height: 33,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Row(
                                  children: [
                                    Text(
                                      "Hostel",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0A0A0A),
                                          fontFamily: 'Kanit'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Image.asset(
                                        'assets/images/next2.png',
                                        fit: BoxFit.fill,
                                        color: Color(0xFFD2D2D2),
                                        height: 14,
                                        width: 7,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 50,
                              child: Container(
                                child: Image.asset(
                                  'assets/images/info.png',
                                  fit: BoxFit.fill,
                                  height: 13,
                                  width: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            show = !show;
                            // _customInfoWindowController.hideInfoWindow();
                            // Navigator.pop(context);
                            Navigator.pop(context, widget.twoLoca);
                          });
                          print(show);
                        },
                        child: show
                            ? Container(
                                margin: EdgeInsets.only(bottom: 13),
                                child: Image.asset(
                                  'assets/images/change1.png',
                                  fit: BoxFit.fill,
                                  height: 40,
                                  width: 40,
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF212B32),
                      radius: 10,
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: yellDarkColor,
                              fontFamily: 'Kanit'),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Location2,
        );
      },
    ));

    markersTwoLoChange.add(Marker(
      markerId: MarkerId(Location1.toString()),
      position: Location1,
      rotation: -53,
      icon: markerStart,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(10),
            child: Container(
              height: 50,
              child: Stack(
                children: [
                  Container(
                    height: 33,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        children: [
                          Text(
                            "Home , Keas 69 Str.15234",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0A0A0A),
                                fontFamily: 'Kanit'),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Image.asset(
                              'assets/images/next2.png',
                              fit: BoxFit.fill,
                              color: Color(0xFFD2D2D2),
                              height: 14,
                              width: 7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 50,
                    child: Container(
                      child: Image.asset(
                        'assets/images/info.png',
                        fit: BoxFit.fill,
                        height: 13,
                        width: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Location1,
        );
      },
    ));

    markersTwoLoChange.add(Marker(
      markerId: MarkerId(Location3.toString()),
      position: Location3,
      icon: poinEndTwoLo,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          Container(
            child: Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        child: Stack(
                          children: [
                            Container(
                              height: 33,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Row(
                                  children: [
                                    Text(
                                      "The Mall Banglapi",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0A0A0A),
                                          fontFamily: 'Kanit'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Image.asset(
                                        'assets/images/next2.png',
                                        fit: BoxFit.fill,
                                        color: Color(0xFFD2D2D2),
                                        height: 14,
                                        width: 7,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 50,
                              child: Container(
                                child: Image.asset(
                                  'assets/images/info.png',
                                  fit: BoxFit.fill,
                                  height: 13,
                                  width: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            show = !show;
                            _customInfoWindowController.hideInfoWindow!();
                          });
                          print(show);
                        },
                        child: !show
                            ? Container(
                                margin: EdgeInsets.only(bottom: 13),
                                child: Image.asset(
                                  'assets/images/change1.png',
                                  fit: BoxFit.fill,
                                  height: 40,
                                  width: 40,
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF212B32),
                      radius: 10,
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: yellDarkColor,
                              fontFamily: 'Kanit'),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Location3,
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
      widget.twoLoca! && show
          ? PointLatLng(13.722382760303931, 100.50552329523975)
          : PointLatLng(13.722382760303931, 100.50552329523975),
      widget.twoLoca! && show
          ? PointLatLng(13.726595521657162, 100.50892709675821)
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          shape: appbarBorder,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context, widget.twoLoca);
            },
            child: Container(
              child: Image.asset(
                'assets/images/goback4.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  _googleMap(context),
                  CustomInfoWindow(
                    controller: _customInfoWindowController,
                    height: 75,
                    width: 150,
                    offset: 50,
                  ),
                ],
              )),
              SelectVehicleSection(
                [],
                destination: [AddressResponse()],
                pickupLocation: AddressResponse(),
                noted: '',
              )
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
        zoom: 16.4,
      ),
      markers: widget.twoLoca! && show ? markersTwoLoChange : markersOneLo,
      polylines: Set<Polyline>.of(polylines.values),
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
