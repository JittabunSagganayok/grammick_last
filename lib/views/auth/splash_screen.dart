//POOH ADDING MARKETPLACE IN THIS

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/views/auth/introduction_screen.dart';

import '../../core/constants/key_constants.dart';
import '../../models/signin/pin/signin_by_pin_response.dart';
import '../main_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends AppState<SplashScreen, SplashViewModel> {
  @override
  SplashViewModel initViewModel(SplashViewModel viewModel) {
    var accessToken = appStorage.read(KEY_ACCESS_TOKEN) ?? '';
    if (accessToken.isEmpty == true) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(
            context,
            //MaterialPageRoute(builder: (context) => MainScreen()));
            MaterialPageRoute(builder: (context) => IntroductionScreen()));
      });
    } else {
      viewModel.refreshToken();
      viewModel.refreshTokenSuccess.listen((success) {
        if (success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        } else {
          Navigator.pushReplacement(
              context,
              //MaterialPageRoute(builder: (context) => MainScreen()));
              MaterialPageRoute(builder: (context) => IntroductionScreen()));
        }
      });
    }
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, SplashViewModel viewModel) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ExtendedImage.asset(
          'assets/splash.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SplashViewModel extends GetxController {
  Dio dio;

  SplashViewModel(this.dio);

  var refreshTokenSuccess = false.obs;

  Future refreshToken() async {
    try {
      var response = await dio.post('auth/refresh');
      var data = SigninByPinResponse.fromJson(response.data);
      var result = data.result;

      appStorage.writeInMemory(KEY_ACCESS_TOKEN, result?.accessToken ?? "");
      appStorage.writeInMemory(KEY_REFRESH_TOKEN, result?.refreshToken ?? "");
      appStorage.writeInMemory(KEY_USER_DETAIL, result?.user);
      await appStorage.save();

      refreshTokenSuccess.value = true;
    } catch (e) {
      refreshTokenSuccess.value = false;
    }
  }
}
