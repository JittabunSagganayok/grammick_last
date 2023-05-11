import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:we_link/components/auth/selectLanguage.dart';
import 'package:we_link/components/auth/signInWith.dart';
import 'package:we_link/views/auth/term_cond_screen.dart';
import 'package:we_link/views/main_screen.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/core/constants/key_constants.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/error/error_response.dart';
import 'package:we_link/models/signin/phone/signin_by_phone_response.dart';
import 'package:we_link/models/signin/pin/signin_by_pin_request.dart';
import 'package:we_link/models/signin/pin/signin_by_pin_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:we_link/views/auth/forgotPassword.dart';
import 'package:we_link/views/auth/signup_screen.dart';

import '../../models/signin/phone/signin_by_phone_request.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends AppState<SignInScreen, SignInViewModel> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;

  @override
  SignInViewModel initViewModel(SignInViewModel viewModel) {
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, SignInViewModel viewModel) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bgSignin.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            child: Stack(
              children: [
                /*
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: EdgeInsets.only(top: 60),
                      child: selectLanguage()
                  )
                ),
                */
                Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.only(left: 18, right: 18),
                            child: Column(children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 25, top: 150),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Sign in',
                                  style: titleAuthText,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: fildPhoneNum,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 110,
                                      child: CountryCodePicker(
                                          padding: const EdgeInsets.all(0),
                                          initialSelection: 'TH',
                                          showCountryOnly: false,
                                          enabled: false,
                                          showOnlyCountryWhenClosed: false,
                                          alignLeft: true,
                                          textStyle: phoneNumText),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      color: const Color(0xFF091353),
                                      height: 33,
                                      width: 1,
                                    ),
                                    Expanded(
                                        child: TextField(
                                      onChanged: (text) {
                                        viewModel.phone.value = text;
                                      },
                                      decoration: InputDecoration(
                                          hintText: 'Phone Number',
                                          hintStyle: phonNumHintText,
                                          border: InputBorder.none),
                                    )),
                                    Obx(() => !viewModel.isPhoneValid ? const SizedBox() :
                                      Container(
                                        margin: const EdgeInsets.only(right: 13),
                                        child: Image.asset(
                                          'assets/images/check.png',
                                          fit: BoxFit.fill,
                                          height: 10,
                                          width: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 40),
                                width: MediaQuery.of(context).size.width * 1,
                                height: 52,
                                child: OutlinedButton(
                                  style: buttonOutlinedButton,
                                  onPressed: () {
                                    Get.dialog(LoadingFullscreen(backgroundColor: Colors.black45,));
                                    viewModel.signInByPhone(
                                      phone: viewModel.phone.value,
                                      success: (result) {
                                        navigator?.pop();
                                        _showLockScreen(
                                          context,
                                          opaque: false,
                                          cancelButton: Container(
                                            // margin: EdgeInsets.only(
                                            //     bottom: 175, right: 30),
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                              semanticsLabel: 'Cancel',
                                            ),
                                          ),
                                        );
                                      },
                                      error: (message) {
                                        navigator?.pop();
                                        Get.defaultDialog(
                                          title: 'Error',
                                          content: Text(message),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Sign in',
                                    style: buttonTextStyle,
                                  ),
                                ),
                              ),
                              // SocialLoginButton(),
                              const SizedBox(height: 56,),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  const SignUpScreen()),
                                  );
                                }),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 23, top: 100),
                                  child: const Text.rich(TextSpan(
                                      text: "Don't have an account ? ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Kanit'),
                                      children: [
                                        TextSpan(
                                          text: "Register",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: yellowColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Kanit'),
                                        )
                                      ])),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  _showLockScreen(
    BuildContext context, {
    required bool opaque,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    required Widget cancelButton,
    List<String>? digits,
  }) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) => Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgSignin.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: PasscodeScreen(
              title: Column(
                children: const [
                  Text(
                    'Specify PIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //     'Enter App Passcode',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(color: Colors.white, fontSize: 28),
                  // ),
                ],
              ),
              circleUIConfig: const CircleUIConfig(
                  borderColor: Colors.white,
                  fillColor: yellowColor,
                  circleSize: 20),
              keyboardUIConfig: const KeyboardUIConfig(
                  digitBorderWidth: 1,
                  keyboardSize: Size(280, 350),
                  // digitInnerMargin: EdgeInsets.all(100),
                  digitTextStyle: TextStyle(
                      fontSize: 19,
                      color: yellowColor,
                      fontWeight: FontWeight.bold),
                  keyboardRowMargin: EdgeInsets.all(0)),
              passwordEnteredCallback: _onPasscodeEntered,
              cancelButton: cancelButton,
              deleteButton: Container(
                // margin: EdgeInsets.only(bottom: 175, right: 30),
                child: const Text(
                  'Delete',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  semanticsLabel: 'Delete',
                ),
              ),
              // deleteButton: Container(
              //   // margin: EdgeInsets.only(bottom: 175, right: 35),
              //   child: Image.asset(
              //     'assets/images/delete.png',
              //     fit: BoxFit.fill,
              //     height: 22,
              //     width: 31,
              //   ),
              // ),
              shouldTriggerVerification: _verificationNotifier.stream,
              backgroundColor: Colors.black.withOpacity(0.4),
              cancelCallback: _onPasscodeCancelled,
              digits: digits,
              passwordDigits: 6,
              bottomWidget: _buildPasscodeRestoreButton(),
            ),
          ),
        ));
  }

  _onPasscodeEntered(String enteredPasscode) {
    Get.dialog(LoadingFullscreen(backgroundColor: Colors.black45,));
    viewModel.signInByPin(
      isRememberPin: true,
      success: () {
        navigator?.pop();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      },
      error: (message) {
        navigator?.pop();
        Get.defaultDialog(
          title: 'Error',
          content: Text(message),
        );
      },
      pin: enteredPasscode,
    );
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  _buildPasscodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 40.0),
          child: TextButton(
            child: const Text(
              "Forgot Password",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
              );
            },
            // splashColor: Colors.white.withOpacity(0.4),
            // highlightColor: Colors.white.withOpacity(0.2),
            // ),
          ),
        ),
      );
}

class SignInViewModel extends GetxController {
  Dio dio = appModule.get();

  bool get isPhoneValid => phone.value.length == 10;
  var phone = ''.obs;

  Future signInByPhone({
    required String phone,
    required Function(SigninByPhoneResult) success,
    required Function(String) error,
  }) async {
    var request = SigninByPhoneRequest(phone: phone);
    try {
      var response = await dio.post('auth/signin', data: request.toJson());
      var data = SigninByPhoneResponse.fromJson(response.data);
      success(data.result!);
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      error(errorResponse.message ?? "");
    }
  }

  Future signInByPin({
    required String pin,
    required bool isRememberPin,
    required Function() success,
    required Function(String) error,
  }) async {

    SigninByPinRequest request = SigninByPinRequest(
      phone: phone.value,isRemember: true,pin: pin,
    );

    try {
      var response = await dio.post('auth/signin/pin', data: request.toJson());
      var data = SigninByPinResponse.fromJson(response.data);
      var result = data.result;

      appStorage.writeInMemory(KEY_ACCESS_TOKEN, result?.accessToken ?? "");
      appStorage.writeInMemory(KEY_REFRESH_TOKEN, result?.refreshToken ?? "");
      appStorage.writeInMemory(KEY_USER_DETAIL, result?.user);
      await appStorage.save();

      success();
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      error(errorResponse.message ?? "");
    }
  }
}
