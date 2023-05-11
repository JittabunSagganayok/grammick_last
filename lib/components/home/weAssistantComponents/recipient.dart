import 'package:flutter/material.dart';
import 'package:we_link/components/home/weAssistantComponents/searchAssistant.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class recipient extends StatefulWidget {
  recipient({Key? key}) : super(key: key);

  @override
  State<recipient> createState() => _recipientState();
}

class _recipientState extends State<recipient> {
  UnfocusDisposition disposition = UnfocusDisposition.scope;
  FocusNode focusSearchrecipient = new FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusSearchrecipient.dispose();
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
            shape: appbarBorder,
            leading: Container(
              margin: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            centerTitle: true,
            title: Text(
              'About Recipient',
              style: titleYellowAppbar,
            ),
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
                                        'Sent point',
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => searchAssistant(searchRecipient: 'searchRecipient')),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                'assets/images/assis.png',
                                                fit: BoxFit.fill,
                                                height: 26,
                                                width: 26,
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
                                                        text: "Home",
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
                                                'assets/images/recip.png',
                                                fit: BoxFit.fill,
                                                height: 18,
                                                width: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Container(
                                constraints: maxHeightContain,
                                margin: EdgeInsets.only(bottom: 10),
                                width: MediaQuery.of(context).size.width * 1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Detail',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black,
                                            fontFamily: 'Kanit'),
                                      ),
                                      SizedBox(
                                        height: 21,
                                      ),
                                      Container(
                                          height: 55,
                                          child: TextFormField(
                                            autofocus: false,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              hintText: 'Add new name',
                                              fillColor: Color(0xFFFBFBFB),
                                              filled: true,
                                              hintStyle: hintTextStyle,
                                              enabledBorder: searchBoder,
                                              focusedBorder: searchBoder,
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Image.asset(
                                                  'assets/images/profile.png',
                                                  fit: BoxFit.contain,
                                                  height: 10,
                                                  width: 10,
                                                ),
                                              ),
                                            ),
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(top: 21),
                                          height: 55,
                                          child: TextFormField(
                                            autofocus: false,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              hintText: 'Phone',
                                              fillColor: Color(0xFFFBFBFB),
                                              filled: true,
                                              hintStyle: hintTextStyle,
                                              enabledBorder: searchBoder,
                                              focusedBorder: searchBoder,
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.all(13.0),
                                                child: Image.asset(
                                                  'assets/images/phone.png',
                                                  fit: BoxFit.contain,
                                                  height: 10,
                                                  width: 10,
                                                ),
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: 36),
                                      Text(
                                        'More Detail',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black,
                                            fontFamily: 'Kanit'),
                                      ),
                                      SizedBox(
                                        height: 21,
                                      ),
                                      Container(
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          maxLines: 6,
                                          decoration: InputDecoration(
                                            counterText: '',
                                            hintText: 'Add description more',
                                            fillColor: Color(0xFFFBFBFB),
                                            filled: true,
                                            hintStyle: hintTextStyle,
                                            enabledBorder: reviewBorderStyle,
                                            focusedBorder: reviewBorderStyle,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 36),
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
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
                  child: Container(
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
                      // onPressed: () => addAddressSuccess(context),
                      onPressed: () {  },
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
                ),
              )
            ],
          ),
        ));
  }
}
