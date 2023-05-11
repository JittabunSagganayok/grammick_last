import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/viewImage.dart';
import 'package:we_link/constant/colosrConstants.dart';

class callScreen extends StatelessWidget {
  const callScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageUrl =
        'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60';
    return Scaffold(
      backgroundColor: Color(0xFF1A1B1C),
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: const Color(0xffFDCD03),
      //   leading: Container(
      //     margin: EdgeInsets.only(
      //       left: 3,
      //     ),
      //     child: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: Image.asset('assets/images/goBack.png'),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              elevation: 0.0,
              backgroundColor: const Color(0xffFDCD03),
              leading: Container(
                margin: EdgeInsets.only(
                  left: 3,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('assets/images/goBack.png'),
                ),
              ),
            ),
            Container(
              height: 235,
              child: Stack(
                children: [
                  ClipPath(
                    child: Container(
                      // margin: EdgeInsets.only(bottom: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      color: yellowColor,
                    ),
                    clipper: CustomClipPath(),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        viewImage(imageUrl: imageUrl)),
                              );
                            },
                            child: CircleAvatar(
                                radius: 85,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        NetworkImage('${imageUrl}'))),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Incoming call',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Lesster Lopez',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 48),
                        child: Image.asset(
                          'assets/images/not_accept.png',
                          fit: BoxFit.fill,
                          height: 71,
                          width: 71,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 48),
                        child: Image.asset(
                          'assets/images/accept.png',
                          fit: BoxFit.fill,
                          height: 71,
                          width: 71,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// CustomPainter class to for the header curved-container
class CustomClipPath extends CustomClipper<Path> {
  var radius = 50.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
