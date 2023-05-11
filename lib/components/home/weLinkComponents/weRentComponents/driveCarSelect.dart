import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/selectTime.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/paymentCallCar.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/promotion.dart';
import 'package:we_link/components/home/weLinkComponents/weRent.dart';
import 'package:we_link/components/home/weLinkComponents/weRentComponents/planToGo.dart';
import 'package:we_link/components/home/weLinkComponents/weRentComponents/rentPackage.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/core/domain/get_link_payment_usecase.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_we_state.dart';

import '../../../../feature/coupon/coupon_response.dart';
import '../../../../models/address/add_new_address_request.dart';
import '../../../../models/address/add_new_address_response.dart';
import '../../../../models/error/error_response.dart';
import '../../../../models/we_ride/create_we_ride_order_request.dart';
import '../../../../models/we_ride/create_we_ride_order_response.dart';
import '../../../../shared/loading/loading_fullscreen.dart';
import '../../../profile/myWalletComponent/payment_webview.dart';
import '../rideComponents/callCar/loadCallCar.dart';

class ConfirmWeRentScreen extends StatefulWidget {
  WeRentRequest? request;

  ConfirmWeRentScreen(this.request);

  @override
  State<ConfirmWeRentScreen> createState() => _ConfirmWeRentScreenState();
}

class _ConfirmWeRentScreenState
    extends AppState<ConfirmWeRentScreen, ConfirmWeRentViewModel> {
  @override
  ConfirmWeRentViewModel initViewModel(ConfirmWeRentViewModel viewModel) {
    viewModel.init(widget.request);

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
  Widget onCreateView(BuildContext context, ConfirmWeRentViewModel viewModel) {
    return Container(
      constraints: maxHeightContain,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 15, color: Colors.grey[300]!, spreadRadius: 8)
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 20, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 16,
            // ),
            SelectTimeWidget(chooseDateTime: (dateTime) {}),
            SizedBox(
              height: 21,
            ),
            Container(
                height: 43,
                margin: EdgeInsets.only(right: 20, bottom: 15),
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    )),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                      child: Image.asset(
                        'assets/images/loca.png',
                        fit: BoxFit.fill,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          child: Obx(() => Text.rich(
                                TextSpan(
                                    text: viewModel.weRentRequest.value
                                        .pickUpAddress?.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Kanit')),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ))),
                    ),
                  ],
                )),
            GestureDetector(
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RentPackageScreen()),
                );
              },
              // onTap: () => howLong(context),
              child: Container(
                  height: 43,
                  margin: EdgeInsets.only(right: 20, bottom: 15),
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      )),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(12),
                        child: Image.asset(
                          'assets/images/time.png',
                          fit: BoxFit.fill,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Expanded(
                        child: Obx(() => Text(
                              viewModel.name.value.isEmpty == true
                                  ? viewModel.weRentRequest.value
                                          ?.packageSelected?.title ??
                                      ""
                                  : '${viewModel.name.value} - ${viewModel.weRentRequest.value?.rentDuration} days',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Kanit'),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () => planToGo(context),
              child: Container(
                  height: 43,
                  margin: EdgeInsets.only(right: 20, bottom: 15),
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      )),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(12),
                        child: Image.asset(
                          'assets/images/map1.png',
                          fit: BoxFit.fill,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: Obx(() => Text.rich(
                                  TextSpan(
                                      text: viewModel.weRentRequest?.value
                                              ?.planYouGo ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Kanit')),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ))),
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                'Payment',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF9D9E9B),
                    fontFamily: 'Kanit'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [payMentShadow],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: InkWell(
                          onTap: () async {
                            var result = await Get.to(PaymentMethodScreen(
                              paymentSelected: viewModel.paymentMethod.value,
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
                                margin: EdgeInsets.only(right: 5),
                                child: Obx(
                                  () => Image.asset(
                                    viewModel.paymentImage.value,
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
                                      text: viewModel.paymentMethod.value,
                                      style: paymentText,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 5),
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
                      if (viewModel.couponSelected.value.id == null) {
                        return SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 1,
                          child: OutlinedButton(
                              style: paymentOutlined,
                              onPressed: () async {
                                var result = await Get.to(PromotionScreen());
                                if (result != null && result is Coupon) {
                                  viewModel.couponSelected.value = result;
                                  viewModel.couponId = result.id ?? -1;
                                }
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        child: Text.rich(
                                      TextSpan(
                                        text: "เลือกคูปอง",
                                        style:
                                            paymentText?.copyWith(fontSize: 13),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
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
                          width: MediaQuery.of(context).size.width * 1,
                          child: OutlinedButton(
                              style: codePromoOutlined,
                              onPressed: () async {
                                var result = await Get.to(PromotionScreen());
                                if (result != null && result is Coupon) {
                                  viewModel.couponSelected.value = result;
                                }
                              },
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
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
                                                .couponSelected.value.name ??
                                            "",
                                        style: codePromoText,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
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
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 45,
              margin: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width * 1,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Color(0xFFF4F4F4),
                    textStyle: TextStyle(fontSize: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    side: BorderSide(
                      width: 0.0,
                      color: Color(0xFFF4F4F4),
                    ),
                  ),
                  // onPressed: () => addAddressSuccess(context),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            child: Text.rich(
                          TextSpan(
                            text: "Total",
                            style: TextStyle(
                                color: yellowColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Kanit'),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ),
                      // Spacer(),
                      Obx(() => Container(
                          margin: EdgeInsets.only(left: 10, right: 5),
                          child: Text(
                            "${viewModel.totalCost.value} ฿",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Kanit'),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ))),
                    ],
                  )),
            ),
            SizedBox(height: 40),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width * 1,
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
                onPressed: () async {
                  await viewModel.createOrder();
                },
                child: Text(
                  'Book Now',
                  style: TextStyle(
                      color: Color(0xFF363636),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmWeRentViewModel extends GetxController {
  Dio dio;
  GetLinkPaymentUseCaseImpl _getLinkPaymentUseCaseImpl;

  ConfirmWeRentViewModel(
    this.dio,
    this._getLinkPaymentUseCaseImpl,
  );

  var weRentRequest = WeRentRequest().obs;

  var paymentMethod = 'CASH'.obs;
  var paymentImage = 'assets/images/money.png'.obs;

  var createOrderSuccess = false.obs;
  var paymentError = false.obs;
  var createOrderFailed = ''.obs;

  var couponSelected = Coupon().obs;
  num? couponId;

  var totalCost = 0.0.obs;
  var name = ''.obs;

  void init(
    WeRentRequest? request,
  ) {
    weRentRequest.value = request!;

    name.value = weRentRequest.value?.carSelected?.name ?? "";

    var costByCar = num.tryParse(weRentRequest.value.carSelected?.cost ?? "0") ?? 0;
    if (weRentRequest.value.rentDuration != null && weRentRequest.value.rentDuration != '0') {
      var rentDuration = num.tryParse(weRentRequest.value.rentDuration ?? "0") ?? 0;
      totalCost.value = costByCar.toDouble() * rentDuration.toInt();
    } else {
      totalCost.value = num.tryParse(weRentRequest.value.packageSelected?.price ?? "0")?.toDouble() ?? 0;
    }
  }

  void setPaymentSelected(String image, String paymentOption) {
    paymentMethod.value = paymentOption;
    paymentImage.value = image;
  }

  Future<num> addNewAddress() async {
    var element = weRentRequest.value.pickUpAddress;
    var request = AddNewAddressRequest(
      name: element?.name ?? "",
      detail: element?.detail ?? '',
      address: element?.address ?? "",
      favorite: false,
      lat: element?.lat ?? 0,
      lng: element?.lng ?? 0,
    );

    try {
      var response = await dio.post('address', data: request.toJson());
      var address = AddNewAddressResponse.fromJson(response.data);
      return address.result?.id ?? 0;
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      createOrderFailed.value = errorResponse.message ?? "";
      return 0;
    }
  }

  Future createOrder() async {
    createOrderSuccess.value = false;
    createOrderFailed.value = '';

    String? paymentTransactionId;

    if (paymentMethod.value.toLowerCase() == 'wallet') {
      try {
        await [
          Permission.camera,
          Permission.storage,
        ].request();

        dio.post('wallets');
      } on DioError catch (e) {
        printError(info: e.message!);
      }
    } else if (paymentMethod.value.toLowerCase() == 'credit') {
      var response =
          await _getLinkPaymentUseCaseImpl.getLinkPayment(totalCost.value);

      var result = await Navigator.push(
        Get.context!,
        MaterialPageRoute(
            builder: (context) => PaymentWebView(
                  url: response.result?.redirectUrl ?? "",
                  isPaymentOrder: true,
                  onFinish: () {
                    Navigator.of(context).pop(true);
                  },
                )),
      );

      if (result == null) {
        paymentError.value = true;
        return;
      }

      paymentTransactionId = response.result?.paymentTransectionId;
    }

    var pickupAddress = weRentRequest.value.pickUpAddress;

    var request = CreateWeRideOrderRequest(
        couponId: couponId,
        paymentMethod: paymentMethod.value,
        paymentTransactionId: paymentTransactionId,
        customerPoint: CustomerPoint(
          lat: pickupAddress?.lat ?? 0,
          lng: pickupAddress?.lng ?? 0,
          name: pickupAddress?.name ?? "",
          address: pickupAddress?.address ?? "",
          detail: pickupAddress?.detail ?? "",
        ),
        weRent: Rent(
          packageId: weRentRequest.value.packageSelected?.id,
          plan: weRentRequest.value.planYouGo ?? "",
          vehicleTypeId: weRentRequest.value.carSelected?.id ?? 0,
          rentHousing: weRentRequest.value.rentDuration,
        ));

    try {
      var response = await dio.post('activities/rent', data: request.toJson());
      var data = response.data;
      var orderResponse = CreateWeRideOrderResponse.fromJson(data);
      weRideOrderResponse = orderResponse.result!;

      createOrderSuccess.value = true;
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      createOrderFailed.value = errorResponse.message ?? "";
    }
  }
}
