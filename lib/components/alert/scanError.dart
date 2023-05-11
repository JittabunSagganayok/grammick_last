import 'package:flutter/material.dart';
import 'package:we_link/components/profile/myWallet.dart';
import 'package:we_link/constant/stylesConstants.dart';

void scanError(BuildContext context) {
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
                      'assets/images/close2.png',
                      fit: BoxFit.fill,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Error',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10, ),
                    child: Text(
                      'Please scan again.',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, bottom: 10),
                    height: 38,
                    width: 165,
                    child: OutlinedButton(
                      style: alertOutlinedButton,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => myWallet(scan: 'scan')),
                        );
                        //  Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => myWallet()),
                        //     ModalRoute.withName('/'));
                        // Navigator.pop(context);
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
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
