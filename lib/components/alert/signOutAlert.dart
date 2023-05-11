import 'package:flutter/material.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/views/auth/splash_screen.dart';

void signOutAlert(
  BuildContext context, {
  required Function onClickConfirm,
}) {
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
                      'assets/images/logOut.png',
                      fit: BoxFit.fill,
                      height: 30,
                      width: 26,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Are you sure?',
                      style: titleSignOut,
                    ),
                  ),
                  Container(
                    child: Text(
                      'that you want to log out',
                      style: titleSignOut,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 17,
                    ),
                    child: Text(
                      'Press the Confirm button',
                      style: subtitleSignOut,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 40,
                            bottom: 10,
                          ),
                          height: 45,
                          child: OutlinedButton(
                            style: signOutButtonCancel,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 40,
                            bottom: 10,
                          ),
                          height: 45,
                          child: OutlinedButton(
                            style: signOutButtonConfirm,
                            onPressed: () {
                              onClickConfirm.call();
                            },
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
      });
}
