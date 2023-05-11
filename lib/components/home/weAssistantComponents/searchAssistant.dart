import 'package:flutter/material.dart';
import 'package:we_link/components/home/weAssistantComponents/orderDetail.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class searchAssistant extends StatefulWidget {
  searchAssistant({Key? key, this.searchRecipient}) : super(key: key);
  final String? searchRecipient;

  @override
  State<searchAssistant> createState() => _searchAssistantState();
}

class _searchAssistantState extends State<searchAssistant> {
  UnfocusDisposition disposition = UnfocusDisposition.scope;
  FocusNode focusSearch = new FocusNode();

  var _searchview = TextEditingController()..text = 'Find a store to order.';
  var _searchviewRecipient = TextEditingController()
    ..text = 'Home , Keas 69 Str.15234';

  // onItemChanged(String value) {
  //   setState(() {
  //     sumDataList = loopDataList
  //         .where((e) => e['title'].toLowerCase().contains(value.toLowerCase()))
  //         .toList();
  //   });
  // }

  String _query = "";

  _searchAssistantState() {
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        setState(() {
          _query = "";
        });
      } else {
        setState(() {
          _query = _searchview.text;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusSearch.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: false,
            shape: appbarBorder,
            leading: Container(
              margin: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    primaryFocus!.unfocus(disposition: disposition);
                  });
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
                      // margin: EdgeInsets.only(left: ),
                      height: 43,
                      child: TextFormField(
                        autofocus: false,
                        focusNode: focusSearch,
                        controller: widget.searchRecipient == 'searchRecipient'
                            ? _searchviewRecipient
                            : _searchview,
                        // onChanged: onItemChanged,
                        style: widget.searchRecipient == 'searchRecipient'
                            ? weAssisTText
                            : weAssisText,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Select Address',
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: hintTextStyle,
                          contentPadding: fieldPadding,
                          enabledBorder: searchBoder,
                          focusedBorder: searchBoder,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: widget.searchRecipient == 'searchRecipient'
                                ? Image.asset(
                                    'assets/images/assis.png',
                                    fit: BoxFit.contain,
                                    height: 10,
                                    width: 10,
                                  )
                                : Image.asset(
                                    'assets/images/loca4.png',
                                    fit: BoxFit.contain,
                                    height: 10,
                                    width: 10,
                                  ),
                          ),
                          // suffixIcon: _searchview.text.isNotEmpty
                          //     ? GestureDetector(
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(13.0),
                          //           child: Image.asset(
                          //             'assets/images/close.png',
                          //             fit: BoxFit.contain,
                          //             height: 10,
                          //             width: 10,
                          //           ),
                          //         ),
                          //         onTap: () {
                          //           _searchview.clear();
                          //           FocusScope.of(context)
                          //               .requestFocus(FocusNode());
                          //         },
                          //       )
                          //     : null,
                        ),
                      )),
                )
              ],
            )),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Container(
                  margin: EdgeInsets.only(top: 11),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                                // height: 43,
                                constraints: maxHeightContain,
                                margin: EdgeInsets.only(bottom: 15),
                                width: MediaQuery.of(context).size.width * 1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // borderRadius: BorderRadius.all(
                                  //   Radius.circular(11),
                                  // )
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Favorites',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black,
                                            fontFamily: 'Kanit'),
                                      ),
                                      SizedBox(
                                        height: 21,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          widget.searchRecipient ==
                                                  'searchRecipient'
                                              ? Navigator.pop(context)
                                              : null;
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                'assets/images/loca2.png',
                                                fit: BoxFit.fill,
                                                height: 29,
                                                width: 19,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 13,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text.rich(
                                                      TextSpan(
                                                        text:
                                                            "The Mall Banglapi",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF4B4B4B),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                'Kanit'),
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text.rich(
                                                      TextSpan(
                                                        text:
                                                            "Keas 69 Str.15234, ChalandriAthens....",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFACACAC),
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                'Kanit'),
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Image.asset(
                                                'assets/images/edit1.png',
                                                fit: BoxFit.fill,
                                                height: 22,
                                                width: 22,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Container(
                                // height: 43,
                                constraints: maxHeightContain,
                                margin: EdgeInsets.only(bottom: 10),
                                width: MediaQuery.of(context).size.width * 1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // borderRadius: BorderRadius.all(
                                  //   Radius.circular(11),
                                  // )
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Near By',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black,
                                            fontFamily: 'Kanit'),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      for (var i = 0; i < 2; i++)
                                        Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                widget.searchRecipient ==
                                                        'searchRecipient'
                                                    ? null
                                                    : Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                orderDetail()),
                                                      );
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Image.asset(
                                                      'assets/images/loca2.png',
                                                      fit: BoxFit.fill,
                                                      height: 29,
                                                      width: 19,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 13,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text.rich(
                                                            TextSpan(
                                                              text:
                                                                  "The Mall Banglapi",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF4B4B4B),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontFamily:
                                                                      'Kanit'),
                                                            ),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Text.rich(
                                                            TextSpan(
                                                              text:
                                                                  "Keas 69 Str.15234, ChalandriAthens....",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFFACACAC),
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Kanit'),
                                                            ),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Container(
                                                    child: Image.asset(
                                                      'assets/images/mark1.png',
                                                      fit: BoxFit.fill,
                                                      height: 22,
                                                      width: 22,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Divider(
                                              color: Color(0xFFEEEEEE),
                                              thickness: 1,
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 1,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: yellowColor,
                            textStyle: TextStyle(fontSize: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            side: BorderSide(
                              width: 0.0,
                              color: yellowColor,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => signIn()),
                            // );
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  'assets/images/Current.png',
                                  fit: BoxFit.fill,
                                  height: 15,
                                  width: 12,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Current location',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Kanit'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 1,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: blackColor,
                            textStyle: TextStyle(fontSize: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            side: BorderSide(
                              width: 0.0,
                              color: blackColor,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => map()),
                            // );
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5, right: 10),
                                child: Image.asset(
                                  'assets/images/map.png',
                                  fit: BoxFit.fill,
                                  height: 15,
                                  width: 18,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Choose Maps',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Kanit'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
