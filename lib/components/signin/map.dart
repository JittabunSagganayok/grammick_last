import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/core/data/search_place_repository.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/helper/app_helper.dart';
import 'package:we_link/models/address/my_address_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../di/app_module.dart';

class ChooseLocationByMapScreen extends StatefulWidget {
  ChooseLocationByMapScreen();

  @override
  State<ChooseLocationByMapScreen> createState() =>
      _ChooseLocationByMapScreenState();
}

class _ChooseLocationByMapScreenState
    extends AppState<ChooseLocationByMapScreen, ChooseLocationByMapViewModel> {

  @override
  ChooseLocationByMapViewModel initViewModel(
      ChooseLocationByMapViewModel viewModel) {
    viewModel.addMarkers();
    return viewModel;
  }

  @override
  Widget onCreateView(
      BuildContext context, ChooseLocationByMapViewModel viewModel) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
              backgroundColor: blackColor,
              automaticallyImplyLeading: false,
              elevation: 0,
              centerTitle: true,
              leading: Container(
                margin: const EdgeInsets.only(left: 5),
                child: IconButton(
                  onPressed: () {
                    navigator?.pop();
                  },
                  icon: Image.asset('assets/images/goBack.png'),
                ),
              ),
              title: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: viewModel.currentAddress.value?.name ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Kanit'),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text.rich(
                          TextSpan(
                            text: viewModel.currentAddress.value?.address ?? "",
                            style: TextStyle(
                                color: Color(0xFFACACAC),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Kanit'),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ))),
        ),
        body: Obx(() {
          if (viewModel.currentLocation.value.latitude != 0) {
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        child: Stack(
                      children: [_googleMap(context)],
                    )),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 15,
                              color: Colors.grey[300]!,
                              spreadRadius: 8)
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 30),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 1,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: yellowColor,
                              textStyle: TextStyle(fontSize: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              side: BorderSide(
                                width: 0.0,
                                color: yellowColor,
                              ),
                            ),
                            onPressed: () {
                              navigator?.pop(viewModel.currentAddress.value);
                            },
                            child: const Text(
                              'Confirm',
                              style: TextStyle(
                                  color: Color(0xFF363636),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  if (viewModel.loading.value == true) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: yellowColor,
                      ),
                    );
                  }
                  return SizedBox(
                    height: 0,
                  );
                }),
              ],
            );
          } else {
            return LoadingFullscreen();
          }
        }));
  }

  Widget _googleMap(BuildContext context) {
    return GoogleMap(
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: viewModel.currentLocation.value,
        zoom: 16.0,
      ),
      markers: viewModel.markers,
      onCameraMove: (camera) {
        viewModel.cameraTarget = camera.target;
      },
      onCameraIdle: () {
        viewModel.changeLocationByMap(viewModel.cameraTarget!);
      },
      mapType: MapType.normal,
      onTap: (LatLng latLng) {
        // viewModel.changeLocationByMap(latLng);
      },
      onMapCreated: (controller) {
        viewModel.setupMapController(controller);
      },
    );
  }
}

class ChooseLocationByMapViewModel extends GetxController {
  Dio dio;
  SearchPlaceRepository searchPlaceRepository;
  GoogleMapController? mapController;

  CameraPosition? newCameraPosition;

  LatLng? cameraTarget;

  ChooseLocationByMapViewModel(
    this.dio,
    this.searchPlaceRepository,
  );

  Set<Marker> markers = Set();

  var currentAddress = AddressResponse().obs;

  var currentLocation = LatLng(0, 0).obs;
  var loading = false.obs;

  Future addMarkers() async {
    currentAddress.value = homeAddress!;

    currentLocation.value = LatLng(
        currentAddress.value.lat ?? 0.0, currentAddress.value.lng ?? 0.0);

    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lo1.png",
    );

    markers.add(Marker(
      markerId: MarkerId(DateTime.now().toIso8601String()),
      position: currentLocation.value,
      icon: markerbitmap,
    ));
  }

  Future changeLocationByMap(LatLng latLng) async {
    loading.value = true;
    markers.clear();

    try {
      var response = await searchPlaceRepository.searchByLatLng(
        latLng.latitude,
        latLng.longitude,
      );

      currentAddress.value = AddressResponse();
      currentAddress.value = response.first;
      currentLocation.value = LatLng(latLng.latitude,latLng.longitude);

      BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(),
        "assets/images/lo1.png",
      );

      markers.add(Marker(
        markerId: MarkerId(DateTime.now().toIso8601String()),
        position:latLng,
        icon: markerbitmap,
      ));
      loading.value = false;

      mapController?.animateCamera(CameraUpdate.newLatLng(latLng));

    } catch (e) {
      loading.value = false;
    }
  }

  void setupMapController(GoogleMapController controller) {
    mapController = controller;
  }
}
