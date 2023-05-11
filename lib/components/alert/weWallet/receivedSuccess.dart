import 'package:flutter/material.dart';

import '../../../constant/colosrConstants.dart';
import '../../../constant/stylesConstants.dart';


Future receivedSuccess(BuildContext context,Function onClick) {
  return showDialog<Widget>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: Container(
          margin: const EdgeInsets.all(50),
          constraints: maxHeightContain,
          decoration: alertBoxDecoration,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Image.asset(
                      'assets/images/successQR.png',
                      fit: BoxFit.fill,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const Text(
                    'Success',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2F2F2F),
                        fontFamily: 'Kanit'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: const Text(
                      'The system has been received.',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7E7E7E),
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 10),
                    height: 47,
                    width: 165,
                    child: OutlinedButton(
                      style: alertOutlinedButton,
                      onPressed: () {
                        Navigator.of(context).pop();
                        onClick?.call();
                      },
                      child: const Text(
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
