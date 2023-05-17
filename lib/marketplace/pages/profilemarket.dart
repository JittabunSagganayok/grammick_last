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
    final imageData = profileList;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                              width: 70 * fem,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Profile Store",
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 22 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.495 * ffem / fem,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                                SizedBox(
                                  width: 70 * fem,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/marketplace/images/Ellipse643.png',
                            width: 46 * fem,
                            height: 46 * fem,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Surakit Montakirue",
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Kanit'),
                              ),
                              Text(
                                "(My Store)",
                                style: TextStyle(
                                    color: Color(0xFF4d4d4d),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Kanit'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Image.asset(
                      "assets/marketplace/images/Vector-1137.png",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: 42 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffCEFFCD),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/marketplace/images/Group 34217.png',
                            width: 16 * fem,
                            height: 18 * fem,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Create Product",
                            style: TextStyle(
                                color: Color(0xFF189b58),
                                fontSize: 13 * fem,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Kanit'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "My Sale",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 12 * fem,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Kanit'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            'assets/marketplace/images/Group 33869.png',
                            width: 11 * fem,
                            height: 11 * fem,
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: imageData.length,
                        itemBuilder: ((context, index) => Container(
                              width: double.infinity,
                              // height: 500,
                              child: Container(
                                // height: 100,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                                  child: Row(
                                    children: [
                                      if (imageData[index]['status'] ==
                                          "Normal")
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child:
                                              //if(imageData[index]['image_path']=="normal")
                                              Image.asset(
                                            imageData[index]['image_path'],
                                            fit: BoxFit.cover,
                                            height: 81,
                                            width: 91,
                                          ),
                                          //else
                                        )
                                      else
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child:
                                              //if(imageData[index]['image_path']=="normal")
                                              Image.asset(
                                            imageData[index]['image_path'],
                                            fit: BoxFit.cover,
                                            height: 81,
                                            width: 91,
                                            color: Colors.black45,
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                          //else
                                        ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 145 * fem,
                                            child: Text(
                                              imageData[index]["title"],
                                              style: TextStyle(
                                                  color: Color(0xFF212B32),
                                                  fontSize: 13 * ffem,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Kanit'),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            imageData[index]["price"],
                                            style: TextStyle(
                                                color: Color(0xFF979797),
                                                fontSize: 13 * ffem,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Kanit'),
                                          ),
                                          SizedBox(
                                            height: 50,
                                          ),
                                        ],
                                      ),
                                      Expanded(child: SizedBox()),
                                      Image.asset(
                                        'assets/marketplace/images/Group 34208.png',
                                        fit: BoxFit.contain,
                                        height: 28,
                                        width: 28,
                                      ),
                                    ],
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
                                      hintText: 'Search you product',
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
