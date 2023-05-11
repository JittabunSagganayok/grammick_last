import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/callScreen.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/viewImage.dart';
import 'package:we_link/components/message/chat.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

void informationDriver(BuildContext context, ToHome, atStoreTop) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      var imageUrl =
          'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60';
      var imageCarUrl =
          'https://images.unsplash.com/photo-1550355291-bbee04a92027?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60';
      return Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 100),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 57),
                child: ClipPath(
                    clipper: CustomClipperImage(),
                    child: Container(
                      constraints: maxHeightContain,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: bottomDecoration,
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 17,
                                ),
                                Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            callScreen()),
                                                  );
                                                },
                                                child: CircleAvatar(
                                                  radius: 27,
                                                  backgroundColor:
                                                      Color(0xFF57B861),
                                                  child: Image.asset(
                                                    'assets/images/phone1.png',
                                                    fit: BoxFit.contain,
                                                    height: 22,
                                                    width: 22,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           ChatListScreen(
                                                  //               chatDiver:
                                                  //                   'chatDiver')),
                                                  // );
                                                },
                                                child: CircleAvatar(
                                                  radius: 27,
                                                  backgroundColor:
                                                      Color(0xFFFDB824),
                                                  child: Image.asset(
                                                    'assets/images/chat2.png',
                                                    fit: BoxFit.contain,
                                                    height: 22,
                                                    width: 22,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          top: 5,
                                          right: 25,
                                          child: CircleAvatar(
                                            radius: 4,
                                            backgroundColor: Color(0xFFEF3738),
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  child: Text(
                                   ToHome == 'ToHome' ? 'The driver has Arrived' : 'the driver is going',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                        fontFamily: 'Kanit'),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Gray Vesta | 01E216RA ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontFamily: 'Kanit'),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 15, top: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                                child: Text("Order : ",
                                                    style:
                                                        fieldSearchHintText)),
                                            Container(
                                              margin: EdgeInsets.only(left: 9),
                                              padding: EdgeInsets.fromLTRB(
                                                  9, 6, 9, 6),
                                              decoration: typeButton,
                                              child: Text(
                                                "We Assistant",
                                                style: typeTText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text("We0981230",
                                          style: fieldSearchHintText),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Color(0xFFE6E6E6),
                                  thickness: 1,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(top: 15, bottom: 15),
                                  child: Text(
                                    'DRIVER',
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
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: CircleAvatar(
                                        radius: 19,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage(
                                            'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Lesster Lopez (35)',
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily: 'Kanit'),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Image.asset(
                                              'assets/images/star1.png',
                                              fit: BoxFit.contain,
                                              height: 22,
                                              width: 22,
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              ' 4.5',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontFamily: 'Kanit'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 21),
                                Divider(
                                  color: Color(0xFFE6E6E6),
                                  thickness: 1,
                                ),
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
                                                  'Home , Keas 69 Str.15234',
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
                                SizedBox(height: 21),
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
                                if (ToHome == 'ToHome' || atStoreTop == 'atStoreTop') ...[
                                  Container(
                                    alignment: Alignment.topLeft,
                                      margin:
                                          EdgeInsets.only(top: 10,),
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
                                          // Spacer(),
                                        ],
                                      ))
                                ],
                                SizedBox(height: 21),
                                Divider(
                                  color: Color(0xFFE6E6E6),
                                  thickness: 1,
                                ),
                                // Container(
                                //   margin: EdgeInsets.only(bottom: 15, top: 20),
                                //   child: Divider(
                                //     color: Color(0xFFE6E6E6),
                                //     thickness: 1,
                                //   ),
                                // ),
                                // Container(
                                //   alignment: Alignment.centerLeft,
                                //   margin: EdgeInsets.only(bottom: 15),
                                //   child: Text(
                                //     'Summary',
                                //     style: inforTitleText,
                                //   ),
                                // ),
                                // Row(
                                //   children: [
                                //     Expanded(
                                //       child: Container(
                                //         height: 45,
                                //         width:
                                //             MediaQuery.of(context).size.width *
                                //                 1,
                                //         child: OutlinedButton(
                                //             style: paymentOutlined,
                                //             onPressed: () {},
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   margin:
                                //                       EdgeInsets.only(right: 5),
                                //                   child: Image.asset(
                                //                     'assets/images/master.png',
                                //                     fit: BoxFit.fill,
                                //                     height: 18,
                                //                     width: 30,
                                //                   ),
                                //                 ),
                                //                 Expanded(
                                //                   child: Container(
                                //                       child: Text.rich(
                                //                     TextSpan(
                                //                       text: "4383",
                                //                       style: paymentText,
                                //                     ),
                                //                     maxLines: 2,
                                //                     overflow:
                                //                         TextOverflow.ellipsis,
                                //                   )),
                                //                 ),
                                //               ],
                                //             )),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 12,
                                //     ),
                                //     Expanded(
                                //       child: Container(
                                //         height: 45,
                                //         width:
                                //             MediaQuery.of(context).size.width *
                                //                 1,
                                //         child: OutlinedButton(
                                //             style: codePromoOutlined,
                                //             onPressed: () {},
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   margin:
                                //                       EdgeInsets.only(right: 5),
                                //                   child: Image.asset(
                                //                     'assets/images/tag.png',
                                //                     fit: BoxFit.fill,
                                //                     height: 14,
                                //                     width: 22,
                                //                   ),
                                //                 ),
                                //                 Expanded(
                                //                   child: Container(
                                //                       child: Text.rich(
                                //                     TextSpan(
                                //                       text: "ride50Freeiks...",
                                //                       style: codePromoText,
                                //                     ),
                                //                     maxLines: 1,
                                //                     overflow:
                                //                         TextOverflow.ellipsis,
                                //                   )),
                                //                 ),
                                //               ],
                                //             )),
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 12,
                                // ),
                                // Container(
                                //   height: 45,
                                //   width: MediaQuery.of(context).size.width * 1,
                                //   child: OutlinedButton(
                                //       style: totalButton,
                                //       onPressed: () {},
                                //       child: Row(
                                //         children: [
                                //           Expanded(
                                //             child: Container(
                                //                 child: Text.rich(
                                //               TextSpan(
                                //                 text: "Total",
                                //                 style: totalText,
                                //               ),
                                //               maxLines: 2,
                                //               overflow: TextOverflow.ellipsis,
                                //             )),
                                //           ),
                                //           Container(
                                //               margin: EdgeInsets.only(
                                //                   left: 10, right: 5),
                                //               child: Text.rich(
                                //                 TextSpan(
                                //                   text: "30 ฿",
                                //                   style: priceTotalText,
                                //                 ),
                                //                 maxLines: 2,
                                //                 overflow: TextOverflow.ellipsis,
                                //               )),
                                //         ],
                                //       )),
                                // ),
                                // SizedBox(height: 20),
                                // Divider(
                                //   color: Color(0xFFE6E6E6),
                                //   thickness: 1,
                                // ),
                                SizedBox(height: 20),
                                if (ToHome != 'ToHome'  && atStoreTop != 'atStoreTop') ...[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: Image.asset(
                                            'assets/images/close2.png',
                                            fit: BoxFit.fill,
                                            height: 22,
                                            width: 22,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          child: Text(
                                            'Cancel',
                                            style: cancelInfor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                SizedBox(
                                  height: 35,
                                ),
                              ]),
                        ),
                      ),
                    )),
              ),
              Positioned(
                right: 2,
                left: 0,
                top: 0,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                viewImage(imageUrl: imageCarUrl)),
                      );
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 56,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage('${imageCarUrl}'),
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   right: 0,
              //   left: 120,
              //   top: 35,
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => viewImage(imageUrl: imageUrl)),
              //       );
              //     },
              //     child: Container(
              //       child: CircleAvatar(
              //         radius: 30,
              //         backgroundColor: Colors.white,
              //         child: CircleAvatar(
              //           radius: 27,
              //           backgroundColor: Colors.transparent,
              //           backgroundImage: NetworkImage('${imageUrl}'),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ));
    },
  );
}

class CustomClipperImage extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(2 * size.width / 2.9, 0.0);
    // var firstEnd = Offset(size.width / 1, size.height / 2);
    path.arcToPoint(Offset(size.width / 3.25, 0), radius: Radius.circular(1));

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
