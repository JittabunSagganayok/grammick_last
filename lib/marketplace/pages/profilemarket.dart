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

class ProfilemarketScreen extends StatefulWidget {
  ProfilemarketScreen({super.key});

  @override
  State<ProfilemarketScreen> createState() => _ProfilemarketScreenState();
}

class _ProfilemarketScreenState extends State<ProfilemarketScreen> {
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
                // Container(
                //   height: 772 * fem,
                //   width: 375 * fem,
                //   padding: EdgeInsets.fromLTRB(0, 125, 0, 0),
                //   color: Colors.white,
                //   child: Container(
                //     width: double.infinity,
                //     height: double.infinity,
                //     child: Column(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.all(23.0),
                //           child: Fivemenu(),
                //         ),
                //         SizedBox(
                //           height: 7,
                //         ),
                //         Image.asset(
                //           'assets/marketplace/images/Vector 38.png',
                //           fit: BoxFit.contain,
                //           //height: 10,
                //           width: 375 * fem,
                //         ),
                //         Row(
                //           children: [
                //             Padding(
                //               padding:
                //                   const EdgeInsets.fromLTRB(23, 16, 23, 16),
                //               child: Text(
                //                 'Prices',
                //                 style: SafeGoogleFont(
                //                   'Kanit',
                //                   fontSize: 15 * ffem,
                //                   fontWeight: FontWeight.w500,
                //                   height: 1.495 * ffem / fem,
                //                   letterSpacing: -0.22 * fem,
                //                   color: const Color(0xff000000),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.fromLTRB(23, 0, 23, 23),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Container(
                //                 width: 140,
                //                 height: 35,
                //                 decoration: BoxDecoration(
                //                   color: const Color(0xfff1f1f1),
                //                   borderRadius: BorderRadius.circular(5),
                //                 ),
                //                 child: TextField(
                //                   decoration: InputDecoration(
                //                       hintStyle: TextStyle(fontSize: 11),
                //                       hintText: 'Lower price',
                //                       border: InputBorder.none,
                //                       contentPadding:
                //                           EdgeInsets.fromLTRB(40, 15, 0, 15)),
                //                 ),
                //               ),
                //               Expanded(
                //                 child: SizedBox(),
                //               ),
                //               Text(
                //                 "to",
                //                 style: SafeGoogleFont(
                //                   'Kanit',
                //                   fontSize: 13,
                //                   fontWeight: FontWeight.w500,
                //                   height: 1.495 * ffem / fem,
                //                   letterSpacing: -0.22 * fem,
                //                   color: const Color(0xff767676),
                //                 ),
                //               ),
                //               Expanded(child: SizedBox()),
                //               Container(
                //                 width: 140,
                //                 height: 35,
                //                 decoration: BoxDecoration(
                //                   color: const Color(0xfff1f1f1),
                //                   borderRadius: BorderRadius.circular(5),
                //                 ),
                //                 child: TextField(
                //                   decoration: InputDecoration(
                //                       hintStyle: TextStyle(fontSize: 11),
                //                       hintText: 'Hightest price',
                //                       border: InputBorder.none,
                //                       contentPadding:
                //                           EdgeInsets.fromLTRB(35, 15, 0, 15)),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         Image.asset(
                //           'assets/marketplace/images/Vector 38.png',
                //           fit: BoxFit.contain,
                //           //height: 10,
                //           width: 375 * fem,
                //         ),
                //         Expanded(
                //             child: Container(
                //           color: Colors.white,
                //         )),
                //       ],
                //     ),
                //   ),
                // ),
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
                                GestureDetector(
                                  onTap: () {
                                    //showDialogFunc(context);
                                    Navigator.of(context).push(PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder:
                                            (BuildContext context, _, __) =>
                                                RedeemConfirmationScreen()));
                                  },
                                  child: Image.asset(
                                    'assets/marketplace/images/Group 33982.png',
                                    width: 37 * fem,
                                    height: 37 * fem,
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
              ],
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 16, 20, 0),
                child: Column(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Container(
                            //alignment: Alignment.topLeft,
                            //margin: EdgeInsets.only(top: 0, bottom: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "My Sale",
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 12 * fem,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Kanit'),
                                ),
                                Text(
                                  "Clear All",
                                  style: TextStyle(
                                      color: Color(0xFF172BB5),
                                      fontSize: 12 * fem,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Kanit'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: searchlist.length,
                        itemBuilder: ((context, index) => Container(
                              width: double.infinity,
                              // height: 500,
                              child: Dismissible(
                                key: ValueKey(searchlist[index]),
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                    'assets/marketplace/images/delete.png',
                                    fit: BoxFit.contain,
                                    height: 36,
                                    width: 61,
                                  ),
                                ),
                                child: Container(
                                  // height: 100,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           SearchResultScreen(
                                        //               search: searchlist[index]
                                        //                   ["title"])),
                                        // );
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/marketplace/images/iconsearch.png',
                                            fit: BoxFit.contain,
                                            height: 18,
                                            width: 18,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                searchlist[index]["title"],
                                                style: TextStyle(
                                                    color: Color(0xFF212B32),
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Kanit'),
                                              ),
                                              Text(
                                                searchlist[index]["subtitle"],
                                                style: TextStyle(
                                                    color: Color(0xFF979797),
                                                    fontSize: 13 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Kanit'),
                                              ),
                                            ],
                                          ),
                                          Expanded(child: SizedBox()),
                                          Image.asset(
                                            'assets/marketplace/images/arrowsearch.png',
                                            fit: BoxFit.contain,
                                            height: 18,
                                            width: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RedeemConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double fontfem = fem * 0.85;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white.withOpacity(0),
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
                                      hintText: 'Search',
                                      //widget.search
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintStyle: hintTextStyle,
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
                                          padding: const EdgeInsets.all(10.0),
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
        ],
      ), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
    );
  }
}
