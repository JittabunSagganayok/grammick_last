import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/review.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/promotion.dart';
import 'package:we_link/feature/assistant/data/assistant_request.dart';
import 'package:we_link/feature/base/base_we_state.dart';

import '../../../components/home/weLinkComponents/rideComponents/callCar/loadCallCar.dart';
import '../../../components/home/weLinkComponents/rideComponents/paymentCallCar.dart';
import '../../../constant/colosrConstants.dart';
import '../../../constant/stylesConstants.dart';
import '../../../shared/loading/loading_fullscreen.dart';
import '../../coupon/coupon_response.dart';
import 'assistant_confirm_order_viewmodel.dart';

class AssistantConfirmOrderScreen extends StatefulWidget {
  @override
  State<AssistantConfirmOrderScreen> createState() =>
      _AssistantConfirmOrderScreenState();
}

class _AssistantConfirmOrderScreenState extends AppState<
    AssistantConfirmOrderScreen, AssistantConfirmOrderViewModel> {
  @override
  AssistantConfirmOrderViewModel initViewModel(
      AssistantConfirmOrderViewModel viewModel) {
    if (Get.arguments is AssistantRequest) {
      viewModel.setArguments(Get.arguments);
    }

    viewModel.getShippingCost();

    viewModel.createOrderSuccess.listen((success) {
      if (success) {
        navigator?.pop();
        Get.to(PendingDriverAcceptScreen());
      }
    });

    viewModel.paymentError.listen((result) {
      if (result == true) {
        navigator?.pop();
      }
    });

    viewModel.createOrderFailed.listen((message) {
      if (message.isNotEmpty) {
        navigator?.pop();
        Get.defaultDialog(
          title: 'Error',
          content: Text(message),
        );
      }
    });
    return viewModel;
  }

  @override
  Widget onCreateView(
    BuildContext context,
    AssistantConfirmOrderViewModel viewModel,
  ) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            shape: appbarBorder,
            leading: Container(
              margin: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            centerTitle: true,
            title: Text(
              'Check details',
              style: titleYellowAppbar,
            ),
          ),
        ),
        body: Obx(() {
          if (viewModel.loading.value == true) {
            return LoadingFullscreen();
          } else {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                    constraints: maxHeightContain,
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 12),
                    // padding: EdgeInsets.fromLTRB(30, 21, 30, 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 21, 30, 0),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Text("Order : ",
                                                  style: fieldSearchHintText)),
                                          Container(
                                            margin: EdgeInsets.only(left: 9),
                                            padding:
                                                EdgeInsets.fromLTRB(9, 6, 9, 6),
                                            decoration: typeButton,
                                            child: Text(
                                              "We Assistant",
                                              style: typeTText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text("", style: fieldSearchHintText),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Color(0xFFE6E6E6),
                                thickness: 1,
                              ),
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin:
                                        EdgeInsets.only(bottom: 15, top: 18),
                                    child: Text(
                                      'Destination',
                                      style: inforTitleText,
                                    ),
                                  ),
                                  ListView.separated(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    itemCount:
                                        viewModel.addressList.value.length,
                                    primary: false,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final item = viewModel.addressList.value[index];
                                      return ItemDestination(item);
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            Divider(
                                      height: 16,
                                      indent: 40,
                                    ),
                                  ),
                                  Builder(builder: (context) {
                                    if (viewModel
                                            .assistantRequest?.isWeFixOrder ==
                                        true) {
                                      return SizedBox(
                                        height: 0,
                                      );
                                    }
                                    return Container(
                                      margin:
                                          EdgeInsets.only(bottom: 15, top: 18),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Total Distance',
                                              style: inforTitleText,
                                            ),
                                          ),
                                          Text(
                                            '${viewModel?.shippingCost?.value?.distance ?? "0"}km',
                                            style: distanceText,
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                  Divider(
                                    color: Color(0xFFE6E6E6),
                                    thickness: 1,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Builder(builder: (context) {
                            if (viewModel.assistantRequest?.isWeFixOrder ==
                                true) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Detail order',
                                    style: inforTitleText,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(12),
                                          child: SvgPicture.asset(
                                            'assets/icons/ic_service_category.svg',
                                            width: 16,
                                            height: 16,
                                          )),
                                      Expanded(
                                        child: Container(
                                            child: Text.rich(
                                          TextSpan(
                                            text: viewModel.assistantRequest
                                                    ?.serviceCategory?.name ??
                                                "",
                                            style: bottomReviewText,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(12),
                                          child: SvgPicture.asset(
                                            'assets/icons/ic_fix_more_detail.svg',
                                            width: 16,
                                            height: 16,
                                          )),
                                      Expanded(
                                        child: Container(
                                            child: Text.rich(
                                          TextSpan(
                                            text: viewModel.assistantRequest
                                                    ?.moreDetail ??
                                                "",
                                            style: bottomReviewText,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 16),
                                    height: 56,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              Divider(
                                        indent: 8,
                                        endIndent: 8,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final filePath = viewModel
                                            .assistantRequest
                                            ?.weFixImage?[index];
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: ExtendedImage.file(
                                            File(filePath ?? ""),
                                            width: 64,
                                            height: 64,
                                            border: Border.all(
                                                width: 1,
                                                color: Color(0xffF9AC12)),
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                      itemCount: viewModel.assistantRequest
                                              ?.weFixImage?.length ??
                                          0,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Divider(
                                    color: Color(0xFFE6E6E6),
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Text(
                                    'Offer',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'The price you set',
                                    style: GoogleFonts.inter(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFF855E)),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '${viewModel?.assistantRequest?.offerPrice ?? ""} THB',
                                    style: GoogleFonts.kanit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff303030)),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Divider(
                                    color: Color(0xFFE6E6E6),
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                ],
                              );
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Detail order',
                                  style: inforTitleText,
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  primary: false,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  itemCount: viewModel
                                          .assistantRequest?.items?.length ??
                                      0,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          Divider(
                                    height: 16,
                                    color: Colors.transparent,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final item = viewModel
                                        .assistantRequest?.items?[index];
                                    return ListTile(
                                      leading: Text(
                                        item?.product.text ?? "",
                                        style: GoogleFonts.kanit(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      trailing: Text(
                                        'x${item?.amount.text ?? ""}',
                                        style: GoogleFonts.kanit(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Color(0xffE8F9E8),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          width: 1, color: Color(0xffBCDECC))),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Estimate price',
                                        style: GoogleFonts.kanit(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff22A876)),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        '${viewModel.assistantRequest?.estimatePrice ?? ""}฿',
                                        style: GoogleFonts.kanit(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff22A876)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Divider(
                                  color: Color(0xFFE6E6E6),
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  'More detail',
                                  style: inforTitleText,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  viewModel.assistantRequest?.moreDetail ?? "",
                                  style: GoogleFonts.kanit(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Divider(
                                  color: Color(0xFFE6E6E6),
                                  thickness: 1,
                                ),
                              ],
                            );
                          }),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment method',
                                style: inforTitleText,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 45,
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      decoration: BoxDecoration(
                                        color: yellowColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        boxShadow: [payMentShadow],
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: InkWell(
                                          onTap: () async {
                                            var result = await Get.to(
                                                PaymentMethodScreen(
                                              paymentSelected:
                                                  viewModel.paymentMethod.value,
                                            ));
                                            if (result != null) {
                                              viewModel.setPaymentSelected(
                                                  result['image'].toString(),
                                                  result['name'].toString());
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                child: Obx(
                                                  () => Image.asset(
                                                    viewModel
                                                        .paymentImage.value,
                                                    height: 24,
                                                    width: 24,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Obx(
                                                  () => Container(
                                                      child: Text.rich(
                                                    TextSpan(
                                                      text: viewModel
                                                          .paymentMethod.value,
                                                      style: paymentText,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, right: 5),
                                                child: Image.asset(
                                                  'assets/images/nx.png',
                                                  fit: BoxFit.fill,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: Obx(() {
                                      if (viewModel.couponSelected.value.id ==
                                          null) {
                                        return SizedBox(
                                          height: 45,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          child: OutlinedButton(
                                              style: paymentOutlined,
                                              onPressed: () async {
                                                var result = await Get.to(
                                                    PromotionScreen());
                                                if (result != null &&
                                                    result is Coupon) {
                                                  viewModel.couponSelected
                                                      .value = result;
                                                  viewModel.couponId =
                                                      result.id ?? -1;
                                                }
                                              },
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                        child: Text.rich(
                                                      TextSpan(
                                                        text: "เลือกคูปอง",
                                                        style: paymentText
                                                            ?.copyWith(
                                                                fontSize: 13),
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5, right: 5),
                                                    child: Image.asset(
                                                      'assets/images/nx.png',
                                                      fit: BoxFit.fill,
                                                      height: 18,
                                                      width: 18,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        );
                                      } else {
                                        return SizedBox(
                                          height: 45,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          child: OutlinedButton(
                                              style: codePromoOutlined,
                                              onPressed: () async {
                                                var result = await Get.to(
                                                    PromotionScreen());
                                                if (result != null &&
                                                    result is Coupon) {
                                                  viewModel.couponSelected
                                                      .value = result;
                                                  viewModel.couponId =
                                                      result.id ?? -1;
                                                }
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5),
                                                    child: Image.asset(
                                                      'assets/images/wallet1.png',
                                                      fit: BoxFit.fill,
                                                      height: 24,
                                                      width: 24,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                        child: Text.rich(
                                                      TextSpan(
                                                        text: viewModel
                                                                .couponSelected
                                                                .value
                                                                .name ??
                                                            "",
                                                        style: codePromoText,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5, right: 5),
                                                    child: Image.asset(
                                                      'assets/images/nx1.png',
                                                      fit: BoxFit.fill,
                                                      height: 18,
                                                      width: 18,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        );
                                      }
                                    }),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          color: Colors.grey[300]!,
                          spreadRadius: 8)
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'The price of the product does not\ninclude payment on delivery.',
                            style: GoogleFonts.kanit(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff4B4B4B)),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 1,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: yellowColor,
                              textStyle: TextStyle(fontSize: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              side: BorderSide(
                                width: 0.0,
                                color: yellowColor,
                              ),
                            ),
                            onPressed: () async {
                              Get.dialog(LoadingFullscreen(
                                backgroundColor: Colors.black45,
                              ));

                              await viewModel.createOrder();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Confirm',
                                  style: selectsCarTextButton,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '(offer & shipping)',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff060606),
                                            fontFamily: 'Kanit'),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Builder(
                                        builder: (context) {
                                          var shippingCost  = viewModel.shippingCost.value.cost;
                                          var offerPrice = num.tryParse(viewModel.assistantRequest?.offerPrice ?? "0") ?? 0;
                                          num total = (shippingCost?.roundToDouble() ?? 0) + offerPrice.roundToDouble();
                                          return Text(
                                              "${total.toStringAsFixed(2)} ฿",
                                              style: priceTotalText.copyWith(fontWeight: FontWeight.w600));
                                        }
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        }));
  }
}
