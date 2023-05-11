import 'package:flutter/material.dart';
import 'package:we_link/views/main_screen.dart';
import 'package:we_link/components/profile/myWallet.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

void paymentSuccess(BuildContext context) {
  showDialog<Widget>(
      barrierDismissible: true,
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
                      height: 63,
                      width: 63,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Successful payment',
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
                      top: 13,
                    ),
                    child: Text(
                      'Please check the top up.',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7E7E7E),
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Text(
                    'at your pocket',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7E7E7E),
                        fontFamily: 'Kanit'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 35, bottom: 10),
                    height: 47,
                    width: 165,
                    child: OutlinedButton(
                      style: alertOutlinedButton,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => myWallet()),
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
