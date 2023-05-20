import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/home/searchComponents/searchMenu.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:we_link/marketplace/pages/favorite.dart';
import 'package:we_link/marketplace/pages/marketplace.dart';
import 'package:we_link/marketplace/widgets/header.dart';

import 'package:we_link/marketplace/data/data.dart';
import 'package:we_link/marketplace/widgets/imagecard.dart';

class MapProductScreen extends StatefulWidget {
  MapProductScreen({super.key});

  @override
  State<MapProductScreen> createState() => _MapProductScreenState();
}

class _MapProductScreenState extends State<MapProductScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double fontfem = fem * 0.85;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 128, 0, 0),
                  color: Colors.white,
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/marketplace/images/Group 1000001281.png',
                          width: 375 * fem,
                          height: 547 * fem,
                          fit: BoxFit.fill,
                        ),
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
                              width: 15,
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7 *
                                          fem,
                                      height: 43,
                                      child: TextFormField(
                                        autofocus: true,
                                        // controller: pickUpAtController,
                                        // onFieldSubmitted: (text) {
                                        //   viewModel.searchAddress(text);
                                        // },
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            hintText:
                                                "Bangkapi , 10240 , Bangkok",
                                            //widget.search
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Kanit'),
                                            contentPadding: fieldPadding,
                                            enabledBorder: searchBoder,
                                            focusedBorder: searchBoder,
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(0.0),
                                              child: Icon(
                                                Icons.search,
                                                color: Color(0xFF303030),
                                              ),
                                            ),
                                            suffixIcon: GestureDetector(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                  'assets/images/close.png',
                                                  fit: BoxFit.contain,
                                                  height: 10,
                                                  width: 10,
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                            )),
                                      ))
                                ],
                              ),
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
                      color: Colors.white,
                      width: 375 * fem,
                      height: 110 * fem,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   'Radius in custom area',
                            //   style: SafeGoogleFont(
                            //     'Kanit',
                            //     fontSize: 14 * ffem,
                            //     fontWeight: FontWeight.w500,
                            //     height: 1.495 * ffem / fem,
                            //     letterSpacing: -0.22 * fem,
                            //     color: const Color(0xff212B32),
                            //   ),
                            // ),
                            // Text(
                            //   'Show me only items within a certain distance.',
                            //   style: SafeGoogleFont(
                            //     'Kanit',
                            //     fontSize: 14 * ffem,
                            //     fontWeight: FontWeight.w400,
                            //     height: 1.495 * ffem / fem,
                            //     letterSpacing: -0.22 * fem,
                            //     color: const Color(0xff606060),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 15,
                            // ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: Slider(
                            //         value: _currentSliderValue,
                            //         max: 100,
                            //         divisions: 100,
                            //         label:
                            //             _currentSliderValue.round().toString(),
                            //         onChanged: (double value) {
                            //           setState(() {
                            //             _currentSliderValue = value;
                            //           });
                            //         },
                            //       ),
                            //     ),
                            //     //Expanded(child: SizedBox()),
                            //     Text(
                            //       "6 km.",
                            //       style: SafeGoogleFont(
                            //         'Kanit',
                            //         fontSize: 11,
                            //         fontWeight: FontWeight.w400,
                            //         color: const Color(0xff606060),
                            //       ),
                            //     )
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 15,
                            // ),
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
