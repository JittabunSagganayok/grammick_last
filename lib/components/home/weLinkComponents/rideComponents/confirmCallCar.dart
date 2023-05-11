import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/custom_info_window.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/infoStart.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/oneLo/infoOneLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/verhicle/verhicle.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/address/my_address_response.dart';
import 'package:we_link/models/distance/cost_by_distance_response.dart';
import 'package:we_link/models/driver/all_vehicle_type_reponse.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

class ConfirmCallCarScreen extends StatefulWidget {
  ConfirmCallCarScreen({
    Key? key,
    required this.pickup,
    required this.destination,
    this.noted = '',
    this.bookingAdvance,
    this.costByDistanceResponse,
  }) : super(key: key);

  final AddressResponse? pickup;
  final CostByDistanceResponse? costByDistanceResponse;
  final List<AddressResponse>? destination;
  String noted;
  DateTime? bookingAdvance;

  @override
  State<ConfirmCallCarScreen> createState() => _ConfirmCallCarScreenState();
}

class _ConfirmCallCarScreenState
    extends AppState<ConfirmCallCarScreen, ConfirmCarViewModel> {
  GoogleMapController? mapController;

  bool show = true;

  Widget _googleMap(BuildContext context) {
    return GoogleMap(
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: viewModel.startLocation,
        zoom: 16.4,
      ),
      markers: viewModel.marketLocation,
      polylines: Set<Polyline>.of(viewModel.polylines.values),
      mapType: MapType.normal,
      onTap: (position) {
        viewModel._customInfoWindowController.hideInfoWindow!();
      },
      onCameraMove: (position) {
        viewModel._customInfoWindowController.onCameraMove!();
      },
      onMapCreated: (controller) {
        viewModel._customInfoWindowController.googleMapController = controller;
        setState(() {
          mapController = controller;
        });
      },
    );
  }

  @override
  ConfirmCarViewModel initViewModel(ConfirmCarViewModel viewModel) {
    viewModel.pickup = widget.pickup;
    viewModel.destination = widget.destination;
    viewModel.bookingAdvance = widget.bookingAdvance;
    viewModel.addMarkers();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, ConfirmCarViewModel viewModel) {
    return Obx(() {
      if (viewModel.loading.value) {
        return LoadingFullscreen();
      } else {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              elevation: 0,
              shape: appbarBorder,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
                        controller: viewModel._customInfoWindowController,
                        height: 75,
                        width: 150,
                        offset: 50,
                      ),
                    ],
                  )),
                  SelectVehicleSection(
                    viewModel.carList.value,
                    noted: widget?.noted ?? "",
                    pickupLocation: widget.pickup!,
                    destination: widget.destination!,
                    bookingAdvance: viewModel.bookingAdvance,
                    costByDistanceResponse: widget?.costByDistanceResponse,
                  )
                ],
              ),
            ));
      }
    });
  }
}

class ConfirmCarViewModel extends GetxController {
  Dio dio;

  AddressResponse? pickup;
  List<AddressResponse>? destination;

  var carList = <Vehicle>[].obs;

  DateTime? bookingAdvance;

  ConfirmCarViewModel(this.dio);

  var loading = false.obs;

  late LatLng startLocation;
  late List<LatLng> locationList = [];

  Set<Marker> marketLocation = Set();

  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};

  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  addMarkers() async {
    loading.value = true;

    var response = await dio.get('vehicle-types');
    var data = AllVehicleTypeReponse.fromJson(response.data);
    carList.value = data.result ?? [];
    carList.first.selected = true;

    startLocation = LatLng(pickup?.lat ?? 0, pickup?.lng ?? 0);

    destination?.forEach((element) {
      locationList.add(LatLng(element?.lat ?? 0, element?.lng ?? 0));
    });

    BitmapDescriptor startPointOne = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lo2.png",
    );

    BitmapDescriptor endPointOne = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/loca7.png",
    );

    BitmapDescriptor startPointTwo = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lok4.png",
    );

    BitmapDescriptor endPointTwo = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lok5.png",
    );

    marketLocation.add(Marker(
      markerId: MarkerId(startLocation.toString()),
      position: startLocation,
      icon: startPointOne,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoOneLo(),
          startLocation,
        );
      },
    ));

    marketLocation.add(Marker(
      markerId: MarkerId(locationList.toString()),
      position: locationList.first,
      rotation: -53,
      icon: endPointOne,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoStart(),
          locationList.first,
        );
      },
    ));

    if (locationList.length > 1) {
      marketLocation.add(Marker(
        markerId: MarkerId(locationList.first.toString()),
        position: locationList.first,
        icon: startPointTwo,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            infoOneLo(),
            locationList.first,
          );
        },
      ));

      marketLocation.add(Marker(
        markerId: MarkerId(locationList[1].toString()),
        position: locationList[1],
        rotation: -53,
        icon: endPointTwo,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            infoStart(),
            locationList[1],
          );
        },
      ));
    }

    // destination?.forEach((element) async{
    await _getPolyline();
    loading.value = false;
    // });
  }

  Future _getPolyline() async {
    List<LatLng> polylineCoordinates = [];
    List<PointLatLng> pointList = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAzek4URP6XKcLG6isG7kHWDeoqRbvfboI",
      PointLatLng(pickup?.lat ?? 0, pickup?.lng ?? 0),
      PointLatLng(destination?.first.lat ?? 0, destination?.first.lng ?? 0),
      travelMode: TravelMode.driving,
    );

    pointList.addAll(result.points);

    if (destination!.length > 1) {
      result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyAzek4URP6XKcLG6isG7kHWDeoqRbvfboI",
        PointLatLng(destination?.first.lat ?? 0, destination?.first.lng ?? 0),
        PointLatLng(destination?[1].lat ?? 0, destination?[1].lng ?? 0),
        travelMode: TravelMode.driving,
      );
      pointList.addAll(result.points);
    }

    pointList.forEach((PointLatLng point) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    });

    _addPolyLine(polylineCoordinates);
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
  }
}
