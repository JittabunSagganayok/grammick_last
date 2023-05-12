//imagepath title price
import 'package:flutter/material.dart';

import 'package:we_link/marketplace/data/data.dart';
import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:we_link/marketplace/widgets/header.dart';
import 'package:we_link/marketplace/widgets/imagecard.dart';

import 'detail.dart';

class InformationScreen extends StatefulWidget {
  InformationScreen({super.key, required this.imageDataxinfo});

  final imageDataxinfo;

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double h1 = ((250 * (imagescardList.length) / 2) + 4) * fem;
    // var imagetitle = widget.imageDatax['title'];
    // var imageprice = widget.imageDatax['price'];
    var sellername = widget.imageDataxinfo['sellername'];
    var sellerphone = widget.imageDataxinfo['sellerphone'];
    var sellerprovince = widget.imageDataxinfo['sellerprovince'];
    var sellerlocation = widget.imageDataxinfo['sellerlocation'];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Headernoicon(fem: fem, ffem: ffem, title: "Information"),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 46 * fem,
                          height: 46 * fem,
                          child: Image.asset(
                            'assets/marketplace/images/Ellipse 643.png',
                            width: 46 * fem,
                            height: 46 * fem,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sellername,
                              style: SafeGoogleFont(
                                'Kanit',
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff1B1D28),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              sellerprovince,
                              style: SafeGoogleFont(
                                'Kanit',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.495,
                                color: const Color(0xff76777E),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Image.asset(
                      "assets/marketplace/images/Vector-1137.png",
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialogFuncMap(context);
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                            // iconVNe (1:251)

                            width: 335 * fem,
                            height: 125 * fem,
                            child: Image.asset(
                              'assets/marketplace/images/Rectangle 4477.png',
                              width: 335 * fem,
                              height: 125 * fem,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Image.asset(
                            'assets/marketplace/images/Group-7141.png',
                            width: 338 * fem,
                            height: 74 * fem,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/marketplace/images/icon2.png',
                            width: 18 * fem,
                            height: 18 * fem,
                          ),
                          SizedBox(
                            width: 10 * ffem,
                          ),
                          Container(
                            width: 225 * fem,
                            child: Text(
                              sellerlocation,
                              style: SafeGoogleFont(
                                'Kanit',
                                fontSize: 12 * fem,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.3000000119 * fem,
                                color: const Color(0xff4D4D4D),
                              ),
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            '30 km',
                            style: SafeGoogleFont(
                              'Kanit',
                              fontSize: 12 * fem,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.3000000119 * fem,
                              color: const Color(0xff2B2B2B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/marketplace/images/Vector-1137.png",
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/marketplace/images/Vector.png',
                                  width: 18 * fem,
                                  height: 18 * fem,
                                ),
                                SizedBox(
                                  width: 10 * ffem,
                                ),
                                Container(
                                  width: 225 * fem,
                                  child: Text(
                                    'Phone',
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: -0.3000000119 * fem,
                                      color: const Color(0xff4D4D4D),
                                    ),
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                GestureDetector(
                                  onTap: () {
                                    showDialogFuncCallout(context);
                                  },
                                  child: Text(
                                    sellerphone,
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.3000000119 * fem,
                                      color: const Color(0xffFF855E),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "assets/marketplace/images/Vector-1137.png",
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            children: [
                              Text(
                                "Products",
                                style: SafeGoogleFont(
                                  'Kanit',
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.3000000119 * fem,
                                  color: const Color(0xff2B2B2B),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h1,
                      child: Imagecardgen(),
                    ),
                    Center(
                      child: SizedBox(
                        height: 50.0,
                        child: Image.asset(
                          "assets/marketplace/images/59bf3901102a67d318412a84662ce5d2ad770a3a.gif",
                          fit: BoxFit.cover,
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showDialogFunc(context, imageDatax) {
  double baseWidth = 375;
  double fem = MediaQuery.of(context).size.width / baseWidth;
  double ffem = fem * 0.97;
  return showDialog(
    context: context,
    builder: (context) {
      return Column(
        children: [
          Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff232323),
                  ),
                  padding: EdgeInsets.all(0),
                  height: 47 * fem,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Report this post",
                        style: SafeGoogleFont(
                          'Kanit',
                          fontSize: 14 * fem,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10 * ffem,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff232323),
                  ),
                  padding: EdgeInsets.all(0),
                  height: 47 * fem,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Cancel",
                        style: SafeGoogleFont(
                          'Kanit',
                          fontSize: 14 * fem,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      );
    },
  );
}

showDialogFuncMap(context) {
  double baseWidth = 375;
  double fem = MediaQuery.of(context).size.width / baseWidth;
  double ffem = fem * 0.97;
  return showDialog(
    context: context,
    builder: (context) {
      return Column(
        children: [
          Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffff855e),
                  ),
                  padding: EdgeInsets.all(0),
                  height: 47 * fem,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Open on Google Maps",
                        style: SafeGoogleFont(
                          'Kanit',
                          fontSize: 14 * fem,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10 * ffem,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff232323),
                  ),
                  padding: EdgeInsets.all(0),
                  height: 47 * fem,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Cancel",
                        style: SafeGoogleFont(
                          'Kanit',
                          fontSize: 14 * fem,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      );
    },
  );
}

c(context) {
  double baseWidth = 375;
  double fem = MediaQuery.of(context).size.width / baseWidth;
  double ffem = fem * 0.97;
  return showDialog(
    context: context,
    builder: (context) {
      return Column(
        children: [
          Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff232323),
                  ),
                  padding: EdgeInsets.all(0),
                  height: 47 * fem,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Call. 089-912-2933",
                        style: SafeGoogleFont(
                          'Kanit',
                          fontSize: 14 * fem,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10 * ffem,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff232323),
                  ),
                  padding: EdgeInsets.all(0),
                  height: 47 * fem,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Cancel",
                        style: SafeGoogleFont(
                          'Kanit',
                          fontSize: 14 * fem,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      );
    },
  );
}
