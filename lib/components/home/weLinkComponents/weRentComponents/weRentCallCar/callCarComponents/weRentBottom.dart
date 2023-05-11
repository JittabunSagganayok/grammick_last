import 'package:flutter/material.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/callScreen.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/viewImage.dart';
import 'package:we_link/components/home/weLinkComponents/weRentComponents/weRentCallCar/callCarComponents/weRentInformation.dart';
import 'package:we_link/components/message/chat.dart';
import 'package:we_link/constant/stylesConstants.dart';

class weRentBottom extends StatelessWidget {
  const weRentBottom({Key? key, this.WeRentRideBegan, this.WeRentArrival}) : super(key: key);
  final String? WeRentRideBegan;
  final String? WeRentArrival;

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
                               "We Rent",
                                style: typeTText,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Text( WeRentRideBegan == 'WeRentRideBegan' ? 'The Ride Began' : 'Arrivin in 4 min',
                                style: bottomTitleText,
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
                            GestureDetector(
                              onTap: () =>
                                  weRentInformation(context, WeRentArrival, WeRentRideBegan),
                              child: Container(
                                margin: EdgeInsets.only(top: 2, bottom: 40),
                                child: Text(
                                  'More information',
                                  style: bottomInForText,
                                ),
                              ),
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
