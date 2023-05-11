import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCar.dart';
import 'package:we_link/components/home/weLinkComponents/ride.dart';
import 'package:we_link/components/home/weLinkComponents/weRent.dart';
import 'package:we_link/components/home/weLinkComponents/weRentComponents/driveCarSelect.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/helper/app_helper.dart';
import 'package:we_link/models/address/my_address_response.dart';
import 'package:we_link/models/driver/nearby_driver_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:we_link/views/main_screen.dart';

import '../../models/vehicle_promotion/vehicle_promotion_list_response.dart';

class WeLinkToGoScreen extends StatefulWidget {
  WeLinkToGoScreen({
    Key? key,
    this.valueSelectedIndex,
    this.currentTabSelected,
    this.selectBottom,
    this.request,
    this.packageSelected,
  }) : super(key: key);
  final int? valueSelectedIndex;
  final int? selectBottom;
  final int? currentTabSelected;

  final WeRentRequest? request;
  final VehiclePromotion? packageSelected;

  @override
  State<WeLinkToGoScreen> createState() => _WeLinkToGoScreenState(
        valueSelectedIndex,
        currentTabSelected,
      );
}

class _WeLinkToGoScreenState
    extends AppState<WeLinkToGoScreen, WeLinkToGoViewModel> {
  _WeLinkToGoScreenState(
    int? _valueSelectedIndex,
    int? currentTabSelected,
  ) {
    valueSelectedIndex = _valueSelectedIndex;
    indexSelects = currentTabSelected ?? 0;
  }

  int? valueSelectedIndex;
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();

    print(widget.selectBottom);
    print(widget.valueSelectedIndex);
  }

  int? indexSelects = 0;
  var titleSelects = [
    {
      "title": "Ride",
    },
    {
      "title": "Drive Your Car",
    },
    {
      "title": "WeRent",
    },
  ];

  void clickSelects(int i) {
    if (this.valueSelectedIndex == 2) {
      setState(() {
        this.valueSelectedIndex = i;
      });
    }
    if (this.valueSelectedIndex == 1) {
      setState(() {
        this.valueSelectedIndex = i;
      });
    } else {
      setState(() {
        indexSelects = i;
      });
    }
    print('indexSelects: $indexSelects');
    print('i: $i');
    print(this.valueSelectedIndex);
  }

  @override
  WeLinkToGoViewModel initViewModel(WeLinkToGoViewModel viewModel) {
    viewModel.initLocation();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, WeLinkToGoViewModel viewModel) {
    return Obx(() {
      if (viewModel.loading.isTrue) {
        return LoadingFullscreen();
      } else {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: AppBar(
                backgroundColor: blackColor,
                automaticallyImplyLeading: false,
                elevation: 0,
                shape: appbarBorder,
                leading: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: IconButton(
                    onPressed: () {
                      this.valueSelectedIndex == 2 ||
                              this.valueSelectedIndex == 1 ||
                              this.valueSelectedIndex == 0
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()),
                            )
                          : Navigator.pop(context);
                    },
                    icon: Image.asset('assets/images/goBack.png'),
                  ),
                ),
                centerTitle: true,
                title: Center(
                  child: Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 0; i != titleSelects.length; i++)
                            GestureDetector(
                              onTap: () => clickSelects(i),
                              child: Container(
                                color: blackColor,
                                margin: EdgeInsets.only(
                                  right: 25,
                                ),
                                child: this.valueSelectedIndex == 2
                                    ? Text(
                                        '${titleSelects[i]['title']}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            decoration:
                                                (this.valueSelectedIndex == 2 &&
                                                        titleSelects[i]
                                                                ['title'] ==
                                                            'WeRent')
                                                    ? TextDecoration.underline
                                                    : null,
                                            color: (this.valueSelectedIndex ==
                                                        2 &&
                                                    titleSelects[i]['title'] ==
                                                        'WeRent')
                                                ? yellowColor
                                                : Color(0xFF929292),
                                            fontFamily: 'Kanit'),
                                      )
                                    : this.valueSelectedIndex == 1
                                        ? Text(
                                            '${titleSelects[i]['title']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                                decoration:
                                                    (this.valueSelectedIndex ==
                                                                1 &&
                                                            titleSelects[i]
                                                                    ['title'] ==
                                                                'Drive Your Car')
                                                        ? TextDecoration
                                                            .underline
                                                        : null,
                                                color:
                                                    (this.valueSelectedIndex ==
                                                                1 &&
                                                            titleSelects[i]
                                                                    ['title'] ==
                                                                'Drive Your Car')
                                                        ? yellowColor
                                                        : Color(0xFF929292),
                                                fontFamily: 'Kanit'),
                                          )
                                        : Text(
                                            '${titleSelects[i]['title']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                                decoration: indexSelects == i
                                                    ? TextDecoration.underline
                                                    : null,
                                                color: indexSelects == i
                                                    ? yellowColor
                                                    : Color(0xFF929292),
                                                fontFamily: 'Kanit'),
                                          ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: Builder(builder: (context) {
              if (indexSelects == 1 || this.valueSelectedIndex == 1) {
                return DriveYourCarScreen();
              } else {
                return Container(
                  child: Column(
                    children: [
                      Expanded(
                          child: Obx(() => GoogleMap(
                                zoomGesturesEnabled: true,
                                myLocationButtonEnabled: false,
                                initialCameraPosition: CameraPosition(
                                  target: viewModel.currentLocation.value,
                                  zoom: 16.5,
                                ),
                                markers: viewModel.currentMarker,
                                mapType: MapType.normal,
                                onMapCreated: (controller) {
                                  setState(() {
                                    mapController = controller;
                                  });
                                },
                              ))),
                      Builder(builder: (context) {
                        if (indexSelects == 0 && this.valueSelectedIndex != 2) {
                          return WeRideAddressList(viewModel.addressList.value,
                              (time) {
                            viewModel.setAdvanceBooking(time!);
                          });
                        } else {
                          return Builder(builder: (context) {
                            if (indexSelects == 2) {
                              return WeRentScreen(
                                packageSelected: widget?.packageSelected,
                              );
                            } else {
                              if (this.valueSelectedIndex == 2) {
                                return ConfirmWeRentScreen(widget?.request);
                              } else {
                                return Container();
                              }
                            }
                          });
                        }
                      }),
                    ],
                  ),
                );
              }
            }));
      }
    });
  }
}

class WeLinkToGoViewModel extends GetxController {
  Dio dio;

  var nearbyList = <DriverList>[].obs;
  var addressList = <AddressResponse>[].obs;
  var loading = false.obs;

  Set<Marker> nearbyDriverMarker = Set();

  DateTime? advanceBooking;

  WeLinkToGoViewModel(this.dio);

  var currentLocation = LatLng(0, 0).obs;
  Set<Marker> currentMarker = Set();

  Future initLocation() async {
    loading.value = true;

    var address = await getCurrentLocation();

    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lo2.png",
    );

    currentLocation.value = LatLng(address?.lat ?? 0, address?.lng ?? 0);

    currentMarker.add(Marker(
      markerId: MarkerId(currentLocation.value.toString()),
      position: currentLocation.value,
      icon: markerbitmap,
    ));

    await getNearbyDriver();
    loading.value = false;
  }

  Future getNearbyDriver() async {
    var location = await getCurrentLocation();

    var response = await Future.wait([
      dio.get('activities/drivers-near', queryParameters: {
        'lat': location.lat ?? 0,
        'lng': location.lng ?? 0
      }),
      dio.get('address'),
    ]);

    var nearbyDriverResponse = NearbyDriverResponse.fromJson(response[0].data);
    nearbyList.value = nearbyDriverResponse.result ?? [];

    var myAddressResponse = MyAddressResponse.fromJson(response[1].data);
    addressList.value = myAddressResponse.result ?? [];

    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lo1.png",
    );

    BitmapDescriptor markercar = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/driver.png",
    );

    var position = await Geolocator.getLastKnownPosition(
      forceAndroidLocationManager: false,
    );
    LatLng currentLocation =
        LatLng(position?.latitude ?? 0, position?.longitude ?? 0);
    nearbyDriverMarker.add(Marker(
      markerId: MarkerId(currentLocation.toString()),
      position: currentLocation,
      rotation: 50,
      icon: markerbitmap,
    ));

    nearbyList.forEach((element) {
      LatLng location = LatLng(element.lat ?? 0, element.lng ?? 0); //
      nearbyDriverMarker.add(Marker(
        markerId: MarkerId(location.toString()),
        position: location,
        rotation: 50,
        icon: markercar,
      ));
    });
  }

  void setAdvanceBooking(DateTime time) {
    advanceBooking = time;
  }
}
