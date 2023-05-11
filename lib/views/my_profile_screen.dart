import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/components/alert/signOutAlert.dart';
import 'package:we_link/components/home/homeComponents/appBarComponent.dart';
import 'package:we_link/components/profile/profileComponent/menuRowProfile.dart';
import 'package:we_link/components/profile/profileComponent/poflieMenu.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/other/app_faq_response.dart';
import 'package:we_link/models/other/app_help_center_response.dart';
import 'package:we_link/views/auth/createProfile.dart';

import '../core/constants/key_constants.dart';
import '../helper/app_helper.dart';
import '../models/address/current_address_response.dart';
import '../models/address/my_address_response.dart';
import '../models/profile/user_profile_response.dart';
import '../models/wallet/my_wallet_response.dart';
import 'auth/splash_screen.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState
    extends AppState<MyProfileScreen, MyProfileViewModel> {
  @override
  MyProfileViewModel initViewModel(MyProfileViewModel viewModel) {
    viewModel.getProfile();
    viewModel.logoutSuccess.listen((success) {
      if (success) {
        Get.offAll(SplashScreen());
      }
    });
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, MyProfileViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: Obx(() => AppBar(
              backgroundColor: blackColor,
              automaticallyImplyLeading: false,
              elevation: 0,
              centerTitle: false,
              shape: appbarBorder,
              title: AppBarComponent(
                AppBarType.PROFILE,
                -1,
                viewModel.currentAddress.value,
              ),
            )),
      ),
      body: Obx(() {
        if (viewModel.loading.value) {
          return SizedBox(
              width: Get.width,
              height: Get.height,
              child: const Center(
                child: CircularProgressIndicator(
                  color: yellowColor,
                ),
              ));
        } else {
          return SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(CreateProfileScreen(type: CreateProfileType.EDIT))
                        ?.then((value) async {
                      await viewModel.getProfile();
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    constraints: maxHeightContain,
                    decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(21),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(17, 5, 17, 5),
                      child: Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(right: 10, top: 18, bottom: 19),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  viewModel.userProfile.value.picture ?? ""),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text.rich(
                                  TextSpan(
                                      text:
                                          "${viewModel.userProfile.value.name ?? ""} ${viewModel.userProfile.value.lastname ?? ""}\n",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Kanit'),
                                      children: [
                                        TextSpan(
                                            text: "Edit My Profile",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Kanit'))
                                      ]),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15, top: 13),
                            child: Image.asset(
                              'assets/images/next1.png',
                              fit: BoxFit.fill,
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                menuRowProfile(
                  viewModel.userProfile.value,
                  viewModel.myBalance.value,
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileMenuSection(
                  viewModel.faq.value,
                  viewModel.policy.value,
                  viewModel.termAndCond.value,
                  viewModel.userProfile.value,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => signOutAlert(context, onClickConfirm: () {
                    navigator?.pop();
                    viewModel.signout();
                  }),
                  child: Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width * 1,
                      margin: EdgeInsets.only(bottom: 20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 22, right: 16),
                            child: Image.asset(
                              'assets/images/logOut.png',
                              fit: BoxFit.fill,
                              height: 17,
                              width: 20,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                child: Text.rich(
                              TextSpan(
                                  text: "Sign out", style: menuProfileText),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ));
        }
      }),
    );
  }
}

class MyProfileViewModel extends GetxController {
  Dio dio;

  MyProfileViewModel(this.dio);

  var logoutSuccess = false.obs;
  var loading = false.obs;
  var myBalance = 0.0.obs;

  var userProfile = Profile().obs;
  var myAddress = AddressResponse().obs;
  var currentAddress = AddressResponse().obs;

  var faq = <Faq>[].obs;
  var policy = HelpCenter().obs;
  var termAndCond = HelpCenter().obs;

  Future getProfile() async {
    loading.value = true;

    var response = await Future.wait([
      dio.get('auth/profile'),
      dio.get('wallets/balance'),
      dio.get('address/current'),
      dio.get('admin/faqs?skip&take'),
      dio.get('admin/privacy-policys?skip&take'),
      dio.get('admin/term-conditions?skip&take'),
    ]);

    var userProfileResponse = UserProfileResponse.fromJson(response[0].data);
    userProfile.value = userProfileResponse.result!;

    var myWalletResponse = MyWalletResponse.fromJson(response[1].data);
    myBalance.value = myWalletResponse.result ?? 0.0;

    var myAddressResponse = CurrentAddressResponse.fromJson(response[2].data);
    myAddress.value = myAddressResponse.result ?? AddressResponse();

    var faqResponse = AppFaqResponse.fromJson(response[3].data);
    faq.value = faqResponse.result ?? [];

    var policyResponse = AppHelpCenterResponse.fromJson(response[4].data);
    policy.value = policyResponse.result!;

    var termAndCondResponse = AppHelpCenterResponse.fromJson(response[5].data);
    termAndCond.value = termAndCondResponse.result!;

    var data = await getCurrentLocation();
    currentAddress.value = data;

    loading.value = false;
  }

  Future signout() async {
    await dio.delete(
      'auth/signout',
    );

    appStorage.writeInMemory(KEY_ACCESS_TOKEN, "");
    appStorage.writeInMemory(KEY_REFRESH_TOKEN, "");
    appStorage.writeInMemory(KEY_USER_DETAIL, null);
    await appStorage.erase();
    await appStorage.save();

    logoutSuccess.value = true;
  }
}
