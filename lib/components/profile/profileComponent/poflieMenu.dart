import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:we_link/components/profile/FAQ.dart';
import 'package:we_link/components/profile/contact.dart';
import 'package:we_link/components/profile/languae.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/controllers/profile_menu_controller.dart';
import 'package:we_link/components/profile/profileComponent/SwitchToStaff/view/select_department_screen.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/other/app_faq_response.dart';
import 'package:we_link/models/other/app_help_center_response.dart';
import 'package:we_link/models/profile/user_profile_response.dart';

import '../../../models/error/error_response.dart';
import '../../../views/account-management/account_management_screen.dart';
import '../../../views/content/web_content_screen.dart';
import '../../alert/successPassword.dart';

class ProfileMenuSection extends StatefulWidget {
  List<Faq> faq = [];
  HelpCenter policy;
  HelpCenter termAndCond;
  Profile profile;

  ProfileMenuSection(
    this.faq,
    this.policy,
    this.termAndCond,
    this.profile,
  );

  @override
  State<ProfileMenuSection> createState() => _ProfileMenuSectionState();
}

class _ProfileMenuSectionState
    extends AppState<ProfileMenuSection, ProfileMenuViewModel> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  @override
  ProfileMenuViewModel initViewModel(ProfileMenuViewModel viewModel) {
    viewModel.setNotificationToggle(widget?.profile);

    viewModel.changePasswordSuccess.listen((result) {
      if (result) {
        Get.to(const successPassword(changePIN: 'changePIN'));
      }
    });

    viewModel.changePasswordFailed.listen((message) {
      if (message.isNotEmpty) {
        Get.defaultDialog(
          title: 'Error',
          content: Text(message),
        );
      }
    });
    return viewModel;
  }

  final profileController = Get.put(ProfileMenuController());

  @override
  Widget onCreateView(BuildContext context, ProfileMenuViewModel viewModel) {
    return Obx(() {
      if (viewModel.loading.value) {
        return SizedBox(
          height: 0,
        );
      } else {
        return Container(
          constraints: maxHeightContain,
          width: MediaQuery.of(context).size.width * 1,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 15),
                  alignment: Alignment.topLeft,
                  child: const Text('My General',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                ),
                profileController.switchStaffFlag.isTrue
                    ? GestureDetector(
                        onTap: () => Get.to(
                          () => SelectDepartmentScreen(),
                          arguments: profileController.profileMenu,
                        ),
                        child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width * 1,
                            margin: const EdgeInsets.only(bottom: 9),
                            decoration: menuProfileDecoration,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    'assets/icons/switch_to_staff.png',
                                    fit: BoxFit.fill,
                                    height: 17,
                                    width: 17,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      child: Text.rich(
                                    TextSpan(
                                        text: "Switch to Staff",
                                        style: menuProfileText),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 12),
                                  child: Image.asset(
                                    'assets/images/next.png',
                                    fit: BoxFit.fill,
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                              ],
                            )),
                      )
                    : const SizedBox.shrink(),
                GestureDetector(
                  onTap: () {
                    _showLockScreen(context,
                        opaque: false,
                        cancelButton: Container(
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Kanit'),
                            semanticsLabel: 'Cancel',
                          ),
                        ));
                  },
                  child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 1,
                      margin: const EdgeInsets.only(bottom: 9),
                      decoration: menuProfileDecoration,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/pass.png',
                              fit: BoxFit.fill,
                              height: 17,
                              width: 17,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                child: Text.rich(
                              TextSpan(
                                  text: "Change PIN Password",
                                  style: menuProfileText),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ),
                          // Spacer(),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 12),
                            child: Image.asset(
                              'assets/images/next.png',
                              fit: BoxFit.fill,
                              height: 22,
                              width: 22,
                            ),
                          ),
                        ],
                      )),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => language()),
                //     );
                //   },
                //   child: Container(
                //       height: 45,
                //       width: MediaQuery.of(context).size.width * 1,
                //       margin: const EdgeInsets.only(bottom: 9),
                //       decoration: menuProfileDecoration,
                //       child: Row(
                //         children: [
                //           Container(
                //             margin: const EdgeInsets.all(10),
                //             child: Image.asset(
                //               'assets/images/lang.png',
                //               fit: BoxFit.fill,
                //               height: 17,
                //               width: 18,
                //             ),
                //           ),
                //           Expanded(
                //             child: Text.rich(
                //               TextSpan(
                //                   text: "Language", style: menuProfileText),
                //               maxLines: 2,
                //               overflow: TextOverflow.ellipsis,
                //             ),
                //           ),
                //           // Spacer(),
                //           Container(
                //             margin: const EdgeInsets.only(left: 10, right: 12),
                //             child: Image.asset(
                //               'assets/images/next.png',
                //               fit: BoxFit.fill,
                //               height: 22,
                //               width: 22,
                //             ),
                //           ),
                //         ],
                //       )),
                // ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 1,
                      margin: const EdgeInsets.only(bottom: 9),
                      decoration: menuProfileDecoration,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/noti.png',
                              fit: BoxFit.fill,
                              height: 17,
                              width: 18,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                child: Text.rich(
                              TextSpan(
                                  text: "Notifications",
                                  style: menuProfileText),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 22),
                            child: Obx(() => FlutterSwitch(
                                  width: 54.0,
                                  height: 22.0,
                                  toggleColor: Colors.white,
                                  switchBorder: Border.all(
                                    color: const Color(0xFFDBDBDB),
                                    width: 1.0,
                                  ),
                                  inactiveToggleColor: const Color(0xFFC4C4C4),
                                  activeColor: const Color(0xFF4DD15A),
                                  inactiveColor: const Color(0xFFE8E8E8),
                                  value: viewModel.toggleNotification.value,
                                  onToggle: (enable) {
                                    viewModel.toggleNotification.value = enable;
                                    viewModel.updateNotification();
                                  },
                                )),
                          ),
                        ],
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 22, bottom: 15),
                  alignment: Alignment.topLeft,
                  child: const Text('Help Center',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(WebContentScreen(),
                        arguments: WebContentParams(
                            title: 'Term & Condition',
                            textHtml: widget?.termAndCond?.description ?? ""));
                  },
                  child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 1,
                      margin: const EdgeInsets.only(bottom: 9),
                      decoration: menuProfileDecoration,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/term.png',
                              fit: BoxFit.fill,
                              height: 17,
                              width: 16,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                child: Text.rich(
                              TextSpan(
                                  text: "Term & Condition",
                                  style: menuProfileText),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ),
                          // Spacer(),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 12),
                            child: Image.asset(
                              'assets/images/next.png',
                              fit: BoxFit.fill,
                              height: 22,
                              width: 22,
                            ),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(WebContentScreen(),
                        arguments: WebContentParams(
                            title: 'Privacy Policy',
                            textHtml: widget?.policy?.description ?? ""));
                  },
                  child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 1,
                      margin: const EdgeInsets.only(bottom: 9),
                      decoration: menuProfileDecoration,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/poli.png',
                              fit: BoxFit.fill,
                              height: 17,
                              width: 16,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                child: Text.rich(
                              TextSpan(
                                  text: "Privacy Policy",
                                  style: menuProfileText),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ),
                          // Spacer(),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 12),
                            child: Image.asset(
                              'assets/images/next.png',
                              fit: BoxFit.fill,
                              height: 22,
                              width: 22,
                            ),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FAQScreen(widget.faq)),
                    );
                  },
                  child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 1,
                      margin: const EdgeInsets.only(bottom: 9),
                      decoration: menuProfileDecoration,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/help.png',
                              fit: BoxFit.fill,
                              height: 17,
                              width: 18,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                child: Text.rich(
                              TextSpan(text: "FAQ", style: menuProfileText),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ),
                          // Spacer(),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 12),
                            child: Image.asset(
                              'assets/images/next.png',
                              fit: BoxFit.fill,
                              height: 22,
                              width: 22,
                            ),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUsScreen()),
                    );
                  },
                  child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 1,
                      margin: const EdgeInsets.only(bottom: 9),
                      decoration: menuProfileDecoration,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/contact.png',
                              fit: BoxFit.fill,
                              height: 17,
                              width: 18,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                child: Text.rich(
                              TextSpan(
                                  text: "Contact Support",
                                  style: menuProfileText),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ),
                          // Spacer(),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 12),
                            child: Image.asset(
                              'assets/images/next.png',
                              fit: BoxFit.fill,
                              height: 22,
                              width: 22,
                            ),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(AccountManagementScreen());
                  },
                  child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 1,
                      margin: EdgeInsets.only(bottom: 9),
                      decoration: menuProfileDecoration,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/icons/ic_account_management.svg',
                              height: 17,
                              width: 16,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                child: Text.rich(
                                  TextSpan(
                                      text: "Account Management",
                                      style: menuProfileText),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 12),
                            child: Image.asset(
                              'assets/images/next.png',
                              fit: BoxFit.fill,
                              height: 22,
                              width: 22,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        );
      }
    });
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
              title: Builder(builder: (context) {
                if (viewModel.isConfirmPin == true) {
                  return const Text(
                    'Please Set a Confirm PIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit'),
                  );
                } else if (viewModel.isNewPin == true) {
                  return const Text(
                    'Please Set a New PIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit'),
                  );
                } else {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            child: InkWell(
                              onTap: () => Navigator.maybePop(context),
                              child: const Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.blue,
                              ),
                            )),
                      ),
                      const Text(
                        'Current Pin',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Please specify current pin for',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Kanit'),
                      ),
                      const Text(
                        'create new Pin password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Kanit'),
                      ),
                    ],
                  );
                }
              }),
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
              passwordEnteredCallback: (enteredPasscode) {
                _onPasscodeEntered(enteredPasscode, context);
              },
              cancelButton: cancelButton,
              deleteButton: const Text(
                'Delete',
                style: TextStyle(
                    fontSize: 16, color: Colors.white, fontFamily: 'Kanit'),
                semanticsLabel: 'Delete',
              ),
              shouldTriggerVerification: _verificationNotifier.stream,
              backgroundColor: Colors.black.withOpacity(0.4),
              cancelCallback: _onPasscodeCancelled,
              digits: digits,
              passwordDigits: 6,
              bottomWidget: Container(
                margin: const EdgeInsets.only(
                  bottom: 100.0,
                ),
              ),
            ),
          ),
        ));
  }

  _onPasscodeEntered(String enteredPasscode, BuildContext context) {
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (viewModel.isNewPin && viewModel.isConfirmPin == false) {
          viewModel.newPin = enteredPasscode;
          viewModel.isConfirmPin = true;
          _showLockScreen(context,
              opaque: false,
              cancelButton: Container(
                // margin: EdgeInsets.only(
                //     bottom: 175, right: 30),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, fontFamily: 'Kanit'),
                  semanticsLabel: 'Cancel',
                ),
              ));
        } else if (viewModel.isConfirmPin) {
          viewModel.confirmPin = enteredPasscode;

          await viewModel.changePin();

          Navigator.of(context).pop();
        } else {
          viewModel.currentPin = enteredPasscode;
          viewModel.isNewPin = true;
          viewModel.isConfirmPin = false;
          _showLockScreen(context,
              opaque: false,
              cancelButton: Container(
                // margin: EdgeInsets.only(
                //     bottom: 175, right: 30),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, fontFamily: 'Kanit'),
                  semanticsLabel: 'Cancel',
                ),
              ));
        }
      });
    });
  }

  _onPasscodeCancelled() {
    if (viewModel.isConfirmPin == true) {
      viewModel.isConfirmPin = false;
      viewModel.isNewPin = true;
      viewModel.confirmPin = '';
    } else if (viewModel.isNewPin == true) {
      viewModel.isNewPin = false;
      viewModel.isConfirmPin = false;
      viewModel.newPin = '';
      viewModel.confirmPin = '';
    } else {
      viewModel.isNewPin = false;
      viewModel.isConfirmPin = false;
      viewModel.currentPin = '';
      viewModel.newPin = '';
      viewModel.confirmPin = '';
    }
    _verificationNotifier.add(true);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }
}

class ProfileMenuViewModel extends GetxController {
  Dio dio;

  ProfileMenuViewModel(this.dio);

  var isConfirmPin = false;
  var isNewPin = false;
  var currentPin = '';
  var newPin = '';
  var confirmPin = '';
  var changePasswordSuccess = false.obs;
  var changePasswordFailed = ''.obs;

  var loading = false.obs;
  var toggleNotification = false.obs;

  void setNotificationToggle(Profile? profile) {
    loading.value = true;
    toggleNotification.value = profile?.notification ?? false;
    loading.value = false;
  }

  Future updateNotification() async {
    await dio.patch('users', data: {
      'notification': toggleNotification.value,
    });
  }

  Future changePin() async {
    try {
      changePasswordSuccess.value = false;
      changePasswordFailed.value = '';

      await dio.post('auth/change-pin', data: {
        "pin": currentPin,
        "newPin": newPin,
        "confirmNewPin": confirmPin
      });

      changePasswordSuccess.value = true;
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      changePasswordFailed.value = errorResponse.message ?? "";
    }
  }
}
