import 'package:flutter/material.dart';
import 'package:we_link/constant/colosrConstants.dart';

class callOut extends StatelessWidget {
  const callOut({Key? key}) : super(key: key);

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
        child: Container(
          child: Column(
            children: [
              Container(
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Color(0xffFDCD03),
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
                              // onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             viewImage(imageUrl: imageUrl)),
                              //   );
                              // },
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
                margin: EdgeInsets.only(top: 27),
                child: Text(
                  'Call out',
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                margin: EdgeInsets.only(left: 60, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/unmute.png',
                        fit: BoxFit.fitHeight,
                        height: 83,
                        width: 83,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        'assets/images/mute.png',
                        fit: BoxFit.fitHeight,
                        height: 83,
                        width: 83,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Container(
                child: Image.asset(
                  'assets/images/hang_up.png',
                  fit: BoxFit.fitHeight,
                  height: 71,
                  width: 71,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
