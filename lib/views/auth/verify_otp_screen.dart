import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:we_link/components/alert/successPassword.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/error/error_response.dart';
import 'package:we_link/models/otp/verify_otp_request.dart';
import 'package:we_link/models/otp/verify_otp_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../core/constants/key_constants.dart';
import '../../models/signin/pin/signin_by_pin_request.dart';
import '../../models/signin/pin/signin_by_pin_response.dart';

class OtpArguments {
  String phone;
  String ref;

  OtpArguments({
    required this.phone,
    required this.ref,
  });
}

class VerifyOtpScreen extends StatefulWidget {
  VerifyOtpScreen({
    Key? key,
    this.valueSelectedPage,
    this.forgotPass,
    this.arguments,
  }) : super(key: key);
  final int? valueSelectedPage;
  final String? forgotPass;

  OtpArguments? arguments;

  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState
    extends AppState<VerifyOtpScreen, VerifyOtpViewModel> {
  final StreamController<bool> _verificationNotifier = StreamController<bool>.broadcast();
  final CountdownController _controller = new CountdownController(autoStart: true);
  bool _isTimerEnd = false;

  @override
  VerifyOtpViewModel initViewModel(VerifyOtpViewModel viewModel) {
    viewModel.confirmOtpSuccess.listen((p0) {
      navigator?.pop();
      _showLockScreen(
        context,
        opaque: false,
        cancelButton: Container(
          // margin: EdgeInsets.only(bottom: 175, right: 30),
          child: Text(
            'Cancel',
            style: const TextStyle(fontSize: 16, color: Colors.white),
            semanticsLabel: 'Cancel',
          ),
        ),
      );
    });

    viewModel.registerSuccess.listen((p0) {
      navigator?.pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => successPassword(
            forgotPass: widget.forgotPass,
          ),
        ),
      );
    });

    viewModel.registerError.listen((message) {
      viewModel.otp.value = '';
      navigator?.pop();
      Get.defaultDialog(
        title: 'Error',
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      );
    });

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, VerifyOtpViewModel viewModel) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/images/goBack.png'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 18, right: 18),
          child: Column(children: [
            Container(
              child: Image.asset(
                'assets/images/otp.png',
                fit: BoxFit.contain,
                height: 122,
                width: 222,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              alignment: Alignment.topLeft,
              child: Text(
                'Verify OTP',
                style: titleAuthText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.topLeft,
              child: Text(
                'Please enter the code received from SMS.',
                style: subTitleAuthText,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text.rich(
                  TextSpan(text: "Number ", style: subTitleAuthText, children: [
                TextSpan(
                  text: widget.arguments?.phone,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xFFFDB824),
                      fontSize: 15,
                      fontFamily: 'Kanit'),
                )
              ])),
            ),
            SizedBox(
              height: 16,
            ),
            OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceBetween,
                fieldStyle: FieldStyle.underline,
                otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: Color(0xFFFDCD03),
                  enabledBorderColor: Color(0xFFC9C9C9),
                ),
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: yellowColor,
                ),
                onChanged: (pin) {
                  viewModel.otp.value = pin;
                },
                onCompleted: (pin) {
                  viewModel.otp.value = pin;
                }),
            SizedBox(
              height: 16,
            ),
            Countdown(
              controller: _controller,
              seconds: 30,
              build: (_, double time) => Container(
                width: 100,
                height: 32,
                margin: EdgeInsets.only(top: 25),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Color(0xFF3C3C3C),
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () async {
                    if (_isTimerEnd == true) {

                      if (widget?.forgotPass!=null) {
                        await viewModel.resendOtp(widget.arguments?.phone ?? "",
                            success: (otp) {

                              widget.arguments = OtpArguments(
                                  phone: otp.result?.phone ?? "",
                                  ref: otp.result?.ref ?? "");

                              setState(() {
                                _isTimerEnd = false;
                              });

                              _controller.restart();

                            }, error: (message) {
                              Get.defaultDialog(
                                title: 'Error',
                                content: Text(message),
                              );
                            });
                      }  else{
                        setState(() {
                          _isTimerEnd = false;
                        });

                        _controller.restart();
                      }
                    }
                  },
                  child: Row(
                    children: [
                      _isTimerEnd == false
                          ? Container(
                              child: Image.asset(
                                'assets/images/again.png',
                                fit: BoxFit.contain,
                                height: 16,
                                width: 16,
                              ),
                            )
                          : Container(),
                      Text(
                        _isTimerEnd == false
                            ? '  ' + time.toInt().toString()
                            : 'Send Again',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Kanit',
                            color: Color(0xFFC4C4C4)),
                      ),
                      Text(
                        _isTimerEnd == false ? ' Sec' : '',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Kanit',
                            color: Color(0xFFC4C4C4)),
                      ),
                    ],
                  ),
                ),
              ),
              interval: Duration(milliseconds: 100),
              onFinished: () {
                setState(() {
                  _isTimerEnd = true;
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Ref. ${widget.arguments?.ref}',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Kanit',
                  color: Color(0xFFC4C4C4)),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 56,
              child: OutlinedButton(
                style: buttonOutlinedButton,
                onPressed: () {
                  if (viewModel.otp.value.length < 6) {
                    Get.defaultDialog(
                      title: 'Error',
                      content: Text(
                        'Please enter you OTP.',
                        textAlign: TextAlign.center,
                      ),
                    );
                    return;
                  }
                  Get.dialog(LoadingFullscreen(
                    backgroundColor: Colors.black45,
                  ));
                  viewModel.confirmOtp(
                    otp: viewModel.otp.value,
                    // otp: widget.arguments?.otp ?? "",
                    phone: widget.arguments?.phone ?? "",
                  );
                },
                child: Text(
                  'Confirm',
                  style: buttonTextStyle,
                ),
              ),
            ),
          ]),
        ),
      ),
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgSignin.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: PasscodeScreen(
                title: Column(
                  children: [
                    Text(
                      widget.forgotPass == 'forgotPass'
                          ? 'Please Set a New PIN'
                          : 'Please Set a PIN',
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
                circleUIConfig: CircleUIConfig(
                    borderColor: Colors.white,
                    fillColor: yellowColor,
                    circleSize: 20),
                keyboardUIConfig: KeyboardUIConfig(
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
                  child: Text(
                    'Delete',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
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
                bottomWidget: Container(
                  margin: const EdgeInsets.only(
                    bottom: 100.0,
                  ),
                )),
          ),
        ));
  }

  _onPasscodeEntered(String enteredPasscode) async {
    Get.dialog(LoadingFullscreen(
      backgroundColor: Colors.black45,
    ));
    await viewModel.createPin(
      pin: enteredPasscode,
      phone: widget.arguments?.phone ?? "",
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
}

class VerifyOtpViewModel extends GetxController {
  Dio dio = appModule.get();

  var otp = ''.obs;

  var confirmOtpSuccess = VerifyOtpResult().obs;
  var registerSuccess = false.obs;
  var registerError = ''.obs;

  Future resendOtp(
    String phone, {
    required Function(VerifyOtpResponse) success,
    required Function(String) error,
  }) async {
    try {
      var response = await dio
          .post('auth/forgot-password/send-otp', data: {'phone': phone});
      var otp = VerifyOtpResponse.fromJson(response.data);
      success(otp);
    } on DioError catch (e) {
      var response = ErrorResponse.fromJson(e.response?.data);
      error(response?.message ?? "");
    }
  }

  Future confirmOtp({
    required String otp,
    required String phone,
  }) async {
    var request = VerifyOtpRequest(
      otp: otp,
      phone: phone,
    );

    try {
      var response = await dio.post('sms/verify-otp', data: request.toJson());
      var data = VerifyOtpResponse.fromJson(response.data);
      confirmOtpSuccess.value = data.result!;
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      registerError.value = errorResponse.message ?? "";
    }
  }

  Future createPin({
    required String pin,
    required String phone,
  }) async {
    Map<String, dynamic> request = {
      "pin": pin,
      "phone": phone,
    };

    try {
      await dio.post(
        'users/create/pin',
        data: request,
      );

      await signInByPin(
        pin: pin,
        phone: phone,
        isRememberPin: true,
      );
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      registerError.value = errorResponse.message ?? "";
    }
  }

  Future signInByPin({
    required String pin,
    required String phone,
    required bool isRememberPin,
  }) async {
    SigninByPinRequest request = SigninByPinRequest(
      phone: phone,
      isRemember: true,
      pin: pin,
    );

    try {
      var response = await dio.post('auth/signin/pin', data: request.toJson());
      var data = SigninByPinResponse.fromJson(response.data);
      var result = data.result;

      appStorage.writeInMemory(KEY_ACCESS_TOKEN, result?.accessToken ?? "");
      appStorage.writeInMemory(KEY_REFRESH_TOKEN, result?.refreshToken ?? "");
      appStorage.writeInMemory(KEY_USER_DETAIL, result?.user);
      await appStorage.save();

      registerSuccess.value = true;
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      registerError.value = errorResponse.message ?? "";
    }
  }
}
