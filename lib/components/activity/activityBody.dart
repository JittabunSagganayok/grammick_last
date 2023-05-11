import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/activity/activityAll.dart';
import 'package:we_link/components/activity/activityBook.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

import '../../di/app_module.dart';
import '../../models/activity/history/get_activity_history_list_response.dart';
import '../../views/main_screen.dart';

class activityBody extends StatefulWidget {
  List<ActivityList> activityList = [];
  num totalBadge;

  activityBody(
    this.activityList,
    this.totalBadge,
  );

  @override
  State<activityBody> createState() => _activityBodyState();
}

class _activityBodyState extends State<activityBody> {
  var indexSelects = 0;

  var title = [
    {"name": "All"},
    {"name": "Booking"},
    {"name": "Drive for you"},
    {"name": "WeRide"},
    {"name": "WeRide 2 points"},
    {"name": "WeRent"},
    {"name": "WeAssistant"},
  ];

  void clickSelects(i) {
    setState(() {
      indexSelects = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: maxHeightContain,
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i != title.length; i++)
                    Container(
                      child: Stack(
                        children: [
                          Container(
                            // color: Colors.amber,
                            padding: EdgeInsets.only(top: 6),
                            child: Container(
                              height: 33,
                              margin: EdgeInsets.only(right: 10),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: indexSelects == i
                                      ? Color(0xFF3CCC53)
                                      : Colors.white,
                                  textStyle: TextStyle(fontSize: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  side: BorderSide(
                                    width: 0.0,
                                    color: indexSelects == i
                                        ? Color(0xFF3CCC53)
                                        : appBackgroundColor,
                                  ),
                                ),
                                onPressed: () => clickSelects(i),
                                child: Text(
                                  '${title[i]['name']}',
                                  style: TextStyle(
                                      color: indexSelects == i
                                          ? Colors.white
                                          : Color(0xFF999999),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Kanit'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 6,
                            top: 0,
                            child: title[i]['name'] == 'Booking'
                                ? Builder(builder: (context) {
                                    if (widget.totalBadge <= 0) {
                                      return SizedBox(
                                        height: 0,
                                      );
                                    }
                                    return Container(
                                      width: 16,
                                      height: 16,
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFB6756),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        '${widget.totalBadge}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  })
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            // constraints: maxHeightContain,
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                child: Builder(builder: (context) {
                  if (indexSelects != 1) {
                    var activityList = widget.activityList;
                    if (indexSelects == 2) {
                      activityList = widget.activityList
                          .where((element) =>
                              element.type?.toUpperCase() == 'DRIVE_YOUR_CAR')
                          .toList();
                    } else if (indexSelects == 3) {
                      activityList = widget.activityList
                          .where((element) =>
                              element.type?.toUpperCase() == 'RIDE')
                          .toList();
                    } else if (indexSelects == 4) {
                      activityList = widget.activityList
                          .where((element) =>
                              element.type?.toUpperCase() == 'RIDE_TWO_POINS')
                          .toList();
                    } else if (indexSelects == 5) {
                      activityList = widget.activityList
                          .where((element) =>
                              element.type?.toUpperCase() == 'RENT')
                          .toList();
                    } else if (indexSelects == 6) {
                      activityList = widget.activityList
                          .where((element) =>
                              element.type?.toUpperCase() == 'ASSISTANT')
                          .toList();
                    }
                    return ActivityAll(activityList);
                  } else {
                    return activityBook(widget.activityList
                        .where((element) =>
                            element.status?.toUpperCase() == 'BOOK')
                        .toList());
                  }
                }),
              ),
            ),
          ),
        )
      ],
    );
  }
}
