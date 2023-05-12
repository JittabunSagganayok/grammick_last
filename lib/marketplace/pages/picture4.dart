import 'package:flutter/material.dart';

class Pic4Screen extends StatefulWidget {
  Pic4Screen({super.key, required this.imagepath});

  //String title;
  final imagepath;

  @override
  State<Pic4Screen> createState() => _Pic4ScreenState();
}

class _Pic4ScreenState extends State<Pic4Screen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
        body: Container(
      width: 812 * fem,
      color: Color(0xff1a1b1c),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
          ),
          Row(
            children: [
              SizedBox(
                width: 18,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 37 * fem,
                  height: 37 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/marketplace/images/Group 7148.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 64,
          ),
          Container(
            width: 375 * fem,
            height: 480 * fem,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.imagepath,
                  ),
                ),
              ),
            ),
          ),
          //Text(widget.imagepath),
        ],
      ),
    )
        // SingleChildScrollView(

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Container(
        //       width: fem,
        //       height: 812 * fem,
        //       color: Color(0xff1a1b1c),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             fit: BoxFit.cover,
        //             image: AssetImage(
        //               widget.imagepath,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     //Text(widget.imagepath),
        //   ],
        // ),
        // ),
        );
  }
}
