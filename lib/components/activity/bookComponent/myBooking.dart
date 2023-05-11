import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:we_link/components/alert/callOutAlert.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../../models/activity/we-ride/we_ride_activity_response.dart';
import '../../home/weLinkComponents/rideComponents/callCar/review.dart';

class MyBookingScreen extends StatefulWidget {

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends AppState<MyBookingScreen,MyBookingViewModel> {
  @override
  MyBookingViewModel initViewModel(MyBookingViewModel viewModel) {

    num orderId = Get.arguments;

    viewModel.setOrderId(orderId);

    viewModel.getOrderDetail();

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, MyBookingViewModel viewModel) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
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
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            centerTitle: true,
            title: Text(
              'My booking',
              style: titleYellowAppbar,
            ),
          ),
        ),
        body: Obx((){
          if (viewModel.loading.isTrue) {
            return LoadingFullscreen();
          }  else{
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          constraints: maxHeightContain,
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 12),
                          padding: EdgeInsets.fromLTRB(30, 21, 30, 21),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Text("Order : ",
                                                  style: fieldSearchHintText)),
                                          Container(
                                            margin: EdgeInsets.only(left: 9),
                                            padding: EdgeInsets.fromLTRB(9, 6, 9, 6),
                                            decoration: typeButton,
                                            child: Obx((){
                                              return Text(viewModel.result.value.type?.toString() ?? "",
                                                style: typeTText,
                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(viewModel.result.value.orderId ?? "", style: fieldSearchHintText),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Color(0xFFE6E6E6),
                                thickness: 1,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 18, bottom: 10),
                                width: MediaQuery.of(context).size.width * 1,
                                padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                                decoration: BoxDecoration(
                                    color: Color(0xFFE87913),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    )),
                                child: Center(
                                  child: Text(
                                    DateFormat('MMM, dd yyyy / hh:mm aaa')
                                        .format(DateTime.parse(viewModel.result.value.createdDt ?? "")),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        fontFamily: 'Kanit'),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(bottom: 18, top: 18),
                                    child: Text(
                                      'Driver',
                                      style: inforTitleText,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 15),
                                          child: Stack(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  right: 10,
                                                ),
                                                child: CircleAvatar(
                                                  radius: 26,
                                                  backgroundColor: Colors.transparent,
                                                  backgroundImage: NetworkImage(
                                                    viewModel.result.value.driver?.vehicle?.vehiclePicture ?? "",
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 10,
                                                right: 0,
                                                child: CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: Colors.white,
                                                  child: CircleAvatar(
                                                    radius: 13,
                                                    backgroundColor: Colors.transparent,
                                                    backgroundImage: NetworkImage(viewModel.result.value.driver?.picture ?? ""),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(bottom: 5),
                                                child: Builder(
                                                  builder: (context) {
                                                    var firstName = viewModel.result.value.driver?.name ?? "";
                                                    var lastname = viewModel.result.value.driver?.lastname ?? "";
                                                    var age = viewModel.result.value.driver?.age ?? "";
                                                    return Text(
                                                      '$firstName $lastname (${age})',
                                                      style: bottomReviewText,
                                                    );
                                                  }
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  '${viewModel.result.value.driver?.vehicle?.plateNo}',
                                                  style: resultText,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Image.asset(
                                                  'assets/images/star1.png',
                                                  fit: BoxFit.contain,
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              Text(' ' + '${viewModel.result.value.driver?.ratings?.avg}',
                                                style: myBookSumStar,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Color(0xFFE6E6E6),
                                    thickness: 1,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin:
                                        EdgeInsets.only(bottom: 15, top: 15),
                                        child: Text(
                                          'Destination',
                                          style: inforTitleText,
                                        ),
                                      ),
                                      ListView.separated(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 16),
                                        itemCount: viewModel.result.value?.ride
                                            ?.destinations?.length ??
                                            0,
                                        primary: false,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final item = viewModel.result.value.ride?.destinations?[index];
                                          return ItemDestination(item);
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                            Divider(
                                              height: 16,
                                              indent: 40,
                                            ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 18),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Total Distance',
                                                style: inforTitleText,
                                              ),
                                            ),
                                            Builder(builder: (context) {
                                              num km = 0;

                                              var result = viewModel.result.value;

                                              if (result.weRentResponse !=
                                                  null) {
                                                km = result?.weRentResponse
                                                    ?.distance
                                                    ?.km ??
                                                    0;
                                              } else if (result?.driveYourCarResponse !=
                                                  null) {
                                                km = result?.driveYourCarResponse
                                                    ?.distance
                                                    ?.km ??
                                                    0;
                                              } else if (result.assistant !=
                                                  null) {
                                                km = result.assistant
                                                    ?.distance
                                                    ?.km ??
                                                    0;
                                              } else if (result.ride !=
                                                  null) {
                                                km = result.ride?.distance?.km ??
                                                    0;
                                              }
                                              return Text(
                                                '$km km',
                                                style: distanceText,
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Color(0xFFE6E6E6),
                                        thickness: 1,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 15, top: 18),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Summary',
                                                style: inforTitleText,
                                              ),
                                            ),
                                            Text(
                                              'Total',
                                              style: inforTitleText,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(right: 8),
                                                      padding:
                                                      EdgeInsets.fromLTRB(10, 7, 10, 7),
                                                      decoration: paymentButton,
                                                      child: Text.rich(
                                                        TextSpan(
                                                          text:
                                                          viewModel.result.value.paymentMethod ?? "",
                                                          style: paymentButtonText,
                                                        ),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        if (viewModel.result?.value?.couponId ==
                                                            null) {
                                                          return SizedBox(
                                                            height: 0,
                                                          );
                                                        }
                                                        return Container(
                                                          decoration:
                                                          pomotionSelectedDecoration
                                                              ?.copyWith(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(
                                                                Radius.circular(7),
                                                              )),
                                                          padding: EdgeInsets.fromLTRB(
                                                              10, 7, 10, 7),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: 5),
                                                                child: Image.asset(
                                                                  'assets/images/wallet1.png',
                                                                  fit: BoxFit.fill,
                                                                  height: 16,
                                                                  width: 16,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Container(
                                                                    child: Text.rich(
                                                                      TextSpan(
                                                                        text:
                                                                        viewModel.result
                                                                            .value
                                                                            ?.coupon
                                                                            ?.name ??
                                                                            "",
                                                                        style:
                                                                        codePromoText,
                                                                      ),
                                                                      maxLines: 1,
                                                                      overflow: TextOverflow
                                                                          .ellipsis,
                                                                    )),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }
                                                    ),
                                                    Expanded(
                                                        child: SizedBox(
                                                          width: 8,
                                                        ))
                                                  ],
                                                )),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              width: 120,
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "${viewModel.result.value.total} ฿",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: priceTotalText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '+${viewModel.result.value.points}pts',
                                          style: poinText,
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ])),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15, color: Colors.grey[300]!, spreadRadius: 8)
                    ],
                  ),
                  child: Container(
                    margin:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
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
                        onPressed: () async{
                          await launchUrl(Uri.parse(
                              'tel:${viewModel.result?.value.driver?.phone ?? ""}'));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/phone1.png',
                                fit: BoxFit.fill,
                                color: Color(0xFF363636),
                                height: 13,
                                width: 13,
                              ),
                            ),
                            Text(
                              'Contact Driver',
                              style: TextStyle(
                                  color: Color(0xFF363636),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        }));
  }

}


class MyBookingViewModel extends GetxController {

  Dio dio;

  num orderId = -1;

  var result = ActivityDetail().obs;
  var loading = false.obs;
  List<Destinations> destinationAddress = [];

  MyBookingViewModel(this.dio);

  Future getOrderDetail() async {
    loading.value = true;
    var response = await dio.get('activities/$orderId');
    var activityResponse = WeRideActivityResponse.fromJson(response.data);
    result.value = activityResponse.result!;

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

    loading.value = false;
  }

  void setOrderId(num orderId) {
    this.orderId= orderId;
  }
}