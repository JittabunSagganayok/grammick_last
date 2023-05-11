import 'package:flutter/material.dart';
import 'package:we_link/components/activity/activityDetail.dart';
import 'package:we_link/views/main_screen.dart';
import 'package:we_link/components/profile/scheduleComponent/scheduleDetail.dart';
import 'package:we_link/constant/colosrConstants.dart';

var dataList = [
  {
    "title": "The Mall bangkapi to 129/203 Rajaman...",
    "subtitle": "The Mall Bangkapi",
    "price": "400 ฿",
    "point": "+ 20 Points",
    "time": '13.40 PM',
    "image": "assets/images/car6.png",
     "payment": "WeWallet",
    "type": "We Ride",
    "order": true,
    "process": true,
    "status": true,
    "status1": true,
  },
  {
    "title": "The Mall bangkapi to 129/203 Rajaman...",
    "subtitle": "The Mall Bangkapi",
    "price": "100 ฿",
    "point": "+ 20 Points",
    "time": '13.40 PM',
    "image": "assets/images/car5.png",
    "payment": "WeWallet",
    "type": "We Ride",
    "order": true,
    "process": false,
    "status": false,
    "status1": false,
  },
  {
    "title": "Fashion Island place",
    "subtitle": "The Mall Bangkapi",
    "price": "270 ฿",
    "point": "+ 20 Points",
    "time": '13.40 PM',
    "image": "assets/images/car7.png",
     "payment": "Case",
    "type": "We Assistant",
    "order": true,
    "process": false,
    "status": true,
    "status1": false,
  },
  {
    "title": "The Mall bangkapi to 129/203 Rajaman...",
    "subtitle": "The Mall Bangkapi",
    "price": "100 ฿",
    "point": "+ 20 Points",
    "time": '13.40 PM',
    "image": "assets/images/car7.png",
    "payment": "Case",
    "type": "We Ride 2 points",
    "order": false,
    "process": false,
    "status": true,
    "status1": false,
  },
];

class activityTran extends StatelessWidget {
  const activityTran({Key? key, this.mySchedule}) : super(key: key);
  final int? mySchedule;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        for (var i = 0; i < dataList.length; i++)
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  this.mySchedule == 1
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scheduleDetail()),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => activityDetail()),
                        );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Image.asset(
                        '${dataList[i]['image']}',
                        fit: BoxFit.fill,
                        height: 34,
                        width: 34,
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text.rich(
                                TextSpan(
                                    text: "${dataList[i]['title']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Kanit')),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ),
                            Text("${dataList[i]['price']}",
                                style: TextStyle(
                                    color: Color(0xFF41C221),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Kanit')),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Text.rich(
                                TextSpan(
                                    text: "${dataList[i]['subtitle']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Kanit')),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ),
                            Text("${dataList[i]['point']}",
                                style: TextStyle(
                                    color: Color(0xFF898A8D),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Kanit')),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        if (this.mySchedule != 1) ...[
                          dataList[i]['status'] as bool
                              ? Row(
                                  children: [
                                    Text("Reorder",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: yellowColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Kanit')),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 10,
                                      color: yellowColor,
                                    )
                                  ],
                                )
                              : Text("Cancelled",
                                  style: TextStyle(
                                      color: Color(0xFFD52E2F),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Kanit')),
                        ],
                        if (this.mySchedule == 1) ...[
                          Row(
                            children: [
                              Text(
                                  dataList[i]['status1'] as bool
                                      ? "See more"
                                      : "Reorder",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: yellowColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Kanit')),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 10,
                                color: yellowColor,
                              ),
                              Spacer(),
                              dataList[i]['status1'] as bool
                                  ? Expanded(
                                      child: Container(
                                      alignment: Alignment.topRight,
                                      child: Text("Later ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: 'Kanit')),
                                    ))
                                  : Container()
                            ],
                          )
                        ]
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(height: 21),
              dataList[i]['process'] as bool ? Container() :
              Divider(
                color: Color(0xFFEEEEEE),
                thickness: 1,
              ),
              SizedBox(height: 21),
            ],
          )
      ],
    ));
  }
}
