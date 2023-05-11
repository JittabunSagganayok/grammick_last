import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/components/auth/signInWith.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/error/error_response.dart';
import 'package:we_link/models/register/register_by_phone_request.dart';
import 'package:we_link/views/auth/verify_otp_screen.dart';

import '../../models/register/register_by_phone_response.dart';
import '../../shared/loading/loading_fullscreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends AppState<SignUpScreen, SignUpViewModel> {
  @override
  SignUpViewModel initViewModel(SignUpViewModel viewModel) {
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, SignUpViewModel viewModel) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 5),
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
          margin: const EdgeInsets.only(left: 18, right: 18),
          child: Column(children: [
            Container(
              child: Image.asset(
                'assets/images/signUp.png',
                fit: BoxFit.contain,
                height: 122,
                width: 222,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              alignment: Alignment.topLeft,
              child: Text(
                'Sign Up',
                style: titleAuthText,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40, top: 10),
              alignment: Alignment.topLeft,
              child: Text(
                'Enter phone number to access',
                style: subTitleAuthText,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                onPressed: () async {
                  Get.dialog(LoadingFullscreen(backgroundColor: Colors.black45,));
                  viewModel.signup(
                    phone: viewModel.phone.value,
                    success: (result) {
                      navigator?.pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyOtpScreen(
                            arguments: OtpArguments(
                              phone: viewModel.phone.value,
                              ref: result.ref ?? "",
                            ),
                          ),
                        ),
                      );
                    },
                    error: (message) {
                      navigator?.pop();
                      Get.defaultDialog(
                        title: 'Error',
                        content: Text(message,textAlign: TextAlign.center),
                      );
                    },
                  );
                },
                child: Text(
                  'Confirm',
                  style: buttonTextStyle,
                ),
              ),
            ),
            // SocialLoginButton()
          ]),
        ),
      ),
    );
  }
}

class SignUpViewModel extends GetxController {
  Dio dio = appModule.get();

  bool get isPhoneValid => phone.value.length == 10;
  var phone = ''.obs;

  Future signup({
    required String phone,
    required Function(RegisterModel) success,
    required Function(String) error,
  }) async {
    var request = RegisterByPhoneRequest(phone: phone);

    try {
      var response =
          await dio.post('auth/signup/send-otp', data: request.toJson());

      RegisterByPhoneResponse registerByPhoneResponse =
          RegisterByPhoneResponse.fromJson(response.data);

      success(registerByPhoneResponse.result!);
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      error(errorResponse.message ?? "");
    }
  }
}
