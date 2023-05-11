import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/error/error_response.dart';
import 'package:we_link/models/otp/verify_otp_response.dart';
import 'package:we_link/views/auth/verify_otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends AppState<ForgotPasswordScreen, ForgotPasswordViewModel> {
  var textController = TextEditingController();

  @override
  ForgotPasswordViewModel initViewModel(ForgotPasswordViewModel viewModel) {
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, ForgotPasswordViewModel viewModel) {
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
                'assets/images/forgot.png',
                fit: BoxFit.contain,
                height: 122,
                width: 222,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              alignment: Alignment.topLeft,
              child: Text(
                'Forgot Password',
                style: titleAuthText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40, top: 10),
              alignment: Alignment.topLeft,
              child: Text(
                'Please enter a phone number accessed',
                style: subTitleAuthText,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: fildPhoneNum,
              child: Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: CountryCodePicker(
                        padding: const EdgeInsets.all(0),
                        initialSelection: 'TH',
                        enabled: false,
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: true,
                        textStyle: phoneNumText),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Color(0xFF091353),
                    height: 33,
                    width: 1,
                  ),
                  Expanded(
                      child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: phonNumHintText,
                        border: InputBorder.none),
                  )),
                  Container(
                    margin: EdgeInsets.only(right: 13),
                    child: Image.asset(
                      'assets/images/check.png',
                      fit: BoxFit.fill,
                      height: 10,
                      width: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width * 1,
              height: 52,
              child: OutlinedButton(
                style: buttonOutlinedButton,
                onPressed: () async {
                  await viewModel.forgotPass(textController.text,
                      success: (otp) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerifyOtpScreen(
                                forgotPass: 'forgotPass',
                                arguments: OtpArguments(
                                    phone: otp.result?.phone ?? "",
                                    ref: otp.result?.ref ?? ""),
                              )),
                    );
                  }, error: (message) {
                    Get.defaultDialog(
                      title: 'Error',
                      content: Text(message),
                    );
                  });
                },
                child: Text(
                  'Continue',
                  style: buttonTextStyle,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ForgotPasswordViewModel extends GetxController {
  Dio dio;

  ForgotPasswordViewModel(this.dio);

  Future forgotPass(
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
}
