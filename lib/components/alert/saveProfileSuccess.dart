import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/views/main_screen.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/views/my_profile_screen.dart';

void saveProfileSuccess(BuildContext context) {
  showDialog<Widget>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: Container(
          margin: EdgeInsets.all(50),
          constraints: maxHeightContain,
          decoration: alertBoxDecoration,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 20),
                    child: Image.asset(
                      'assets/images/alert.png',
                      fit: BoxFit.fill,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Saved',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF2F2F2F),
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      'You have saved ',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7E7E7E),
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, bottom: 10),
                    height: 47,
                    width: 165,
                    child: OutlinedButton(
                      style: alertOutlinedButton,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => MainScreen(valueSelectedIndex: 3)),
                            ModalRoute.withName('/'));
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      });
}


void showDeleteAccountSuccess(BuildContext context) {
  showDialog<Widget>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: Container(
              margin: EdgeInsets.all(50),
              constraints: maxHeightContain,
              decoration: alertBoxDecoration,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 20),
                        child: Image.asset(
                          'assets/images/alert.png',
                          fit: BoxFit.fill,
                          height: 60,
                          width: 60,
                        ),
                      ),
                      Container(
                        child: Text(
                          'Delete account',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF2F2F2F),
                              fontFamily: 'Kanit'),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          'ระบบจะดำเนินการภายใน 7-14 วันทำการ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF7E7E7E),
                              fontFamily: 'Kanit'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 10),
                        height: 47,
                        width: 165,
                        child: OutlinedButton(
                          style: alertOutlinedButton,
                          onPressed: () {
                            Get.offAll(MainScreen());
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                                color: blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      });
}
