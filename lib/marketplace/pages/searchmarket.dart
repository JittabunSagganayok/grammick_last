import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/home/searchComponents/searchMenu.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:we_link/marketplace/pages/marketplace.dart';
import 'package:we_link/marketplace/widgets/header.dart';

import '../data/data.dart';

class MarketHomeSearchScreen extends StatefulWidget {
  MarketHomeSearchScreen({
    super.key,
  });

  @override
  State<MarketHomeSearchScreen> createState() => _MarketHomeSearchScreenState();
}

class _MarketHomeSearchScreenState extends State<MarketHomeSearchScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double fontfem = fem * 0.85;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/images/goBack.png'),
          ),
        ),
        title: Container(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
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
                  )),
            )
          ],
        )),
      ),
      body: Column(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 25,
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 25, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent",
                            style: resultText,
                          ),
                          Text(
                            "Clear All",
                            style: TextStyle(
                                color: Color(0xFF172BB5),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Kanit'),
                          ),
                        ],
                      ),
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
          ),
        ],
      ),
    );
  }
}
