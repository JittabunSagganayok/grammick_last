import 'package:flutter/material.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class selectLanguage extends StatefulWidget {
  selectLanguage({Key? key}) : super(key: key);

  @override
  State<selectLanguage> createState() => _selectLanguageState();
}

class _selectLanguageState extends State<selectLanguage> {
  bool showLang = false;
  var chooseLang = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showLang = !showLang;
        });
      },
      child: Container(
          margin: EdgeInsets.only(right: 13),
          // padding: EdgeInsets.all(8),
          constraints: maxHeightContain,
          width: 110,
          decoration: BoxDecoration(
              color: showLang ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              border: Border.all(
                color: showLang ? Colors.white : Colors.transparent,
                width: 0,
              )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  // onTap: () {
                  //   chooseLang = 1;
                  // },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: showLang ? yellDarkColor : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              showLang ? Color(0xFFFFCB5A) : Color(0xFFF0F0F0),
                          child: Container(
                            child: Image.asset(
                              'assets/images/en.png',
                              fit: BoxFit.fill,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 8, top: 6),
                          child: Text(
                            'EN',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color:
                                    showLang ? Color(0xFF212B32) : Colors.white,
                                fontFamily: 'Kanit'),
                          ),
                        ),
                        showLang
                            ? Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Image.asset(
                                  'assets/images/arrowD.png',
                                  fit: BoxFit.fill,
                                  color: Color(0xFF212B32),
                                  height: 8,
                                  width: 13,
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only( top: 10),
                                child: Image.asset(
                                  'assets/images/arrowdown.png',
                                  fit: BoxFit.fill,
                                  color: Colors.white,
                                  height: 8,
                                  width: 14,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                showLang
                    ? GestureDetector(
                        onTap: () {
                          chooseLang = 2;
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Color(0xFFF0F0F0),
                                child: Container(
                                  child: Image.asset(
                                    'assets/images/th.png',
                                    fit: BoxFit.fill,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(left: 10, right: 8, top: 6),
                                child: Text(
                                  'TH',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: yellDarkColor,
                                      fontFamily: 'Kanit'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          )),
    );
  }
}
