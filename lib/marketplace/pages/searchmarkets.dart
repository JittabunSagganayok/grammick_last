import 'package:flutter/material.dart';
import 'package:we_link/constant/stylesConstants.dart';

import 'package:we_link/marketplace/data/data.dart';
import 'package:we_link/marketplace/pages/searchresult.dart';
import 'package:we_link/marketplace/widgets/header.dart';
import 'package:we_link/marketplace/widgets/imagecard.dart';

class SearchMScreen extends StatefulWidget {
  SearchMScreen({super.key});

  //String title;

  @override
  State<SearchMScreen> createState() => _SearchMScreenState();
}

class _SearchMScreenState extends State<SearchMScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double fontfem = fem * 0.85;
    double h1 = ((250 * (imagescardList.length) / 2) + 4) * fem;

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
                                  "Recent",
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchResultScreen(
                                                      search: searchlist[index]
                                                          ["title"])),
                                        );
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
