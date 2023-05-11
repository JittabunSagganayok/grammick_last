import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:we_link/feature/assistant/data/assistant_request.dart';
import 'package:we_link/feature/base/base_we_state.dart';

import '../../../components/home/weLinkComponents/rideComponents/searchLocation.dart';
import '../../../constant/colosrConstants.dart';
import '../../../constant/stylesConstants.dart';
import 'assistant_confirm_order_screen.dart';
import 'assistant_order_detail_screen.dart';
import 'assistant_recipient_viewmodel.dart';

class AssistantRecipientScreen extends StatefulWidget {
  @override
  State<AssistantRecipientScreen> createState() =>
      _AssistantRecipientScreenState();
}

class _AssistantRecipientScreenState
    extends AppState<AssistantRecipientScreen, AssistantRecipientViewModel> {
  var formKey = GlobalKey<FormState>();

  var usernameController = TextEditingController();
  var phoneController = TextEditingController();
  var moreDetailController = TextEditingController();

  @override
  AssistantRecipientViewModel initViewModel(
    AssistantRecipientViewModel viewModel,
  ) {
    var params = Get.arguments as AssistantRequest;
    viewModel.setParams(params);

    moreDetailController.addListener(() {
      if (moreDetailController.text.isNotEmpty == true) {
        viewModel.assistantRequest?.moreDetail  = moreDetailController.text;
      }
    });

    if (viewModel.assistantRequest?.isWeFixOrder == true) {
      moreDetailController.text = viewModel.assistantRequest?.moreDetail ?? "";
    }
    return viewModel;
  }

  @override
  Widget onCreateView(
      BuildContext context, AssistantRecipientViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
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
                onPressed: () async {
                  navigator?.pop();
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            title: Text(
              'About Recipient',
              style: titleYellowAppbar,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 16,
                  color: appBackgroundColor,
                ),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.assistantRequest?.isWeFixOrder == true
                            ? 'Home'
                            : 'Sent point',
                        style: GoogleFonts.kanit(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Obx(() => ListTile(
                            onTap: () {
                              Get.to(SearchLocationScreen(
                                searchLocationBy: SearchLocationBy.RENT,
                                onSelectAddress: (
                                  pickUpAddress,
                                  destinationAddress,
                                ) {
                                  viewModel.setupNewAddress(pickUpAddress);
                                },
                              ));
                            },
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 0,
                            ),
                            leading: SvgPicture.asset(
                                'assets/icons/ic_we_fix_destination.svg'),
                            trailing:
                                SvgPicture.asset('assets/icons/ic_next.svg'),
                            title: Text(
                              viewModel.destinationAddress.value.name ?? "",
                              style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff4B4B4B)),
                            ),
                            subtitle: Text(
                              viewModel.destinationAddress.value.address ?? "",
                              style: GoogleFonts.kanit(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffACACAC)),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 16,
                  color: appBackgroundColor,
                ),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail',
                        style: GoogleFonts.kanit(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldBorder(
                        controller: usernameController,
                        prefixIcon: 'assets/icons/ic_username.svg',
                        hint: 'Add new name',
                        focusNode: FocusNode(),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldBorder(
                        controller: phoneController,
                        prefixIcon: 'assets/icons/ic_phone.svg',
                        hint: 'Phone',
                        inputType: TextInputType.phone,
                        focusNode: FocusNode(),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        'More Detail',
                        style: GoogleFonts.kanit(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldBorder(
                        controller: moreDetailController,
                        hint: 'Add description more',
                        maxLine: 5,
                        focusNode: FocusNode(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            height: 80,
            child: Container(
              height: 56,
              padding: EdgeInsets.all(16),
              width: Get.width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: yellowColor,
                  textStyle: TextStyle(fontSize: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  side: BorderSide(
                    width: 0.0,
                    color: yellowColor,
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.to(
                      viewModel.assistantRequest?.isWeFixOrder == true
                          ? AssistantConfirmOrderScreen()
                          : AssistantOrderDetailScreen(),
                      arguments: viewModel.createRequest(
                        usernameController.text,
                        phoneController.text,
                        moreDetailController.text,
                      ),
                    );
                  }
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      color: Color(0xFF363636),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldBorder extends StatelessWidget {
  TextEditingController? controller;
  String? prefixIcon;
  String? suffixIcon;
  String? hint;
  int? maxLine;
  TextInputType? inputType;
  FocusNode? focusNode;

  TextFieldBorder({
    required this.focusNode,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.hint,
    this.maxLine = 1,
    this.inputType,
  });

  KeyboardActionsConfig _buildKeyboardConfig(
    BuildContext context,
    FocusNode focusNode,
  ) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: focusNode,
          toolbarButtons: [
            (node) {
              return GestureDetector(
                onTap: () {
                  node.unfocus();
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: const Text(
                    "DONE",
                    style: TextStyle(color: yellowColor),
                  ),
                ),
              );
            }
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Color(
          0xffFBFBFB,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1,
          color: Color(
            0xffEDEDED,
          ),
        ),
      ),
      child: Row(
        children: [
          if (prefixIcon?.isNotEmpty == true) ...[
            SvgPicture.asset(
              prefixIcon ?? "",
              width: 22,
              height: 22,
            )
          ],
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: prefixIcon != null ? 16 : 0,
                right: suffixIcon != null ? 16 : 0,
              ),
              child: TextFormField(
                controller: controller,
                maxLines: maxLine,
                keyboardType: inputType ?? TextInputType.text,
                validator: (text) {
                  if (text?.isEmpty == true) {
                    return 'กรุณาระบุข้อมูล';
                  }
                },
                style: GoogleFonts.kanit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(
                    0xff4B4B4B,
                  ),
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint ?? '',
                    hintStyle: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffA7A7A7))),
              ),
            ),
          ),
          if (suffixIcon?.isNotEmpty == true) ...[
            SvgPicture.asset(
              suffixIcon ?? "",
              width: 22,
              height: 22,
            )
          ],
        ],
      ),
    );
  }
}
