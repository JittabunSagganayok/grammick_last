import 'package:flutter/material.dart';
import 'package:we_link/marketplace/fonts/utils.dart';

class Foryou extends StatelessWidget {
  const Foryou({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 67 * fem,
          child: SizedBox(
            width: double.infinity,
            child: Container(
              // group34222MH8 (1:241)
              width: double.infinity,
              height: 27 * fem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10 * fem),
              ),
              child: Container(
                // group34221HwU (1:242)
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffceffcd),
                  borderRadius: BorderRadius.circular(10 * fem),
                ),
                child: Center(
                  child: Text(
                    'For you',
                    style: SafeGoogleFont(
                      'Kanit',
                      fontSize: 11 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.495 * ffem / fem,
                      letterSpacing: -0.22 * fem,
                      color: const Color(0xff179b57),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        SizedBox(
          width: 86 * fem,
          child: Container(
            // group342209sC (1:245)
            padding: const EdgeInsets.fromLTRB(14, 5, 12, 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xfff8f8f8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // categoryGB8 (1:248)
                  margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                  child: Text(
                    'Category',
                    style: SafeGoogleFont(
                      'Kanit',
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      height: 1.495,
                      letterSpacing: -0.22,
                      color: const Color(0xff179b57),
                    ),
                  ),
                ),
                Container(
                  // icarrowright24xZk (1:247)
                  margin: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                  width: 10 * fem,
                  height: 10 * fem,
                  child: Image.asset(
                    'assets/marketplace/images/ic-arrow-right-24.png',
                    width: 10 * fem,
                    height: 10 * fem,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 116 * fem,
          child: Container(
            // group34223aWa (1:249)
            padding: EdgeInsets.fromLTRB(0 * fem, 5 * fem, 0 * fem, 5 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xfff8f8f8),
              borderRadius: BorderRadius.circular(10 * fem),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  // iconVNe (1:251)

                  width: 10.48 * fem,
                  height: 13 * fem,
                  child: Image.asset(
                    'assets/marketplace/images/icon.png',
                    width: 10.48 * fem,
                    height: 13 * fem,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                SizedBox(
                  // bangkokQVc (1:258)

                  child: Text(
                    'Bangkok',
                    style: SafeGoogleFont(
                      'Kanit',
                      fontSize: 11 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.495 * ffem / fem,
                      letterSpacing: -0.22 * fem,
                      color: const Color(0xff737373),
                    ),
                  ),
                ),
                Text(
                  // km798 (1:259)
                  ' (30km.)',
                  style: SafeGoogleFont(
                    'Kanit',
                    fontSize: 11 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.495 * ffem / fem,
                    letterSpacing: -0.22 * fem,
                    color: const Color(0xff3d79d2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
