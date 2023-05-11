import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:we_link/components/home/weAssistantComponents/callWeLink.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/paymentCallCar.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/promotion.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class checkDetails extends StatelessWidget {
  const checkDetails({Key? key}) : super(key: key);

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
              'Check details',
              style: titleWhiteAppbar,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                            'Home , Keas 69 Str.15234',
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
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Detail order',
                              style: inforTitleText,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Orange x 1',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontFamily: 'Kanit'),
                                ),
                              ),
                              Text(
                                'x1',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontFamily: 'Kanit'),
                              ),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10, bottom: 23),
                              padding: EdgeInsets.fromLTRB(9, 7, 9, 7),
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
                                  // Spacer(),
                                ],
                              )),
                          Divider(
                            color: Color(0xFFE6E6E6),
                            thickness: 1,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15, top: 18),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Payment method',
                              style: inforTitleText,
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    child: OutlinedButton(
                                        style: paymentOutlined,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PaymentMethodScreen()),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child: Image.asset(
                                                'assets/images/master.png',
                                                fit: BoxFit.fill,
                                                height: 18,
                                                width: 30,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  child: Text.rich(
                                                TextSpan(
                                                  text: "4383",
                                                  style: paymentText,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, right: 5),
                                              child: Image.asset(
                                                'assets/images/nx.png',
                                                fit: BoxFit.fill,
                                                height: 18,
                                                width: 18,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    child: OutlinedButton(
                                        style: codePromoOutlined,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PromotionScreen()),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child: Image.asset(
                                                'assets/images/tag.png',
                                                fit: BoxFit.fill,
                                                height: 14,
                                                width: 22,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  child: Text.rich(
                                                TextSpan(
                                                  text: "ride50Freeiks...",
                                                  style: codePromoText,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: Image.asset(
                                                'assets/images/nx1.png',
                                                fit: BoxFit.fill,
                                                height: 18,
                                                width: 18,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          SizedBox(height: 30),
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
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'The price of the product does not',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF4B4B4B),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Kanit'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'include payment on delivery.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF4B4B4B),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Kanit'),
                      ),
                    ),
                    Container(
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
                          // callOutAlert(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    callWeLink()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Confirm',
                              style: TextStyle(
                                  color: Color(0xFF060606),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit'),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text.rich(
                                  TextSpan(
                                      text: "(shipping cost)",
                                      style: TextStyle(
                                          color: Color(0xFF060606),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Kanit'),
                                      children: [
                                        TextSpan(
                                          text: "   " + "63 ฿",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Kanit'),
                                        ),
                                      ]),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
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
