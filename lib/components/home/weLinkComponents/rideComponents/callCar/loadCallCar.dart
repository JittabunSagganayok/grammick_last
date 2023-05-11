import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/carPending.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/firebase/firebase_activity_order_response.dart';
import 'package:we_link/models/socket/joined_driver_room_response.dart';
import 'package:we_link/views/main_screen.dart';

import '../../../../../core/constants/key_constants.dart';
import '../../../../../di/app_module.dart';
import '../../../../../models/socket/update_driver_location_response.dart';

class PendingDriverAcceptScreen extends StatefulWidget {
  @override
  State<PendingDriverAcceptScreen> createState() =>
      _PendingDriverAcceptScreenState();
}

class _PendingDriverAcceptScreenState
    extends AppState<PendingDriverAcceptScreen, PendingDriverAcceptViewModel> {

  @override
  void initState(){
    super.initState();
    if (Get.context!=null) {
      FocusScope.of(Get.context!).requestFocus(FocusNode());
    }
  }

  @override
  PendingDriverAcceptViewModel initViewModel(PendingDriverAcceptViewModel viewModel) {
    viewModel.driverAccept.listen((success) async {
      if (success) {
        Get.off(PendingCarArrivedScreen());
      }
    });
    viewModel.listenDriverAccept();
    return viewModel;
  }

  @override
  Widget onCreateView(
      BuildContext context, PendingDriverAcceptViewModel viewModel) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                      child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      children: [
                        Center(
                          child: GifView.asset(
                            'assets/waiting_driver.gif',
                            width: 200, height: 200,
                            frameRate: 30, // default is 15 FPS
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text(
                            'Search car. Please wait...',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Kanit'),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () async{

                  await viewModel.cancelOrder();

                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 40),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFFEC2829),
                        child: Icon(
                          Icons.clear_rounded,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Kanit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class PendingDriverAcceptViewModel extends GetxController {
  var driverAccept = false.obs;
  Dio dio;
  PendingDriverAcceptViewModel(this.dio);

  Future listenDriverAccept() async {
    FirebaseFirestore.instance
        .collection('Activities')
        .doc(weRideOrderResponse?.id.toString())
        .snapshots()
        .listen((event) {
      var response = FirebaseActivityOrderResponse.fromJson(event.data());
      if (response.status.toString().toUpperCase() == 'BOOK') {
        Get.offAll(MainScreen());
      } else if (response.status.toString().toUpperCase() != 'SUCCESS' || response.status.toString().toUpperCase() != 'CANCEL') {
        connectSocket(response.id ?? 0, response.driverId ?? 0);
      }
    });
  }

  Future connectSocket(
    num activityId,
    num driverId,
  ) async {
    var refreshToken = appStorage.read(KEY_REFRESH_TOKEN) ?? '';

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

    socket?.onConnect((_) {
      socket?.emit('join', {
        'activityId': activityId,
        'driverId': driverId,
      });

      socket?.on('joined', (data) async {
        weRideOrderResponse?.driverId = driverId;

        var model = JoinedDriverRoomResponse.fromJson(data);
        driverRoom = model.driverLocationRoom ?? "";

        socket?.on(driverRoom!, (data) async {
          socket?.disconnect();
          socket?.clearListeners();

          var model = UpdateDriverLocationResponse.fromJson(data);

          driverLocation = LatLng(model.lat?.toDouble() ?? 0, model.lng?.toDouble() ?? 0);
          driverAccept.value = true;
        });
      });
    });

    socket?.onDisconnect((_) {
      print('Connection Disconnection');
    });
    socket?.onConnectError((_) {
      print('Connection onConnectError');
    });
    socket?.onError((_) {
      print('Connection onError');
    });
    socket?.onConnectTimeout((_) {
      print('Connection onConnectTimeout');
    });
  }

  Future cancelOrder() async {
    await dio.post(
      'activities/${weRideOrderResponse?.id}/cancel',
    );
  }
}
