import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/contextBotton.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/contextTop.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/review.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/custom_info_window.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/infowindow/infoStart.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/activity/we-ride/we_ride_activity_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../../../../core/constants/key_constants.dart';
import '../../../../../di/app_module.dart';
import '../../../../../models/firebase/firebase_activity_order_response.dart';
import '../../../../../models/socket/update_driver_location_response.dart';
import '../../../../profile/myWalletComponent/scanPayment.dart';

class PendingCarArrivedScreen extends StatefulWidget {
  @override
  State<PendingCarArrivedScreen> createState() =>
      _PendingCarArrivedScreenState();
}

class _PendingCarArrivedScreenState
    extends AppState<PendingCarArrivedScreen, PendingCarArrivedViewModel> {
  GoogleMapController? mapController;

  @override
  PendingCarArrivedViewModel initViewModel(
      PendingCarArrivedViewModel viewModel) {
    viewModel.getActivityDetail();
    viewModel.gotoReviewScreen.listen((success) async {
      if (success) {
        if (viewModel.activityResponse?.result?.paymentMethod?.toLowerCase() ==
            'wallet') {
          await Navigator.push(
            Get.context!,
            MaterialPageRoute(
                builder: (context) => ScanPaymentScreen(
                    isPayment: true,
                    totalAmount:
                        viewModel.activityResponse?.result?.total ?? "")),
          );

          Get.off(ActivityReviewScreen(
              activityResponse: viewModel.activityResponse));
        } else {
          Get.off(ActivityReviewScreen(
              activityResponse: viewModel.activityResponse));
        }
      }
    });
    return viewModel;
  }

  @override
  Widget onCreateView(
      BuildContext context, PendingCarArrivedViewModel viewModel) {
    return Scaffold(
        body: Stack(
      children: [
        Builder(builder: (context) {
          if (viewModel.markerLocation.isEmpty == true) {
            return const SizedBox(
              height: 0,
            );
          }
          return Obx(() => GoogleMap(
                zoomGesturesEnabled: true,
                myLocationButtonEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: viewModel.focusLocation!,
                  zoom: 16.4,
                ),
                markers: viewModel.markerLocation,
                mapType: MapType.normal,
                polylines: Set<Polyline>.of(viewModel.polylines.values),
                onTap: (position) {
                  viewModel.customInfoWindowController.hideInfoWindow!();
                },
                onCameraMove: (position) {
                  viewModel.customInfoWindowController.onCameraMove!();
                },
                onMapCreated: (controller) {
                  viewModel.customInfoWindowController.googleMapController =
                      controller;
                  setState(() {
                    mapController = controller;
                  });
                },
              ));
        }),
        CustomInfoWindow(
          controller: viewModel.customInfoWindowController,
          height: 75,
          width: 150,
          offset: 50,
        ),
        Positioned(
            top: 70,
            right: 0,
            left: 0,
            child: Obx(() => ActivityStatusWidget(
                  viewModel.status.value,
                  activityResponse: viewModel.activityResponse!,
                ))),
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Obx(() => ActivityDriverDetailWidget(
                  activityResponse: viewModel.activityResponse!,
                  activityStatus: viewModel.status.value,
                ))),
        Obx(() {
          if (viewModel.markerLocation.isEmpty == true) {
            return LoadingFullscreen();
          } else {
            return SizedBox(
              height: 0,
            );
          }
        })
      ],
    ));
  }
}

class PendingCarArrivedViewModel extends GetxController {
  Dio dio;

  WeRideActivityResponse? activityResponse;

  PendingCarArrivedViewModel(this.dio);

  LatLng? focusLocation;

  var markerLocation = Set<Marker>().obs;
  var polylinePoints = PolylinePoints().obs;
  var polylines = <PolylineId, Polyline>{}.obs;
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  LatLng? destinationLocation;

  var status = ActivityStatus.ARRIVED.obs;
  var gotoReviewScreen = false.obs;

  List<Destinations> destinationAddress = [];

  bool isMultipleDestination = false;

  Future getActivityDetail() async {
    var refreshToken = appStorage.read(KEY_REFRESH_TOKEN) ?? '';
    var response = await dio.get('activities/${weRideOrderResponse?.id ?? 0}');
    activityResponse = WeRideActivityResponse.fromJson(response.data);

    isMultipleDestination = activityResponse?.result?.type == 'RIDE_TWO_POINS';

    if (activityResponse?.result?.type == 'RENT') {
      var activity = activityResponse?.result?.ride;
      activity?.destinations = [];
      activity?.destinations?.insert(
          0,
          Destinations(
              destination: Destination(
            name: activityResponse?.result?.customerAddress?.name ?? "",
            address: activityResponse?.result?.customerAddress?.address ?? "",
            detail: activityResponse?.result?.customerAddress?.detail ?? "",
            icon: 'assets/icons/ic_activity_start.svg',
          )));
    } else if (activityResponse?.result?.type == 'DRIVE_YOUR_CAR') {
      var activity = activityResponse?.result?.ride;
      activity?.destinations = [];
      activity?.destinations?.add(Destinations(
        destination:
            activityResponse?.result?.driveYourCarResponse?.destination,
      ));
      activity?.destinations?.forEach((element) {
        element.destination?.icon = 'assets/icons/ic_activity_destination.svg';
      });
      activity?.destinations?.insert(
          0,
          Destinations(
              destination: Destination(
            name: activityResponse?.result?.customerAddress?.name ?? "",
            address: activityResponse?.result?.customerAddress?.address ?? "",
            detail: activityResponse?.result?.customerAddress?.detail ?? "",
            icon: 'assets/icons/ic_activity_start.svg',
          )));
    } else if (activityResponse?.result?.type == 'ASSISTANT') {
      var activity = activityResponse?.result?.ride;
      activity?.destinations = [];
      activity?.destinations?.add(Destinations(
        destination: activityResponse?.result?.assistant?.destination,
      ));
      activity?.destinations?.forEach((element) {
        element.destination?.icon = 'assets/icons/ic_activity_destination.svg';
      });
      activity?.destinations?.insert(
          0,
          Destinations(
              destination: Destination(
            name: activityResponse?.result?.customerAddress?.name ?? "",
            address: activityResponse?.result?.customerAddress?.address ?? "",
            detail: activityResponse?.result?.customerAddress?.detail ?? "",
            icon: 'assets/icons/ic_activity_start.svg',
          )));
    } else if (activityResponse?.result?.type == 'RIDE') {
      activityResponse?.result?.ride?.destinations?.forEach((element) {
        element.destination?.icon = 'assets/icons/ic_activity_destination.svg';
      });

      var current = Destinations(
          destination: Destination(
        name: activityResponse?.result?.customerAddress?.name ?? "",
        address: activityResponse?.result?.customerAddress?.address ?? "",
        detail: activityResponse?.result?.customerAddress?.detail ?? "",
        icon: 'assets/icons/ic_activity_start.svg',
      ));

      activityResponse?.result?.ride?.destinations?.insert(0, current);
    }

    destinationAddress
        .addAll(activityResponse?.result?.ride?.destinations ?? []);

    // AddressResponse currentAddress = await getCurrentLocation();
    destinationLocation = LatLng(
        activityResponse?.result?.customerAddress?.lat?.toDouble() ?? 0,
        activityResponse?.result?.customerAddress?.lng?.toDouble() ?? 0);
    focusLocation = destinationLocation;

    FirebaseFirestore.instance
        .collection('Activities')
        .doc(weRideOrderResponse?.id.toString())
        .snapshots()
        .listen((event) async {
      gotoReviewScreen.value = false;

      var response = FirebaseActivityOrderResponse.fromJson(event.data());
      var activityStatus = response.status.toString().toUpperCase();
      if (activityStatus == 'PICKUP') {
        status.value = ActivityStatus.PICKUP;
      } else if (activityStatus == 'SEND_OF_PASSENGER') {
        status.value = ActivityStatus.SEND_OF_PASSENGER;
      } else if (activityStatus == 'START_POINT_TWO') {
        if (isMultipleDestination == true) {
          polylines.value = {};
          status.value = ActivityStatus.START_POINT_TWO;

          driverLocation = LatLng(
              destinationAddress[1].destination?.lat?.toDouble() ?? 0,
              destinationAddress[1].destination?.lng?.toDouble() ?? 0);
          destinationLocation = LatLng(
              destinationAddress[2].destination?.lat?.toDouble() ?? 0,
              destinationAddress[2].destination?.lng?.toDouble() ?? 0);

          focusLocation = driverLocation;

          await addMarkers();
          await _getPolyline();
          refresh();
        }
      } else if (activityStatus == 'SEND_OF_PASSENGER_POINT_TWO') {
        status.value = ActivityStatus.SEND_OF_PASSENGER_POINT_TWO;
      } else if (activityStatus == 'SUCCESS') {
        status.value = ActivityStatus.SUCCESS;

        var response =
            await dio.get('activities/${weRideOrderResponse?.id ?? 0}');
        activityResponse = WeRideActivityResponse.fromJson(response.data);

        gotoReviewScreen.value = true;
      } else if (activityStatus == 'CANCEL') {
        activityResponse?.result?.status == 'CANCEL';
        status.value = ActivityStatus.CANCEL;
        gotoReviewScreen.value = true;
      } else if (activityStatus == 'ARRIVED') {
        status.value = ActivityStatus.ARRIVED;

        OptionBuilder builder = OptionBuilder();
        builder.setTransports(
          ['websocket'],
        ).setExtraHeaders({
          "ws-token": refreshToken,
        });

        socket = io(
          'https://welink-dev-api-admin.gramick.dev/socket/activity',
          builder.build(),
        );

        socket?.connect();
        socket?.onConnect((_) async {
          await addDriverLocation();

          socket?.on(driverRoom!, (data) async {
            var model = UpdateDriverLocationResponse.fromJson(data);

            driverLocation =
                LatLng(model.lat?.toDouble() ?? 0, model.lng?.toDouble() ?? 0);

            await addDriverLocation();
          });
        });
        socket?.onDisconnect((_) => print('Connection Disconnection'));
        socket?.onConnectError((_) => print('Connection onConnectError'));
        socket?.onError((_) => print('Connection onError'));
        socket?.onConnectTimeout((_) => print('Connection onConnectTimeout'));
      }
    });
  }

  Future addDriverLocation() async {
    if (status.value == ActivityStatus.ARRIVED) {
      // var currentLocation = await getCurrentLocation();
      destinationLocation = LatLng(
          activityResponse?.result?.customerAddress?.lat?.toDouble() ?? 0,
          activityResponse?.result?.customerAddress?.lng?.toDouble() ?? 0);
      focusLocation = destinationLocation;
    } else if (status.value == ActivityStatus.PICKUP) {
      destinationLocation = LatLng(
          destinationAddress[1].destination?.lat?.toDouble() ?? 0,
          destinationAddress[1].destination?.lng?.toDouble() ?? 0);
      focusLocation = destinationLocation;
    } else if (status.value == ActivityStatus.SEND_OF_PASSENGER ||
        status.value == ActivityStatus.START_POINT_TWO) {
      if (isMultipleDestination) {
        destinationLocation = LatLng(
            destinationAddress[2].destination?.lat?.toDouble() ?? 0,
            destinationAddress[2].destination?.lng?.toDouble() ?? 0);
        focusLocation = destinationLocation;
      }
    }

    await addMarkers();
    await _getPolyline();
    refresh();
  }

  Future addMarkers() async {
    markerLocation.clear();
    BitmapDescriptor markerDriver = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/driver.png",
      mipmaps: false,
    );

    BitmapDescriptor marketCurrentLocation =
        await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/lo2.png",
      mipmaps: false,
    );

    markerLocation.add(Marker(
      markerId: MarkerId(destinationLocation.toString()),
      position: destinationLocation!,
      rotation: -53,
      icon: marketCurrentLocation,
      onTap: () {
        customInfoWindowController.addInfoWindow!(
          const infoStart(startLoca: 'currentLocation'),
          destinationLocation!,
        );
      },
    ));

    markerLocation.add(Marker(
      markerId: MarkerId(driverLocation.toString()),
      position: driverLocation!,
      rotation: -53,
      icon: markerDriver,
      onTap: () {
        customInfoWindowController.addInfoWindow!(
          const infoStart(startLoca: 'driverLocation'),
          driverLocation!,
        );
      },
    ));
  }

  Future updateMaker() async {
    markerLocation.value.toList()[0]?.copyWith(
          positionParam: destinationLocation,
        );

    markerLocation.value.toList()[1]?.copyWith(
          positionParam: driverLocation,
        );

    markerLocation.refresh();
  }

  Future _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result =
        await polylinePoints.value.getRouteBetweenCoordinates(
      "AIzaSyAzek4URP6XKcLG6isG7kHWDeoqRbvfboI",
      PointLatLng(destinationLocation?.latitude ?? 0,
          destinationLocation?.longitude ?? 0),
      PointLatLng(
          driverLocation?.latitude ?? 0, driverLocation?.longitude ?? 0),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    _addPolyLine(polylineCoordinates);
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    polylines.value = {};
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      color: Colors.blue,
      width: 5,
    );
    polylines[id] = polyline;
  }
}

enum ActivityStatus {
  PROCESS,
  ARRIVED,
  PICKUP,
  SEND_OF_PASSENGER,
  START_POINT_TWO,
  SEND_OF_PASSENGER_POINT_TWO,
  SUCCESS,
  CANCEL,
}
