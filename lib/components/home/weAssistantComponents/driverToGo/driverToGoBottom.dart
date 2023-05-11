import 'package:flutter/material.dart';
import 'package:we_link/components/home/weAssistantComponents/informationDriver.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/callScreen.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/viewImage.dart';
import 'package:we_link/components/message/chat.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class driverToGoBottom extends StatelessWidget {
  const driverToGoBottom({Key? key, this.ToHome, this.atStoreTop})
      : super(key: key);
  final String? ToHome;
  final String? atStoreTop;

  @override
  Widget build(BuildContext context) {
    var imageUrl =
        'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60';
    var imageCarUrl =
        'https://images.unsplash.com/photo-1550355291-bbee04a92027?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60';
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 57),
                child: ClipPath(
                    clipper: CustomClipperImage(),
                    child: Container(
                      // height: MediaQuery.of(context).size.width * 0.3,
                      constraints: maxHeightContain,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: bottomDecoration,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                              //       builder: (context) => ChatListScreen(
                                              //           chatDiver:
                                              //               'chatDiver')),
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
                                      right: 30,
                                      child: CircleAvatar(
                                        radius: 4,
                                        backgroundColor: Color(0xFFEF3738),
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.fromLTRB(9, 6, 9, 6),
                              decoration: typeButton,
                              child: Text(
                                "We Assistant",
                                style: typeTText,
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 5),
                              child: Text(
                                ToHome == 'ToHome'
                                    ? 'The driver has Arrived'
                                    : atStoreTop == 'atStoreTop'
                                        ? 'Arrived at the shop'
                                        : 'the driver is going',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                    fontFamily: 'Kanit'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
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
                                  child: Image.asset(
                                    'assets/images/star1.png',
                                    fit: BoxFit.contain,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    ' 4.5',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontFamily: 'Kanit'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       height: 40,
                            //       width: 100,
                            //       margin: EdgeInsets.only(right: 15),
                            //       child: OutlinedButton(
                            //         style: OutlinedButton.styleFrom(
                            //           primary: Colors.white,
                            //           backgroundColor: Color(0xFFCEFFCD),
                            //           textStyle: TextStyle(fontSize: 14),
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius:
                            //                 BorderRadius.circular(11.0),
                            //           ),
                            //           side: BorderSide(
                            //             width: 1.0,
                            //             color: Color(0xFF83D79B),
                            //           ),
                            //         ),
                            //         // onPressed: () => addAddressSuccess(context),
                            //         onPressed: () {},
                            //         child: Container(
                            //             child: Text.rich(
                            //           TextSpan(
                            //             text: "1 order",
                            //             style: TextStyle(
                            //                 color: Color(0xFF22A876),
                            //                 fontSize: 13,
                            //                 fontWeight: FontWeight.w700,
                            //                 fontFamily: 'Kanit'),
                            //           ),
                            //           maxLines: 1,
                            //           overflow: TextOverflow.ellipsis,
                            //         )),
                            //       ),
                            //     ),
                            //     Container(
                            //       height: 40,
                            //       width: 180,
                            //       child: OutlinedButton(
                            //           style: OutlinedButton.styleFrom(
                            //             primary: Colors.white,
                            //             backgroundColor: Color(0xFFCEFFCD),
                            //             textStyle: TextStyle(fontSize: 14),
                            //             shape: RoundedRectangleBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(11.0),
                            //             ),
                            //             side: BorderSide(
                            //               width: 1.0,
                            //               color: Color(0xFF83D79B),
                            //             ),
                            //           ),
                            //           // onPressed: () => addAddressSuccess(context),
                            //           onPressed: () {},
                            //           child: Row(
                            //             children: [
                            //               Container(
                            //                   child: Text.rich(
                            //                 TextSpan(
                            //                   text: "Estimated price ",
                            //                   style: TextStyle(
                            //                       color: Color(0xFF22A876),
                            //                       fontSize: 13,
                            //                       fontWeight: FontWeight.w700,
                            //                       fontFamily: 'Kanit'),
                            //                 ),
                            //                 maxLines: 1,
                            //                 overflow: TextOverflow.ellipsis,
                            //               )),
                            //               Expanded(
                            //                 child: Container(
                            //                     child: Text.rich(
                            //                   TextSpan(
                            //                     text: "  30฿",
                            //                     style: TextStyle(
                            //                         color: Color(0xFF22A876),
                            //                         fontSize: 13,
                            //                         fontWeight: FontWeight.w800,
                            //                         fontFamily: 'Kanit'),
                            //                   ),
                            //                   maxLines: 1,
                            //                   overflow: TextOverflow.ellipsis,
                            //                 )),
                            //               ),
                            //               // Spacer(),
                            //             ],
                            //           )),
                            //     )
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 25,
                            // ),
                            GestureDetector(
                              onTap: () => informationDriver(context, ToHome, atStoreTop),
                              child: Container(
                                margin: EdgeInsets.only(top: 2),
                                child: Text(
                                  'More information',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFC98C09),
                                      fontFamily: 'Kanit'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              Positioned(
                right: 2,
                left: 0,
                top: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              viewImage(imageUrl: imageCarUrl)),
                    );
                  },
                  child: Container(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 53,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage('${imageCarUrl}'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                left: 120,
                top: 35,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => viewImage(imageUrl: imageUrl)),
                    );
                  },
                  child: Container(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage('${imageUrl}'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
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
