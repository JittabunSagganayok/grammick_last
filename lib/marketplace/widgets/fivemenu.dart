import 'package:flutter/material.dart';

import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:we_link/marketplace/pages/categorydetail.dart';

class Fivemenu extends StatelessWidget {
  const Fivemenu({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        // group7208uv6 (1:295)
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group7203esg (1:312)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 26.8 * fem, 0 * fem),
              height: 71 * fem,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryDetailScreen()),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroup4wqzyux (Q1dPV2BMhXfs7BuraE4wQz)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 9.8 * fem),
                      width: 44.2 * fem,
                      height: 44.2 * fem,
                      child: Image.asset(
                        'assets/marketplace/images/auto-group-4wqz.png',
                        width: 44.2 * fem,
                        height: 44.2 * fem,
                      ),
                    ),
                    Container(
                      // foodietX8 (1:313)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0.5 * fem, 0 * fem),
                      child: Text(
                        'Foodie',
                        style: SafeGoogleFont(
                          'Kanit',
                          fontSize: 11 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.495 * ffem / fem,
                          color: const Color(0xff494949),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // group33878auk (1:302)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 27.3 * fem, 0 * fem),
              height: 71 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupfujcK6e (Q1dPCwoovxw7bWUPQDFujC)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 9.8 * fem),
                    width: 44.2 * fem,
                    height: 44.2 * fem,
                    child: Image.asset(
                      'assets/marketplace/images/auto-group-fujc.png',
                      width: 44.2 * fem,
                      height: 44.2 * fem,
                    ),
                  ),
                  Container(
                    // assetsq4z (1:303)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 0 * fem),
                    child: Text(
                      'Assets',
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 11 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.495 * ffem / fem,
                        color: const Color(0xff494949),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group7200MJE (1:297)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 24.5 * fem, 0 * fem),
              height: 71 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupqrp2t3G (Q1dP1nTjuUVe6BofhJQRp2)
                    margin: EdgeInsets.fromLTRB(
                        0.5 * fem, 0 * fem, 0 * fem, 9.8 * fem),
                    width: 44.2 * fem,
                    height: 44.2 * fem,
                    child: Image.asset(
                      'assets/marketplace/images/auto-group-qrp2.png',
                      width: 44.2 * fem,
                      height: 44.2 * fem,
                    ),
                  ),
                  Text(
                    // furnitureCZk (1:298)
                    'Furniture',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Kanit',
                      fontSize: 11 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.495 * ffem / fem,
                      color: const Color(0xff494949),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group7202Lfx (1:307)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 26.8 * fem, 0 * fem),
              height: 71 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupzrsegE2 (Q1dPMC552PqhLP4Bo5ZRSe)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 9.8 * fem),
                    width: 44.2 * fem,
                    height: 44.2 * fem,
                    child: Image.asset(
                      'assets/marketplace/images/auto-group-zrse.png',
                      width: 44.2 * fem,
                      height: 44.2 * fem,
                    ),
                  ),
                  Container(
                    // verhiclezVc (1:308)
                    margin: EdgeInsets.fromLTRB(
                        1.6 * fem, 0 * fem, 0 * fem, 0 * fem),
                    child: Text(
                      'Verhicle',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 11 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.495 * ffem / fem,
                        color: const Color(0xff494949),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group7202Lfx (1:307)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
              height: 71 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupzrsegE2 (Q1dPMC552PqhLP4Bo5ZRSe)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 9.8 * fem),
                    width: 44.2 * fem,
                    height: 44.2 * fem,
                    child: Image.asset(
                      'assets/marketplace/images/auto-group-ntee.png',
                      width: 44.2 * fem,
                      height: 44.2 * fem,
                    ),
                  ),
                  Container(
                    // verhiclezVc (1:308)
                    margin: EdgeInsets.fromLTRB(
                        1.6 * fem, 0 * fem, 0 * fem, 0 * fem),
                    child: Text(
                      'อื่นๆ',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 11 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.495 * ffem / fem,
                        color: const Color(0xff494949),
                      ),
                    ),
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
