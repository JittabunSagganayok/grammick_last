import 'package:flutter/material.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class language extends StatefulWidget {
  language({Key? key}) : super(key: key);

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  var chooseLang = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            shape: appbarBorder,
            centerTitle: true,
            leading: Container(
              margin: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            title: Text(
              'Language',
              style: titleWhiteAppbar,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 33, bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Choose you Language",
                        style: TextStyle(
                            color: Color(0xFF3F3F3F),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Kanit'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          chooseLang = 1;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 80,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 25),
                              child: Image.asset(
                                'assets/images/th.png',
                                fit: BoxFit.fill,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: "ไทย",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Kanit'),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "Thailand",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Kanit'),
                                  ),
                                ],
                              ),
                            ),
                            chooseLang == 1
                                ? Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 22),
                                    child: Image.asset(
                                      'assets/images/check1.png',
                                      fit: BoxFit.fill,
                                      height: 22,
                                      width: 22,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          chooseLang = 2;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 80,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 25),
                              child: Image.asset(
                                'assets/images/en.png',
                                fit: BoxFit.fill,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: "อังกฤษ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Kanit'),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "English",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Kanit'),
                                  ),
                                ],
                              ),
                            ),
                            chooseLang == 2
                                ? Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 22),
                                    child: Image.asset(
                                      'assets/images/check1.png',
                                      fit: BoxFit.fill,
                                      height: 22,
                                      width: 22,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                )),
              ),
              Container(
                height: 50,
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
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Color(0xFF363636),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit'),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ));
  }
}
