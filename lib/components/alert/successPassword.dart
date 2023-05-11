import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/views/auth/createProfile.dart';
import 'package:we_link/views/auth/signin_screen.dart';
import 'package:we_link/views/home_screen.dart';
import 'package:we_link/views/main_screen.dart';

class successPassword extends StatelessWidget {
  const successPassword({Key? key, this.changePIN, this.forgotPass})
      : super(key: key);
  final String? changePIN;
  final String? forgotPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgSignin.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
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
                      'Set Pin Success',
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
                      'You have saved Get started now',
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
                        changePIN == 'changePIN'
                            ? Get.offAll(MainScreen(valueSelectedIndex: 4,))
                            : forgotPass == 'forgotPass'
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()),
                                  )
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateProfileScreen(
                                              type: CreateProfileType.CREATE,
                                            )),
                                  );
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
        )),
      ),
    );
  }
}
