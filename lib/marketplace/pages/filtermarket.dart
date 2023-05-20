import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/home/searchComponents/searchMenu.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:we_link/marketplace/pages/favorite.dart';
import 'package:we_link/marketplace/pages/marketplace.dart';
import 'package:we_link/marketplace/widgets/fivemenu.dart';
import 'package:we_link/marketplace/widgets/header.dart';

import 'package:we_link/marketplace/data/data.dart';
import 'package:we_link/marketplace/widgets/imagecard.dart';

class FiltermarketScreen extends StatefulWidget {
  FiltermarketScreen({super.key});

  @override
  State<FiltermarketScreen> createState() => _FiltermarketScreenState();
}

class _FiltermarketScreenState extends State<FiltermarketScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double fontfem = fem * 0.85;
    double h1 = ((250 * (imagescardList.length) / 2) + 4) * fem;
    double _currentSliderValue = 50;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 772 * fem,
                  width: 375 * fem,
                  padding: EdgeInsets.fromLTRB(0, 125, 0, 0),
                  color: Colors.white,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(23.0),
                          child: Fivemenu(),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Image.asset(
                          'assets/marketplace/images/Vector 38.png',
                          fit: BoxFit.contain,
                          //height: 10,
                          width: 375 * fem,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(23, 16, 23, 16),
                              child: Text(
                                'Prices',
                                style: SafeGoogleFont(
                                  'Kanit',
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.495 * ffem / fem,
                                  letterSpacing: -0.22 * fem,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(23, 0, 23, 23),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 140,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: const Color(0xfff1f1f1),
                                  borderRadius: BorderRadius.circular(5),
                                  // border:
                                  //     Border.all(color: Colors.blueAccent)]
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 11),
                                      hintText: 'Lower price',
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(40, 15, 0, 15)),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Text(
                                "to",
                                style: SafeGoogleFont(
                                  'Kanit',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  height: 1.495 * ffem / fem,
                                  letterSpacing: -0.22 * fem,
                                  color: const Color(0xff767676),
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Container(
                                width: 140,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: const Color(0xfff1f1f1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 11),
                                      hintText: 'Hightest price',
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(35, 15, 0, 15)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/marketplace/images/Vector 38.png',
                          fit: BoxFit.contain,
                          //height: 10,
                          width: 375 * fem,
                        ),
                        Expanded(
                            child: Container(
                          color: Colors.white,
                        )),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 375 * fem,
                  height: 120 * fem,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 63,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // group71484ii (1:222)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Image.asset(
                                'assets/marketplace/images/group-7148.png',
                                width: 37 * fem,
                                height: 37 * fem,
                              ),
                            ),
                            SizedBox(
                              width: 107,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Filter",
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 22 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.495 * ffem / fem,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                                SizedBox(
                                  width: 107,
                                ),
                                Text(
                                  "Clear",
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.495 * ffem / fem,
                                    color: const Color(0xffc6c6c6),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 685 * fem,
                    ),
                    Container(
                      //color: Colors.white,
                      width: 375 * fem,
                      height: 120 * fem,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.only(
                        // topLeft: Radius.circular(10),
                        // topRight: Radius.circular(10),
                        // bottomLeft: Radius.circular(10),
                        // bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(
                              0,
                              0,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
