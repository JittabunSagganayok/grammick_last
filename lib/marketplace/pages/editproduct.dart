import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/home/searchComponents/searchMenu.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:we_link/marketplace/pages/favorite.dart';
import 'package:we_link/marketplace/pages/mapproduct.dart';
import 'package:we_link/marketplace/pages/marketplace.dart';
import 'package:we_link/marketplace/pages/profilemarket.dart';
import 'package:we_link/marketplace/widgets/fivemenu.dart';
import 'package:we_link/marketplace/widgets/header.dart';

import 'package:we_link/marketplace/data/data.dart';
import 'package:we_link/marketplace/widgets/imagecard.dart';

class EditProductScreen extends StatefulWidget {
  EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    bool value = true;
    //double fontfem = fem * 0.85;
    // double h1 = ((250 * (imagescardList.length) / 2) + 4) * fem;
    //double _currentSliderValue = 50;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 1061 * fem,
                  width: 375 * fem,
                  padding: EdgeInsets.fromLTRB(0, 125, 0, 0),
                  color: Colors.white,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(23, 23, 23, 0),
                          child: Image.asset(
                            'assets/marketplace/images/Group1000001280.png',
                            fit: BoxFit.contain,
                            height: 112 * fem,
                            width: 337 * fem,
                          ),
                        ),
                        SizedBox(
                          height: 5 * fem,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'You can add up to 10 photos and videos.',
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 10 * ffem,
                                      fontWeight: FontWeight.w300,
                                      height: 1.495 * ffem / fem,
                                      letterSpacing: -0.22 * fem,
                                      color: const Color(0xffa6a6a6),
                                    ),
                                  ),
                                  Text(
                                    '0/10',
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 10 * ffem,
                                      fontWeight: FontWeight.w300,
                                      height: 1.495 * ffem / fem,
                                      letterSpacing: -0.22 * fem,
                                      color: const Color(0xffa6a6a6),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20 * fem,
                              ),
                              Text(
                                'Detail',
                                style: SafeGoogleFont(
                                  'Kanit',
                                  fontSize: 13 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.495 * ffem / fem,
                                  letterSpacing: -0.22 * fem,
                                  color: const Color(0xff000000),
                                ),
                              ),
                              SizedBox(
                                height: 15 * fem,
                              ),
                              Container(
                                width: 337 * fem,
                                height: 42 * fem,
                                decoration: BoxDecoration(
                                    color: const Color(0xfffbfbfb),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Color(0xffededed),
                                    )),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 11),
                                      hintText: 'Add name product',
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(15, 0, 0, 10)),
                                ),
                              ),
                              SizedBox(
                                height: 17 * fem,
                              ),
                              Container(
                                width: 337 * fem,
                                height: 42 * fem,
                                decoration: BoxDecoration(
                                    color: const Color(0xfffbfbfb),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Color(0xffededed),
                                    )),
                                child: Stack(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 11),
                                          hintText: 'Category',
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              15, 0, 0, 15)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          307, 10, 10, 10),
                                      child: Image.asset(
                                        'assets/marketplace/images/Group 33869.png',
                                        fit: BoxFit.contain,
                                        height: 19 * fem,
                                        width: 19 * fem,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 17 * fem,
                              ),
                              Container(
                                width: 337 * fem,
                                height: 42 * fem,
                                decoration: BoxDecoration(
                                    color: const Color(0xfffbfbfb),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Color(0xffededed),
                                    )),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 11),
                                      hintText: 'Phone number',
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(15, 0, 0, 10)),
                                ),
                              ),
                              SizedBox(
                                height: 17 * fem,
                              ),
                              Text(
                                'More Detail',
                                style: SafeGoogleFont(
                                  'Kanit',
                                  fontSize: 13 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.495 * ffem / fem,
                                  letterSpacing: -0.22 * fem,
                                  color: const Color(0xff000000),
                                ),
                              ),
                              SizedBox(
                                height: 17 * fem,
                              ),
                              Container(
                                width: 337 * fem,
                                height: 120 * fem,
                                decoration: BoxDecoration(
                                    color: const Color(0xfffbfbfb),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Color(0xffededed),
                                    )),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 11),
                                      hintText: 'Add description more',
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(15, 0, 0, 10)),
                                ),
                              ),
                              SizedBox(
                                height: 25 * fem,
                              ),
                              Image.asset(
                                'assets/marketplace/images/Vector 38.png',
                                fit: BoxFit.contain,
                                //height: 10,
                                width: 375 * fem,
                              ),
                              SizedBox(
                                height: 17 * fem,
                              ),
                              Text(
                                'Add location',
                                style: SafeGoogleFont(
                                  'Kanit',
                                  fontSize: 13 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.495 * ffem / fem,
                                  letterSpacing: -0.22 * fem,
                                  color: const Color(0xff000000),
                                ),
                              ),
                              SizedBox(
                                height: 17 * fem,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MapProductScreen()),
                                  );
                                },
                                child: Image.asset(
                                  'assets/marketplace/images/Rectangle 4626.png',
                                  fit: BoxFit.contain,
                                  height: 112 * fem,
                                  width: 337 * fem,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Status for sale',
                                        style: SafeGoogleFont(
                                          'Kanit',
                                          fontSize: 13 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.495 * ffem / fem,
                                          letterSpacing: -0.22 * fem,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                      Text(
                                        'You can set the sales display or not.',
                                        style: SafeGoogleFont(
                                          'Kanit',
                                          fontSize: 13 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.495 * ffem / fem,
                                          letterSpacing: -0.22 * fem,
                                          color: const Color(0xffcfcfcf),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Transform.scale(
                                    scale: 0.7,
                                    child: CupertinoSwitch(
                                      value: value,
                                      onChanged: (value) => setState(() {}),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfilemarketScreen()),
                                );
                              },
                              child: Image.asset(
                                'assets/marketplace/images/group-7148.png',
                                width: 37 * fem,
                                height: 37 * fem,
                              ),
                            ),
                            SizedBox(
                              width: 80 * fem,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Edit product",
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 22 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.495 * ffem / fem,
                                    color: const Color(0xffffffff),
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
                      height: 961 * fem,
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
                                showDialogFunc(context);
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

showDialogFunc(context) {
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
                      "Product created successfully",
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
                              builder: (context) => EditProductScreen()),
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
