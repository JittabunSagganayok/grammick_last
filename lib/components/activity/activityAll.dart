import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:we_link/components/activity/bookComponent/myBooking.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/models/activity/history/get_activity_history_list_response.dart';
import 'package:we_link/models/we_ride/create_we_ride_order_response.dart';

import '../../di/app_module.dart';
import '../../models/activity/we-ride/we_ride_activity_response.dart';
import '../home/weLinkComponents/rideComponents/callCar/loadCallCar.dart';
import '../home/weLinkComponents/rideComponents/callCar/review.dart';

class ActivityAll extends StatefulWidget {
  List<ActivityList> activityList;

  ActivityAll(this.activityList);

  @override
  State<ActivityAll> createState() => _ActivityAllState();
}

class _ActivityAllState extends State<ActivityAll> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: widget.activityList.length,
      padding: EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int index) {
        final item = widget.activityList[index];
        return Column(
          children: [
            GestureDetector(
              onTap: () async {
                if (item.status == 'SUCCESS' || item.status == 'CANCEL') {
                  var dio = appModule.get<Dio>();
                  var response = await dio.get('activities/${item.id}');
                  var activityResponse = WeRideActivityResponse.fromJson(response.data);
                  Get.to(ActivityReviewScreen(
                    activityResponse: activityResponse,
                    enableEditing: false,
                  ));
                } else {
                  if (item.type == 'RIDE' && item.status == 'BOOK') {
                    if (item.driverId != null) {
                      Get.to(
                        MyBookingScreen(),
                        arguments: item.id,
                      );
                    }
                  }  else{
                    weRideOrderResponse = OrderDetail(id: item.id?.toInt());
                    Get.to(PendingDriverAcceptScreen());
                  }
                }
              },
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: item.status?.toUpperCase() != 'SUCCESS' ||
                                item.status != 'CANCEL'
                            ? 20
                            : 0,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                        decoration: BoxDecoration(
                            color: item.status?.toUpperCase() != 'SUCCESS' ||
                                    item.status?.toUpperCase() != 'CANCEL'
                                ? Color(0xFFFFF8DB)
                                : Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      child: Text.rich(
                                    TextSpan(
                                        text: "Order : " +
                                            "${item.orderId ?? ''}",
                                        style: orderText,
                                        children: [
                                          TextSpan(
                                            text: item.status != 'CANCEL'
                                                ? ''
                                                : '   ' + "Cancelled",
                                            style: cancelOrderText,
                                          )
                                        ]),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                ),
                                Text(
                                    DateFormat('dd/MM/yyyy hh:mm').format(
                                        DateTime.parse(item.createdDt ?? "").add(Duration(hours: 7))),
                                    style: orderText),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text('${item.title}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: titleActivity),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("${item.total} ฿",
                                    style: TextStyle(
                                        color: item.status?.toUpperCase() !=
                                                'CANCEL'
                                            ? Color(0xFF189B58)
                                            : Color(0xFFF8772F),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Kanit')),
                              ],
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 8),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 6, 10, 6),
                                        decoration: BoxDecoration(
                                            color: item.status?.toUpperCase() !=
                                                    'CANCEL'
                                                ? Color(0xFF189B58)
                                                : Color(0xFFF8772F),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(7),
                                            )),
                                        child: Text(
                                          "${item.paymentMethod}",
                                          style: paymentTextBut,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            9, 6, 9, 6),
                                        decoration: typeButton,
                                        child: Text(
                                          "${item.type}",
                                          style: typeText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text("+${item.point} Points", style: poinText),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Builder(builder: (context) {
                        if (item.status?.toUpperCase() == 'PROCESS') {
                          return Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.all(10),
                            decoration: processButton,
                            child: Text(
                              "on Process",
                              style: processText,
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: item.status?.toUpperCase() == 'PROCESS' ? 5 : 0),
            // Builder(builder: (context) {
            //   if (item.status?.toUpperCase() == 'PROCESS') {
            //     return Container();
            //   } else {
            //     return Divider(
            //       color: Color(0xFFEEEEEE),
            //       thickness: 1,
            //     );
            //   }
            // }),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 16,
        color: Colors.transparent,
      ),
    ));
  }
}
