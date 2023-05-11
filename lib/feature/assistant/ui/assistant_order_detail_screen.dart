import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:we_link/feature/assistant/ui/assistant_confirm_order_screen.dart';
import 'package:we_link/feature/base/base_we_state.dart';

import '../../../components/home/weLinkComponents/rideComponents/searchLocation.dart';
import '../../../constant/colosrConstants.dart';
import '../../../constant/stylesConstants.dart';
import '../data/assistant_request.dart';
import 'assistant_order_detail_viewmodel.dart';
import 'assistant_recipient_screen.dart';

class AssistantOrderDetailScreen extends StatefulWidget {
  @override
  State<AssistantOrderDetailScreen> createState() =>
      _AssistantOrderDetailScreenState();
}

class _AssistantOrderDetailScreenState extends AppState<
    AssistantOrderDetailScreen, AssistantOrderDetailViewModel> {
  var productPriceTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  AssistantOrderDetailViewModel initViewModel(
      AssistantOrderDetailViewModel viewModel) {
    var params = Get.arguments as AssistantRequest;
    viewModel.setParams(params);
    return viewModel;
  }

  @override
  Widget onCreateView(
    BuildContext context,
    AssistantOrderDetailViewModel viewModel,
  ) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: appBackgroundColor,
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
              'Order Detail',
              style: titleYellowAppbar,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
                        'Start point',
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
                                'assets/icons/ic_we_fix_start_point.svg'),
                            trailing:
                                SvgPicture.asset('assets/icons/ic_next.svg'),
                            title: Text(
                              viewModel.pickUpAddress.value.name ?? "",
                              style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff4B4B4B)),
                            ),
                            subtitle: Text(
                              viewModel.pickUpAddress.value.address ?? "",
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
                        'List',
                        style: GoogleFonts.kanit(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Obx(() => ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            itemCount: viewModel.assistantItem.length,
                            separatorBuilder: (BuildContext context, int index) =>
                                const Divider(
                              height: 16,
                              color: Colors.transparent,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final item = viewModel.assistantItem[index];
                              return Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: TextFieldBorder(
                                      controller: item.product,
                                      hint: 'Max 1k',
                                      focusNode: item.focusNode,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: TextFieldBorder(
                                      focusNode: item.focusNode,
                                      controller: item.amount,
                                      hint: '1 piece',
                                      inputType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              );
                            },
                          )),
                      TextButton(
                          onPressed: () {
                            viewModel.addMoreProduct();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                color: Color(0xffFDCD03),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'More List',
                                style: GoogleFonts.kanit(
                                    color: Color(0xffFDCD03),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Estimated product price',
                        style: GoogleFonts.kanit(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Specify the amount so the driver has the money ready.',
                        style: GoogleFonts.kanit(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff4B4B4B)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldBorder(
                        controller: productPriceTextController,
                        focusNode: FocusNode(),
                        hint: 'Max 1k',
                        inputType: TextInputType.numberWithOptions(decimal: true),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'The price of the product does not include payment on delivery.',
                        style: GoogleFonts.kanit(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff4B4B4B)),
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
                  if (_formKey.currentState!.validate()) {
                    Get.to(AssistantConfirmOrderScreen(),
                        arguments: viewModel.createRequest(
                          productPriceTextController.text,
                        ));
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
