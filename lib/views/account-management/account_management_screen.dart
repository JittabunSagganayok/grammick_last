import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:we_link/components/alert/saveProfileSuccess.dart';

import '../../constant/colosrConstants.dart';
import '../../constant/stylesConstants.dart';
import '../../di/app_module.dart';
import '../../feature/base/base_we_state.dart';
import '../../models/other/app_help_center_response.dart';
import '../main_screen.dart';

class AccountManagementScreen extends StatefulWidget {
  @override
  State<AccountManagementScreen> createState() =>
      _AccountManagementScreenState();
}

class _AccountManagementScreenState
    extends AppState<AccountManagementScreen, AccountManagementViewModel> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  @override
  AccountManagementViewModel initViewModel(
      AccountManagementViewModel viewModel) {
    return viewModel;
  }

  @override
  Widget onCreateView(
      BuildContext context, AccountManagementViewModel viewModel) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: blackColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          shape: appbarBorder,
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.only(left: 5),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset('assets/images/goBack.png'),
            ),
          ),
          title: Text(
            'Account management',
            style: titleWhiteAppbar,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: viewModel.listItem.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 16,
          color: Color(0xffEEEEEE),
        ),
        itemBuilder: (BuildContext context, int index) {
          final item = viewModel.listItem[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title ?? "",
                style: GoogleFonts.kanit(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xff1F2937)),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                item.description ?? "",
                style: GoogleFonts.kanit(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Color(0xff848282)),
              ),
              SizedBox(
                height: 8,
              ),
              CheckboxListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                controlAffinity: ListTileControlAffinity.leading,
                isThreeLine: false,
                value: item.isAccepted,
                title: Text(
                  item.checkboxTitle ?? "",
                  style: GoogleFonts.kanit(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Color(0xffF67416)),
                ),
                activeColor: Color(0xffF67416),
                onChanged: (bool? result) {
                  item.isAccepted = result;
                  viewModel.refresh();
                },
              )
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 48,
          width: MediaQuery.of(context).size.width * 1,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: yellowColor,
              textStyle: TextStyle(fontSize: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              side: BorderSide(
                width: 0.0,
                color: yellowColor,
              ),
            ),
            onPressed: () {
              showConfirmationUpdateJobDialog(confirm: () {
                navigator?.pop();
                showVerifyPinDialog(context,
                    opaque: false,
                    cancelButton: Container(
                      // margin: EdgeInsets.only(
                      //     bottom: 175, right: 30),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Kanit'),
                        semanticsLabel: 'Cancel',
                      ),
                    ));
              });
            },
            child: Text(
              'Delete',
              style: TextStyle(
                  color: Color(0xFF363636),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit'),
            ),
          ),
        ),
      ),
    );
  }

  void showConfirmationUpdateJobDialog({
    required Function confirm,
  }) {
    showDialog<Widget>(
        barrierDismissible: true,
        context: Get.context!,
        builder: (BuildContext context) {
          return Center(
              child: Container(
            margin: EdgeInsets.all(40),
            constraints: maxHeightContain,
            decoration: alertBoxDecoration,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(34, 25, 34, 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Are you sure?\nTo delete a user account',
                      style: turnOnTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Press the Confirm button\nif you are sure.',
                      textAlign: TextAlign.center,
                      style: turnOnTitle?.copyWith(
                        color: Color(0xff7E7E7E),
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Kanit',
                      ),
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    Container(
                      height: 45,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: yellowColor,
                          textStyle: TextStyle(fontSize: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          side: BorderSide(
                            width: 1,
                            color: Color(0xFFFDB824),
                          ),
                        ),
                        onPressed: () {
                          confirm?.call();
                        },
                        child: Text(
                          'Yes, Confirm',
                          style: turnOnCancelText?.copyWith(
                              color: Color(0xff363636)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 45,
                      child: TextButton(
                        onPressed: () {
                          navigator?.pop();
                        },
                        child: Text(
                          'Cancel',
                          style: turnOnText?.copyWith(color: Color(0xff363636)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
        });
  }

  showVerifyPinDialog(
    BuildContext context, {
    required bool opaque,
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
                return Column(
                  children: [
                    const Text(
                      'Verify PIN',
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
                      'Please specify verify pin for',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Kanit'),
                    ),
                    const Text(
                      'Delete your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Kanit'),
                    ),
                  ],
                );
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
        viewModel.currentPin = enteredPasscode;
        showDeleteAccountSuccess(context);
      });
    });
  }

  _onPasscodeCancelled() {
    viewModel.currentPin = '';
    _verificationNotifier.add(true);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }
}

class AccountManagementViewModel extends GetxController {
  var listItem = <AccountManagementModel>[].obs;
  HelpCenter? termAndCond;

  String? currentPin;

  @override
  void onInit() {
    super.onInit();
    listItem
      ..add(AccountManagementModel(
          title: 'Delete account',
          description:
              'Deleting your account will be permanent.\nRequest account deletion, you will not be able to recover content or data.\nthat you put in the system will be removed permanently.',
          checkboxTitle: 'Accept to terms & conditions',
          isAccepted: false))
      ..add(AccountManagementModel(
          title: 'Financial check',
          description:
              'Your account still has a wallet balance \nIf you delete your account The system will not refund to\nyour account',
          checkboxTitle: 'Accept',
          isAccepted: false))
      ..add(AccountManagementModel(
          title: 'Notification to email',
          description:
              'We will send an account deletion notification message to Email',
          checkboxTitle: 'Accept',
          isAccepted: false));

    getOtherConfig();
  }

  Future getOtherConfig() async {
    Dio dio = appModule.get();
    var response = await Future.wait([
      dio.get('admin/term-conditions?skip&take'),
    ]);

    var termAndCondResponse = AppHelpCenterResponse.fromJson(response[2].data);
    termAndCond = termAndCondResponse.result!;
  }
}

class AccountManagementModel {
  String? title;
  String? description;
  String? checkboxTitle;
  bool? isAccepted;
  String? htmlContent;

  AccountManagementModel({
    this.title,
    this.description,
    this.checkboxTitle,
    this.isAccepted,
    this.htmlContent,
  });
}
