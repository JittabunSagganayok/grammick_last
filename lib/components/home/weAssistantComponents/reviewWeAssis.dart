import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:we_link/views/main_screen.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class reviewWeAssis extends StatefulWidget {
  reviewWeAssis({Key? key}) : super(key: key);

  @override
  State<reviewWeAssis> createState() => _reviewWeAssisState();
}

class _reviewWeAssisState extends State<reviewWeAssis> {
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
                          for (var i = 0; i < 4; i++)
                            Container(
                              child: Image.asset(
                                'assets/images/star1.png',
                                fit: BoxFit.contain,
                                height: 50,
                                width: 50,
                              ),
                            ),
                          Container(
                            child: Image.asset(
                              'assets/images/Star.png',
                              fit: BoxFit.contain,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Text(
                            ' ' + '4',
                            style: sumStar,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          maxLines: 5,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Write you comment',
                            fillColor: Color(0xFFFBFBFB),
                            filled: true,
                            hintStyle: hintTextStyle,
                            enabledBorder: reviewBorderStyle,
                            focusedBorder: reviewBorderStyle,
                          ),
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
                                    color:
                                        hide ? Colors.black : Color(0xFF189B58),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(bottom: 15, top: 23),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Destination',
                                        style: inforTitleText,
                                      ),
                                      Text(
                                        'Destination',
                                        style: inforTitleText,
                                      ),
                                    ],
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
                                            margin: EdgeInsets.only(
                                                top: 2, bottom: 2),
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
                                      margin:
                                          EdgeInsets.only(left: 25, right: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(bottom: 15, top: 23),
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
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 20),
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
                                Divider(
                                  color: Color(0xFFE6E6E6),
                                  thickness: 1,
                                ),
                                Container(
                                  height: 180,
                                  width: MediaQuery.of(context).size.width * 1,
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1581067721837-e4809b29692d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvcHBpbmclMjBiYWd8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20, top: 18),
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Shipping Cost',
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF858585),
                                            fontFamily: 'Kanit'),
                                      ),
                                    ),
                                    Text(
                                      '63 ฿',
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
                                  margin: EdgeInsets.only(bottom: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 8),
                                            padding: EdgeInsets.fromLTRB(
                                                10, 7, 10, 7),
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
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 9, 10, 9),
                                                decoration: typeButton,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 5),
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                          '+23pts',
                                          style: poinText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Divider(
                                  color: Color(0xFFE6E6E6),
                                  thickness: 1,
                                ),
                                SizedBox(height: 21),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Product price',
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black,
                                            fontFamily: 'Kanit'),
                                      ),
                                    ),
                                    Text(
                                      '200 ฿',
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
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                                  decoration: paymentButton,
                                  child: Text(
                                    "Cash",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Kanit'),
                                  ),
                                ),
                                SizedBox(height: 30),
                              ],
                            )
                          : Container()
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                          color: Color(0xFF363636),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
