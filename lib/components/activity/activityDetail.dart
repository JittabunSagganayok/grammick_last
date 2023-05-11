import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:we_link/views/main_screen.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class activityDetail extends StatefulWidget {
  activityDetail({Key? key}) : super(key: key);

  @override
  State<activityDetail> createState() => _activityDetailState();
}

class _activityDetailState extends State<activityDetail> {
  bool hide = false;
  @override
  Widget build(BuildContext context) {
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
              'Review',
              style: titleYellowAppbar,
            ),
          ),
        ),
        body: SingleChildScrollView(
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
                                child: Text("Order : ", style: fieldSearchHintText)),
                            Container(
                              margin: EdgeInsets.only(left: 9),
                              padding: EdgeInsets.fromLTRB(9, 6, 9, 6),
                              decoration: typeButton,
                              child: Text(
                                "We Ride",
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
                Container(
                  margin: EdgeInsets.only(top: 35, bottom: 7),
                  child: Text(
                    'The ride is over',
                    style: TitleActivity,
                  ),
                ),
                Container(
                  child: Text(
                    'Rate your trip, it is important for us',
                    style: subTitleActivity,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10, top: 18, bottom: 19),
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Lesster Lopez (35)',
                    style: bottomSubTitleText,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Gray Vesta | 01E216RA',
                    style: subtitleActivity,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < 5; i++)
                      Container(
                        // alignment: Alignment.centerLeft,
                        // margin: EdgeInsets.only(right: 5),
                        child: Image.asset(
                          'assets/images/star1.png',
                          fit: BoxFit.contain,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    Text(
                      ' ' + '5',
                      style: sumStar,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 36),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Comment :',
                            style: placeText,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Lorem Ipsum is simply dummy text',
                                style: commemtSub,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                'of the printing and typesetting ',
                                style: commemtSub,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            constraints: maxHeightContain,
            color: Colors.white,
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.fromLTRB(30, 21, 30, 21),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Detail',
                          style: titleHide,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            hide = !hide;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.fromLTRB(14, 6, 14, 6),
                          decoration: BoxDecoration(
                              color: hide ? Colors.black : Color(0xFF189B58),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Text.rich(
                            TextSpan(
                              text: hide ? 'See more' : "Hide",
                              style: hideText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xFFE6E6E6),
                  thickness: 1,
                ),
                !hide
                    ? Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(bottom: 15, top: 18),
                            child: Text(
                              'Destination',
                              style: inforTitleText,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        'assets/images/loca1.png',
                                        fit: BoxFit.contain,
                                        height: 26,
                                        width: 26,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 2, bottom: 2),
                                      child: SizedBox(
                                        height: 10,
                                        child: DottedLine(
                                          direction: Axis.vertical,
                                          dashColor: Colors.black,
                                          dashLength: 3,
                                          dashGapLength: 3,
                                          lineThickness: 3,
                                          dashRadius: 5,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Image.asset(
                                        'assets/images/lo5.png',
                                        fit: BoxFit.contain,
                                        height: 26,
                                        width: 26,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.only(left: 25, right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '300/4, Premuim Place',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: placeText,
                                    ),
                                    SizedBox(height: 3),
                                    Divider(
                                      color: Color(0xFFE6E6E6),
                                      thickness: 1,
                                    ),
                                    SizedBox(height: 3),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'The Mall Bangkapi',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: placeText,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ))
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15, top: 18),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Total Distance',
                                    style: inforTitleText,
                                  ),
                                ),
                                Text(
                                  '30km',
                                  style: distanceText,
                                ),
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
                                          text: "Credit debit",
                                          style: paymentButtonText,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 9, 10, 9),
                                          decoration: typeButton,
                                          child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                child: Image.asset(
                                                  'assets/images/tag.png',
                                                  fit: BoxFit.fill,
                                                  height: 10,
                                                  width: 14,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                    child: Text(
                                                  "ride50Freeiks...",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: sumButtonText,
                                                )),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                )),
                                SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  width: 100,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "200 ฿",
                                    maxLines: 1,
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
                              '+23pts',
                              style: poinText,
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ])));
  }
}
