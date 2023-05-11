import 'package:flutter/material.dart';
import 'package:we_link/components/alert/orderDetailAlert.dart';
import 'package:we_link/components/home/weAssistantComponents/checkDetails.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class orderDetail extends StatefulWidget {
  orderDetail({Key? key}) : super(key: key);

  @override
  State<orderDetail> createState() => _orderDetailState();
}

class _orderDetailState extends State<orderDetail> {
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
              'Order Detail',
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
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Container(
                        constraints: maxHeightContain,
                        margin: EdgeInsets.only(bottom: 11),
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start point',
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
                                  Navigator.pop(context);
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
                                                text: "7/11 Premium Place",
                                                style: TextStyle(
                                                    color: Color(0xFF4B4B4B),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Kanit'),
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Container(
                                            child: Text.rich(
                                              TextSpan(
                                                text:
                                                    "Keas 69 Str.15234, ChalandriAthens....",
                                                style: TextStyle(
                                                    color: Color(0xFFACACAC),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Kanit'),
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
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
                        ),
                      ),
                      Container(
                        constraints: maxHeightContain,
                        margin: EdgeInsets.only(bottom: 11),
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Send details to the driver.',
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
                              SizedBox(height: 22),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        constraints: maxHeightContain,
                        margin: EdgeInsets.only(bottom: 11),
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'list',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                    fontFamily: 'Kanit'),
                              ),
                              SizedBox(
                                height: 21,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        margin: EdgeInsets.only(right: 15),
                                        height: 55,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: TextFormField(
                                          autofocus: false,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: 'Ex. Orange',
                                            fillColor: Color(0xFFFBFBFB),
                                            filled: true,
                                            hintStyle: hintTextStyle,
                                            enabledBorder: searchBoder,
                                            focusedBorder: searchBoder,
                                          ),
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 55,
                                        child: TextFormField(
                                          autofocus: false,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: '1 piecee',
                                            fillColor: Color(0xFFFBFBFB),
                                            filled: true,
                                            hintStyle: hintTextStyle,
                                            enabledBorder: searchBoder,
                                            focusedBorder: searchBoder,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Image.asset(
                                        'assets/images/add.png',
                                        fit: BoxFit.contain,
                                        color: yellowColor,
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                    Text(
                                      'More List',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Kanit',
                                          color: yellowColor),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 22),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        constraints: maxHeightContain,
                        margin: EdgeInsets.only(bottom: 11),
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Estimated product price',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                    fontFamily: 'Kanit'),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Specify the amount so the driver has the money ready.',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF4B4B4B),
                                    fontFamily: 'Kanit'),
                              ),
                              SizedBox(
                                height: 23,
                              ),
                              Container(
                                  height: 55,
                                  child: TextFormField(
                                    autofocus: false,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Max 1k',
                                      fillColor: Color(0xFFFBFBFB),
                                      filled: true,
                                      hintStyle: hintTextStyle,
                                      enabledBorder: searchBoder,
                                      focusedBorder: searchBoder,
                                    ),
                                  )),
                              SizedBox(
                                height: 17,
                              ),
                              Text(
                                'The price of the product does not include  \n payment on delivery.',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF4B4B4B),
                                    fontFamily: 'Kanit'),
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ),
              Container(
                decoration: containerDecoration,
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => checkDetails()),
                        );
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
                ),
              )
            ],
          ),
        ));
  }
}
