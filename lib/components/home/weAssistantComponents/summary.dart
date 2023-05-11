import 'dart:math';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:we_link/components/home/weAssistantComponents/reviewWeAssis.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class summary extends StatelessWidget {
  const summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            shape: appbarBorder,
            // leading: Container(
            //   margin: EdgeInsets.only(left: 5),
            //   child: IconButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     icon: Image.asset('assets/images/goBack.png'),
            //   ),
            // ),
            centerTitle: true,
            title: Text(
              'Summary',
              style: titleYellowAppbar,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
                Container(
                  constraints: maxHeightContain,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.fromLTRB(30, 21, 30, 21),
                  child: Column(children: [
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
                                  child: Text(
                                    "We Assistant",
                                    style: typeTText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text("We0981230", style: fieldSearchHintText),
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
                          margin: EdgeInsets.only(bottom: 18, top: 18),
                          child: Text(
                            'Driver',
                            style: inforTitleText,
                          ),
                        ),
                        Container(
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
                                            'https://images.unsplash.com/photo-1550355291-bbee04a92027?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
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
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        'Lesster Lopez (35)',
                                        style: bottomReviewText,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Gray Vesta | 01E216RA',
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
                                    Text(
                                      ' ' + '4.5',
                                      style: myBookSumStar,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
                Container(
                  constraints: maxHeightContain,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.fromLTRB(30, 21, 30, 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 15),
                        child: Text(
                          'Order detail',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9D9E9B),
                              fontFamily: 'Kanit'),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Orange',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                          Text(
                            'x1',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontFamily: 'Kanit'),
                          ),
                        ],
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          padding: EdgeInsets.fromLTRB(9, 5, 9, 5),
                          width: 120,
                          decoration: checkDetailDecoration,
                          child: Row(
                            children: [
                              Container(
                                  child: Text.rich(
                                TextSpan(
                                  text: "Estimated price ",
                                  style: orderButtonText,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                              Expanded(
                                child: Container(
                                    child: Text.rich(
                                  TextSpan(
                                    text: "  30฿",
                                    style: orderButtonTText,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ),
                            ],
                          )),
                    ],
                  ),
                )
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Product price to be paid on delivery',
                        style: TextStyle(
                            color: Color(0xFFB3B3B3),
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Kanit'),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                    fontFamily: 'Kanit'),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                                decoration: BoxDecoration(
                                    color: Color(0xFF189B58),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    )),
                                child: Text(
                                  "Cash",
                                  style: paymentTextBut,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '200 ฿',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              fontFamily: 'Kanit'),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 31),
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
                          // callOutAlert(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    reviewWeAssis()),
                          );
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                              color: Color(0xFF363636),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
