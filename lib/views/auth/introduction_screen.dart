import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/components/auth/selectLanguage.dart';
import 'package:we_link/components/guid/slideDots.dart';
import 'package:we_link/components/guid/slideItems.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/introduction/introduction_response.dart';
import 'package:we_link/views/auth/signin_screen.dart';
import 'package:we_link/views/auth/signup_screen.dart';
import 'package:we_link/views/auth/term_cond_screen.dart';

import '../../feature/booking/ui/components/booking_service_info_section.dart';
import '../../feature/term/ui/term_and_cond_screen.dart';

class IntroductionScreen extends StatefulWidget {
  IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState
    extends AppState<IntroductionScreen, IntroductionViewModel> {
  _onPageChanged(int index) {
    viewModel.currentPage.value = index;
  }

  @override
  IntroductionViewModel initViewModel(IntroductionViewModel viewModel) {
    viewModel.getIntroduction();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, IntroductionViewModel viewModel) {
    return Scaffold(
      backgroundColor: yellowColor,
      extendBodyBehindAppBar: true,
      body: Obx(() {
        if (viewModel.loading.value) {
          return Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.81,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: const BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(43),
                        bottomRight: Radius.circular(43)),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: viewModel.pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: viewModel.introductionList.length,
                        itemBuilder: (ctx, i) =>
                            slideItems(viewModel.introductionList[i]),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            margin: const EdgeInsets.only(top: 70),
                            child: selectLanguage()),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 55),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0;
                                    i < viewModel.introductionList.length;
                                    i++)
                                  if (i == viewModel.currentPage.value)
                                    slideDots(true)
                                  else
                                    slideDots(false)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 1,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.white,
                                  textStyle: const TextStyle(fontSize: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()),
                                  );
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Kanit'),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 1,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: blackColor,
                                  textStyle: const TextStyle(fontSize: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignInScreen()),
                                  );
                                },
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: yellowColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Kanit'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          );
        }
      }),
    );
  }
}

class IntroductionViewModel extends GetxController {
  Dio dio = appModule.get();

  final PageController pageController = PageController(initialPage: 0);

  var loading = false.obs;
  var introductionList = <IntroductionList>[].obs;

  var currentPage = 0.obs;

  Timer? timer;

  Future getIntroduction() async {
    loading.value = true;

    var response = await dio.get('introductions');
    IntroductionResponse introductionResponse =
        IntroductionResponse.fromJson(response.data);
    introductionList.value = introductionResponse.result ?? [];

    // timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
    //   if (currentPage < introductionList.length) {
    //     currentPage.value++;
    //   } else {
    //     currentPage.value = 0;
    //   }
    //
    //   pageController.animateToPage(
    //     currentPage.value,
    //     duration: Duration(milliseconds: 300),
    //     curve: Curves.easeIn,
    //   );
    // });

    loading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
    timer?.cancel();
  }
}
