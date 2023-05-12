import 'package:flutter/material.dart';

import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:we_link/marketplace/pages/detail.dart';

import 'package:we_link/marketplace/widgets/header.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({super.key, required this.imageDatax});
  var imageDatax;
  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Headernoicon(fem: fem, ffem: ffem, title: "Report"),
            SizedBox(
              height: 12,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Add Description to Report',
                        style: SafeGoogleFont(
                          'Kanit',
                          fontSize: 13 * ffem,
                          fontWeight: FontWeight.w300,
                          height: 1.3125 * ffem / fem,
                          letterSpacing: 0.16 * fem,
                          color: Color(0xff010d29),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 60.0),
                        border: OutlineInputBorder(),
                        //hintText: 'Enter a search term',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Material(
                        type: MaterialType.transparency,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xfff3f3f3),
                          ),
                          padding: EdgeInsets.all(0),
                          height: 32 * fem,
                          width: 166 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "This product is not suitable",
                                style: SafeGoogleFont(
                                  'Kanit',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialogFunc(context, widget.imageDatax);
                    },
                    child: Center(
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffFDCD03),
                          ),
                          padding: EdgeInsets.all(0),
                          height: 45 * fem,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Confirm",
                                style: SafeGoogleFont(
                                  'Kanit',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 360,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showDialogFunc(context, imageDatax) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: GestureDetector(
          onTap: () {
            // Navigator.pop(context, true);
            //Modular.to.pushReplacementNamed('/report');
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => ReportScreen(
            //             imageDatax: imageDatax,
            //           )),
            // );
          },
          child: Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                height: 277,
                width: 269,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/marketplace/images/image 7.png',
                      width: 64,
                      height: 64,
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Success Report",
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2f2f2f),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your report is complete.",
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: const Color(0xff2f2f2f),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Modular.to.pushNamed(
                        //   '/detail',
                        //   arguments: imageDatax,
                        // );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    imageDatax: imageDatax,
                                  )),
                        );
                        // Navigator.pop(context, true);
                        // Navigator.pop(context, true);
                      },
                      child: Center(
                        child: Material(
                          type: MaterialType.transparency,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xffFDCD03),
                            ),
                            padding: EdgeInsets.all(0),
                            height: 48,
                            width: 197,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Done",
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
