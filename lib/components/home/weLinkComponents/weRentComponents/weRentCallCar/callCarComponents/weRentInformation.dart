import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/callScreen.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/viewImage.dart';
import 'package:we_link/components/home/weLinkToGo.dart';
import 'package:we_link/components/message/chat.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

void weRentInformation(BuildContext context, WeRentArrival, WeRentRideBegan) {
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
          margin: EdgeInsets.only(left: 15, right: 15, top: 120),
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
                      child: Column(
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
                                            backgroundColor: Color(0xFF57B861),
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
                                            //           chatDiver: 'chatDiver')),
                                            // );
                                          },
                                          child: CircleAvatar(
                                            radius: 27,
                                            backgroundColor: Color(0xFFFDB824),
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
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Arrivin in 4 min',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Gray Vesta | 01E216RA ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(bottom: 15, top: 20),
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
                                                  margin:
                                                      EdgeInsets.only(left: 9),
                                                  padding: EdgeInsets.fromLTRB(
                                                      9, 6, 9, 6),
                                                  decoration: typeButton,
                                                  child: Text(
                                                    "We Ride",
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
                                      margin:
                                          EdgeInsets.only(top: 15, bottom: 15),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontFamily: 'Kanit'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Divider(
                                      color: Color(0xFFE6E6E6),
                                      thickness: 1,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.only(bottom: 15, top: 15),
                                      child: Text(
                                        'Destination',
                                        style: inforTitleText,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 18),
                                      child: Row(
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
                                                  left: 25, right: 5),
                                              child: Text.rich(
                                                TextSpan(
                                                    text: "Home , ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'Kanit'),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "Keas 69 Str.15234",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'Kanit')),
                                                    ]),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Color(0xFFE6E6E6),
                                      thickness: 1,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(bottom: 10, top: 18),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Your Package :',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF564FF0),
                                                  fontFamily: 'Kanit'),
                                            ),
                                          ),
                                          Text(
                                            'Regular',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black,
                                                fontFamily: 'Kanit'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(bottom: 15, top: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Total Hours :',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF564FF0),
                                                  fontFamily: 'Kanit'),
                                            ),
                                          ),
                                          Text(
                                            '3 Hr',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black,
                                                fontFamily: 'Kanit'),
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
                                      margin:
                                          EdgeInsets.only(bottom: 15, top: 15),
                                      child: Text(
                                        'Which place you plan to go to ?',
                                        style: inforTitleText,
                                      ),
                                    ),
                                    Container(
                                        height: 50,
                                        child: TextFormField(
                                          autofocus: false,
                                          // focusNode: focusSearch,
                                          controller: TextEditingController()
                                            ..text = 'Nagoya, mississippi',
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            // hintText: 'Write request',
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintStyle: hintTextStyle,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 14.0),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15.0)),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFEDEDED),
                                                )),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15.0)),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFEDEDED),
                                                )),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Divider(
                                      color: Color(0xFFE6E6E6),
                                      thickness: 1,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.only(bottom: 15, top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Summary',
                                            style: inforTitleText,
                                          ),
                                          Text(
                                            'Total',
                                            style: inforTitleText,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(bottom: 10, top: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
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
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 9, 10, 9),
                                                    decoration: typeButton,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
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
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style:
                                                                sumButtonText,
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
                                              '900 ฿',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Kanit'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          // Divider(
                          //   color: Color(0xFFE6E6E6),
                          //   thickness: 1,
                          // ),
                          // SizedBox(height: 20),
                          if (WeRentArrival != 'WeRentArrival' &&
                              WeRentRideBegan != 'WeRentRideBegan') ...[
                            Divider(
                              color: Color(0xFFE6E6E6),
                              thickness: 1,
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () async {
                                navigator?.pop();
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WeLinkToGoScreen(valueSelectedIndex: 2)),
                                );
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                            ),
                          ],
                          SizedBox(
                            height: 35,
                          ),
                        ],
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
              //           radius: 25,
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
