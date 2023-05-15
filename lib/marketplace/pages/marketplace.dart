import 'package:flutter/material.dart';
import 'package:we_link/marketplace/data/data.dart';

import 'package:we_link/marketplace/widgets/fivemenu.dart';
import 'package:we_link/marketplace/widgets/header.dart';
import 'package:we_link/marketplace/widgets/hotdeal.dart';
import 'package:we_link/marketplace/widgets/imagecard.dart';
import 'package:we_link/marketplace/widgets/recommend.dart';
import 'package:we_link/marketplace/widgets/slidepic.dart';
import 'package:we_link/marketplace/widgets/tabforyou.dart';

class MarketHomeScreen extends StatefulWidget {
  const MarketHomeScreen({super.key});

  @override
  State<MarketHomeScreen> createState() => _MarketHomeScreenState();
}

class _MarketHomeScreenState extends State<MarketHomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double h1 = ((250 * (imagescardList.length) / 2) + 4) * fem;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              fem: fem,
              ffem: ffem,
              title: "Marketplace",
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(22.0, 18, 22, 0),
                  child: SliderScreen(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 16, 20, 0),
                    child: Column(
                      children: [
                        Foryou(fem: fem, ffem: ffem),
                        const SizedBox(
                          height: 20,
                        ),
                        const Fivemenu(),
                        const SizedBox(
                          height: 28,
                        ),
                        RecommendReadmore(ffem: ffem, fem: fem),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: h1,
                          child: Imagecardgen(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Hotdeals(ffem: ffem, fem: fem),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22.0, 20, 22, 0),
                      child: Column(
                        children: [
                          RecommendReadmore(ffem: ffem, fem: fem),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: h1,
                            child: Imagecardgen(),
                          ),
                        ],
                      ),
                      //
                    ),
                    SizedBox(
                      height: 50.0,
                      child: Image.asset(
                        "assets/marketplace/images/59bf3901102a67d318412a84662ce5d2ad770a3a.gif",
                        fit: BoxFit.cover,
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: const Color(0xff189B58),
        child: Image.asset(
          'assets/marketplace/images/Group-34217.png',
          width: 46.49 * fem,
          height: 46.49 * fem,
        ),
      ),
    );
  }
}

/***************************************************************************************************************************/

//เมื่อกด controller == true
//ทำ widget เป็น function if(controller==true) {return widget1 } else return widget2 อย่าลืม setstate