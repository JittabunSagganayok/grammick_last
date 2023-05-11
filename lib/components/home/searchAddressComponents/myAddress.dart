import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:we_link/components/alert/addAddressHome.dart';
import 'package:we_link/components/alert/deletePlaceAlert.dart';
import 'package:we_link/components/button/buttonBackground.dart';
import 'package:we_link/components/signin/selectAddress.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class myAddress extends StatefulWidget {
  myAddress({Key? key}) : super(key: key);

  @override
  State<myAddress> createState() => _myAddressState();
}

class _myAddressState extends State<myAddress> {
  bool status1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
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
              'My Address',
              style: titleWhiteAppbar,
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Address',
                            style: addNewAddrBlackText,
                          ),
                          Text(
                            ' *',
                            style: addNewAddrYellowText,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchAddressScreen(keyword: 'searchAddress')),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text.rich(
                                        TextSpan(
                                          text: "Home ",
                                          style: TextStyle(
                                              color: Color(0xFF212B32),
                                              fontSize: 16,
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
                                              color: Color(0xFF979797),
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
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Image.asset(
                                  'assets/images/edit.png',
                                  fit: BoxFit.fill,
                                  height: 22,
                                  width: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Color(0xFFEEEEEE),
                        thickness: 1,
                      ),
                      SizedBox(height: 22),
                      Row(
                        children: [
                          Text(
                            'Name',
                            style: addNewAddrBlackText,
                          ),
                          Text(
                            ' *',
                            style: addNewAddrYellowText,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                          height: 55,
                          child: TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            style: addAddressText,
                            controller: TextEditingController()
                              ..text = 'My Home town chachacha',
                            decoration: InputDecoration(
                              hintText: 'Add new name',
                              fillColor: Color(0xFFFBFBFB),
                              filled: true,
                              hintStyle: hintTextStyle,
                              enabledBorder: searchBoder,
                              focusedBorder: searchBoder,
                            ),
                          )),
                      SizedBox(height: 22),
                      Row(
                        children: [
                          Text(
                            'More Detail',
                            style: addNewAddrBlackText,
                          ),
                          Text(
                            ' *',
                            style: addNewAddrYellowText,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          maxLines: 5,
                          controller: TextEditingController()
                            ..text =
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',
                          style: addAddressText,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Add description more',
                            fillColor: Color(0xFFFBFBFB),
                            filled: true,
                            hintStyle: hintTextStyle,
                            enabledBorder: searchBoder,
                            focusedBorder: searchBoder,
                          ),
                        ),
                      ),
                      SizedBox(height: 34),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Favorite',
                              style: addNewAddrBlackText,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: FlutterSwitch(
                              width: 65.0,
                              height: 25.0,
                              toggleColor: Colors.white,
                              switchBorder: Border.all(
                                color: Color(0xFFF6F6F6),
                                width: 1.0,
                              ),
                              inactiveToggleColor: Color(0xFFC4C4C4),
                              activeColor: Color(0xFFA1EE86),
                              inactiveColor: Color(0xFFE8E8E8),
                              value: status1,
                              onToggle: (val) {
                                setState(() {
                                  status1 = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ),
              Container(
                decoration: containerDecoration,
                child: Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => deletePlaceAlert(context),
                            child: Container(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                  border: Border.all(
                                    color: Color(0xFFEFEFEF),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color.fromRGBO(202, 202, 202, 0.33),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child: Center(
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Color(0xFFDF2A2B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Kanit'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => addAddressHome(context),
                            child: Container(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  color: Color(0xFF40C255),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                  ),
                              child: Center(
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Kanit'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
