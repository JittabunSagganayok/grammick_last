import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:we_link/components/activity/bookComponent/myBooking.dart';

import '../../constant/stylesConstants.dart';
import '../../models/activity/history/get_activity_history_list_response.dart';

class activityBook extends StatefulWidget {
  List<ActivityList> activityList;

  activityBook(this.activityList);

  @override
  State<activityBook> createState() => _activityBookState();
}

class _activityBookState extends State<activityBook> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          final item = widget.activityList[index];
          return GestureDetector(
            onTap: () {
              if (item.driverId != null) {
                Get.to(
                  MyBookingScreen(),
                  arguments: item.id,
                );
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              decoration: BoxDecoration(
                  color: Color(0xFFE87913),
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
                            text: "Order : " + "${item.orderId}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Kanit'),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                              DateFormat('MMM, dd yyyy')
                                  .format(DateTime.parse(item.createdDt ?? "")),
                              // "March, 31 2022",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Kanit')),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${item.price}-${item.total} ฿",
                          style: TextStyle(
                              color: Color(0xFFFEDB46),
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Kanit')),
                    ],
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          DateFormat('hh:mm aaa')
                              .format(DateTime.parse(item.createdDt ?? "")),
                          // "13.40 PM",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Kanit')),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 8),
                              padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                              decoration: paymentButton,
                              child: Text(
                                item.paymentMethod ?? "",
                                style: paymentTextBut,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(9, 6, 9, 6),
                              decoration: typeButton,
                              child: Text(
                                item.type ?? "",
                                style: typeText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: widget.activityList.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 16,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
