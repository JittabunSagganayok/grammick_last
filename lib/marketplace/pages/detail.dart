//imagepath title price
import 'package:flutter/material.dart';

import 'package:we_link/marketplace/data/data.dart';
import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:we_link/marketplace/pages/information.dart';
import 'package:we_link/marketplace/pages/marketplace.dart';
import 'package:we_link/marketplace/pages/report.dart';
import 'package:we_link/marketplace/widgets/imagecard.dart';
import 'package:we_link/marketplace/widgets/slidepic.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.imageDatax});

  final imageDatax;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var imagedatas;

  @override
  void initState() {
    // TODO: implement initState
    setdatafordetail();
  }

  void setdatafordetail() {
    setState(() {
      switch (widget.imageDatax['title']) {
        case "Awesome Custom RED":
          imagedatas = imagesliderListdetail1;
          break;
        case "Wintage Couple Gucci":
          imagedatas = imagesliderListdetail2;
          break;
        case "Skin Care iSuuse zu":
          imagedatas = imagesliderListdetail3;
          break;
        case "Pronotto tote bag":
          imagedatas = imagesliderListdetail4;
          break;
        case "Red Neymar License":
          imagedatas = imagesliderListdetail5;
          break;
        case "Puma King Custom RED...":
          imagedatas = imagesliderListdetail6;
          break;
        default:
          imagedatas = imagesliderListdetail1;
      }

      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    var imageDataxinfo = widget.imageDatax;
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double h1 = ((250 * (imagescardList.length) / 2) + 4) * fem;
    var imagetitle = widget.imageDatax['title'];
    var imageprice = widget.imageDatax['price'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      Container(
                        height: 314 * fem,
                        width: 375 * fem,
                        child: SliderScreendetail(
                          imagedata: imagedatas,
                        ),
                      ),
                    ],
                  ),
                  Stack(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // group71484ii (1:222)
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MarketHomeScreen()),
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

                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/marketplace/images/group-33982.png',
                                      width: 37 * fem,
                                      height: 37 * fem,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      showDialogFunc(
                                          context, widget.imageDatax);
                                    },
                                    child: Image.asset(
                                      'assets/marketplace/images/Group 1000001275.png',
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
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      imagetitle,
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.495,
                        color: const Color(0xff000000),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      imageprice,
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        height: 1.495,
                        color: const Color(0xfff9774e),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Image.asset(
                      "assets/marketplace/images/Vector-1137.png",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Seller information",
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        height: 1.495,
                        color: const Color(0xff4D4D4D),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 332 * fem,
                      child: Container(
                        // group34223aWa (1:249)
                        padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffF7F7F7),
                          //color: Colors.amber,
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              // iconVNe (1:251)

                              width: 35 * fem,
                              height: 35 * fem,
                              child: Image.asset(
                                'assets/marketplace/images/Ellipse 59.png',
                                width: 35 * fem,
                                height: 35 * fem,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hali Parker",
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    height: 1.495,
                                    color: const Color(0xff1B1D28),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "089-912-2933",
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
                            Expanded(
                              child: SizedBox(),
                            ),
                            SizedBox(
                              // iconVNe (1:251)

                              width: 35 * fem,
                              height: 35 * fem,
                              child: Image.asset(
                                'assets/marketplace/images/Group-34225.png',
                                width: 35 * fem,
                                height: 35 * fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      // iconVNe (1:251)
                      height: 13,
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          // iconVNe (1:251)

                          width: 338 * fem,
                          height: 74 * fem,
                          child: Image.asset(
                            'assets/marketplace/images/Rectangle-4477.png',
                            width: 338 * fem,
                            height: 74 * fem,
                          ),
                        ),
                        Image.asset(
                          'assets/marketplace/images/Group-7141.png',
                          width: 338 * fem,
                          height: 74 * fem,
                        ),
                      ],
                    ),
                    SizedBox(
                      // iconVNe (1:251)
                      height: 21,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Detail',
                                style: SafeGoogleFont(
                                  'Kanit',
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.3000000119 * fem,
                                  color: const Color(0xff2B2B2B),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InformationScreen(
                                              imageDataxinfo: imageDataxinfo,
                                            )),
                                  );
                                },
                                child: Image.asset(
                                  'assets/marketplace/images/group-34013.png',
                                  width: 22 * fem,
                                  height: 22 * fem,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Hali Parker is a contemporary clothing brand, devoted to creating garments that are perfect for everyday wear. Each and every garment is designed to be long- lasting, functional and timeless, with a promise to ... More',
                            style: SafeGoogleFont(
                              'Kanit',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w300,
                              height: 1.495 * ffem / fem,
                              letterSpacing: -0.3000000119 * fem,
                              color: const Color(0xff4D4D4D),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
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
                                "Seller's products",
                                style: SafeGoogleFont(
                                  'Kanit',
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.3000000119 * fem,
                                  color: const Color(0xff2B2B2B),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
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
            onTap: () {
              // Navigator.pop(context, true);
              //Modular.to.pushReplacementNamed('/report', arguments: imageDatax);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReportScreen(
                          imageDatax: imageDatax,
                        )),
              );
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
