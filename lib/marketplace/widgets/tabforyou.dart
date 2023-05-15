import 'package:flutter/material.dart';
import 'package:we_link/marketplace/fonts/utils.dart';

import '../data/data.dart';
import '../pages/favorite.dart';
import '../pages/report.dart';
import 'header.dart';

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
        GestureDetector(
          onTap: () {
            _showModalBottomSheet(context);
          },
          child: SizedBox(
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

void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(30),
    )),
    builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.89,
        maxChildSize: 0.89,
        minChildSize: 0.89,
        expand: false,
        builder: (context, scrollController) {
          var searchlist = categorylist;
          double baseWidth = 375;
          double fem = MediaQuery.of(context).size.width / baseWidth;
          double ffem = fem * 0.97;
          return SingleChildScrollView(
            controller: scrollController,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              clipBehavior: Clip.none,
              children: [
                Headernoiconforcategory(fem: fem, ffem: fem, title: "Category"),
                Positioned(
                  top: 10,
                  child: Container(
                    width: 50,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(children: [
                  SizedBox(
                    height: 115 * fem,
                  ),
                  ListView.builder(
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
                                  padding: EdgeInsets.fromLTRB(0, 28, 0, 0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(18, 0, 18, 0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            searchlist[index]["image"],
                                            fit: BoxFit.contain,
                                            height: 30,
                                            width: 30,
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
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Kanit'),
                                              ),
                                            ],
                                          ),
                                          Expanded(child: SizedBox()),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/marketplace/images/arrowsearch.png',
                                                fit: BoxFit.contain,
                                                height: 18,
                                                width: 18,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))),
                ])
              ],
            ),
          );
        }),
  );
}
