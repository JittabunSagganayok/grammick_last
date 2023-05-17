import 'package:flutter/material.dart';
import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:we_link/marketplace/pages/categorydetail.dart';
import 'package:we_link/marketplace/pages/favorite.dart';
import 'package:we_link/marketplace/pages/marketplace.dart';
import 'package:we_link/marketplace/pages/profilemarket.dart';
import 'package:we_link/marketplace/pages/searchmarkets.dart';
import 'package:we_link/views/home_screen.dart';

import '../../components/home/homeComponents/home_menu_section.dart';

//header for markethome (2 back icon)
class Header extends StatelessWidget {
  const Header(
      {super.key, required this.fem, required this.ffem, required this.title});

  final double fem;
  final double ffem;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 375 * fem,
          height: 121 * fem,
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // group71484ii (1:222)
                GestureDetector(
                  onTap: () {
                    //Navigator.of(context).pop();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false);
                  },
                  child: Image.asset(
                    'assets/marketplace/images/group-7148.png',
                    width: 37 * fem,
                    height: 37 * fem,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(child: SizedBox()),
                Text(
                  title,
                  style: SafeGoogleFont(
                    'Kanit',
                    fontSize: 22 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.495 * ffem / fem,
                    color: const Color(0xffffffff),
                  ),
                ),
                Expanded(child: SizedBox()),
                const SizedBox(
                  width: 65,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilemarketScreen()),
                    );
                  },
                  child: Image.asset(
                    'assets/marketplace/images/group-34224.png',
                    width: 37 * fem,
                    height: 37 * fem,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    //Modular.to.pushReplacementNamed('/fav');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavScreen()),
                    );
                  },
                  child: Image.asset(
                    'assets/marketplace/images/group-33982.png',
                    width: 37 * fem,
                    height: 37 * fem,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 95, 8, 0),
          child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: double.infinity,
              child: Container(
                // group7145ydQ (1:212)
                padding:
                    EdgeInsets.fromLTRB(6 * fem, 7 * fem, 7 * fem, 6 * fem),
                width: double.infinity,
                height: 53 * fem,
                decoration: BoxDecoration(
                  color: const Color(0xfffdcd03),
                  borderRadius: BorderRadius.circular(18 * fem),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x28000000),
                      offset: Offset(0 * fem, 0 * fem),
                      blurRadius: 4.5 * fem,
                    ),
                  ],
                ),

                child: Container(
                  // taxirowS1C (1:214)
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14 * fem),
                  ),
                  child: Center(
                    // rectangle8at6 (1:215)
                    child: SizedBox(
                      width: double.infinity,
                      height: 40 * fem,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchMScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14 * fem),
                            border: Border.all(color: const Color(0xffefeff4)),
                            color: const Color(0xffffffff),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: SizedBox(
                              // group33980VZ8 (1:225)
                              width: double.infinity,
                              height: 19 * fem,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Center(
                                    child: RichText(
                                      text: TextSpan(
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2125 * ffem / fem,
                                          letterSpacing: -0.3 * fem,
                                          color: const Color(0xff000000),
                                        ),
                                        children: [
                                          const TextSpan(
                                            text: 'l Find products ',
                                          ),
                                          TextSpan(
                                            text: 'new',
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.2125 * ffem / fem,
                                              letterSpacing: -0.3 * fem,
                                              color: const Color(0xfffdcd03),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// //header 2 (2 back icon)
// class Header2icon extends StatelessWidget {
//   const Header2icon({
//     super.key,
//     required this.fem,
//     required this.ffem,
//   });

//   final double fem;
//   final double ffem;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: 375 * fem,
//           height: 120 * fem,
//           decoration: const BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: Colors.black,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.zero,
//               topRight: Radius.zero,
//               bottomLeft: Radius.circular(30.0),
//               bottomRight: Radius.circular(30.0),
//             ),
//           ),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 63,
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // group71484ii (1:222)
//                     GestureDetector(
//                       onTap: () {
//                         Modular.to.pushNamedAndRemoveUntil(
//                             '/home', (Route<dynamic> route) => false);
//                       },
//                       child: Image.asset(
//                         'assets/marketplace/images/group-7148.png',
//                         width: 37 * fem,
//                         height: 37 * fem,
//                       ),
//                     ),
//                     Expanded(
//                       child: SizedBox(),
//                     ),
//                     // Text(
//                     //   title,
//                     //   style: SafeGoogleFont(
//                     //     'Kanit',
//                     //     fontSize: 22 * ffem,
//                     //     fontWeight: FontWeight.w600,
//                     //     height: 1.495 * ffem / fem,
//                     //     color: const Color(0xffffffff),
//                     //   ),
//                     // ),
//                     Expanded(
//                       child: SizedBox(),
//                     ),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Image.asset(
//                         'assets/marketplace/images/group-33982.png',
//                         width: 37 * fem,
//                         height: 37 * fem,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),

//                     GestureDetector(
//                       onTap: () {
//                         //showDialogFunc(context);
//                       },
//                       child: Image.asset(
//                         'assets/marketplace/images/Group 1000001275.png',
//                         width: 37 * fem,
//                         height: 37 * fem,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

//header 2 (1 back icon)
class Header1icon extends StatelessWidget {
  const Header1icon({
    super.key,
    required this.fem,
    required this.ffem,
    required this.title,
  });

  final double fem;
  final double ffem;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // group71484ii (1:222)
                    GestureDetector(
                      onTap: () {
                        // Modular.to.pushNamedAndRemoveUntil(
                        //     '/home', (Route<dynamic> route) => false);

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => MarketHomeScreen()),
                            (Route<dynamic> route) => false);
                      },
                      child: Image.asset(
                        'assets/marketplace/images/group-7148.png',
                        width: 37 * fem,
                        height: 37 * fem,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      title,
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 22 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.495 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/marketplace/images/group-34224.png',
                        width: 37 * fem,
                        height: 37 * fem,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Headernoicon extends StatelessWidget {
  const Headernoicon({
    super.key,
    required this.fem,
    required this.ffem,
    required this.title,
  });

  final double fem;
  final double ffem;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      children: [
                        Text(
                          title,
                          style: SafeGoogleFont(
                            'Kanit',
                            fontSize: 22 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.495 * ffem / fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        SizedBox(
                          width: 37,
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Image.asset(
                    //     'assets/marketplace/images/group-34224.png',
                    //     width: wh1 * fem,
                    //     height: wh1 * fem,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Headernoiconforcategory extends StatelessWidget {
  const Headernoiconforcategory({
    super.key,
    required this.fem,
    required this.ffem,
    required this.title,
  });

  final double fem;
  final double ffem;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 375 * fem,
          height: 120 * fem,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // group71484ii (1:222)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        'assets/marketplace/images/downarrow.png',
                        width: 37 * fem,
                        height: 37 * fem,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      children: [
                        Text(
                          title,
                          style: SafeGoogleFont(
                            'Kanit',
                            fontSize: 22 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.495 * ffem / fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        SizedBox(
                          width: 37,
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
