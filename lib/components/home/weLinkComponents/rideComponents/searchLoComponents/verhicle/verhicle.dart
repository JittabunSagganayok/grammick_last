import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/loadCallCar.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/promotion.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/verhicle/selectsCar.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/core/domain/get_link_payment_usecase.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/coupon/coupon_response.dart';
import 'package:we_link/models/address/add_new_address_response.dart';
import 'package:we_link/models/distance/cost_by_distance_response.dart';
import 'package:we_link/models/driver/all_vehicle_type_reponse.dart';
import 'package:we_link/models/we_ride/create_we_ride_order_request.dart';
import 'package:we_link/models/we_ride/create_we_ride_order_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../../../../../di/app_module.dart';
import '../../../../../../models/address/add_new_address_request.dart';
import '../../../../../../models/address/my_address_response.dart';
import '../../../../../../models/error/error_response.dart';
import '../../../../../../models/other/app_help_center_response.dart';
import '../../../../../../views/content/web_content_screen.dart';
import '../../../../../profile/myWalletComponent/payment_webview.dart';
import '../../paymentCallCar.dart';

class SelectVehicleSection extends StatefulWidget {
  final List<Vehicle> carList;
  final String noted;
  final AddressResponse pickupLocation;
  final List<AddressResponse> destination;
  DateTime? bookingAdvance;
  final CostByDistanceResponse? costByDistanceResponse;

  SelectVehicleSection(
    this.carList, {
    required this.pickupLocation,
    required this.destination,
    this.noted = '',
    this.bookingAdvance,
    this.costByDistanceResponse,
  });

  @override
  State<SelectVehicleSection> createState() => _SelectVehicleSectionState();
}

class _SelectVehicleSectionState
    extends AppState<SelectVehicleSection, SelectVehicleViewModel> {
  @override
  SelectVehicleViewModel initViewModel(SelectVehicleViewModel viewModel) {
    viewModel.carList.value = widget.carList;
    viewModel.noted = widget.noted;
    viewModel.destination = widget.destination;
    viewModel.pickupLocation = widget.pickupLocation;
    viewModel.bookingAdvance = widget.bookingAdvance;
    viewModel.costByDistanceResponse = widget.costByDistanceResponse;

    viewModel.createOrderSuccess.listen((success) {
      if (success) {
        navigator?.pop();
        Get.off(PendingDriverAcceptScreen());
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

    viewModel.setCarSelected(0);

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, SelectVehicleViewModel viewModel) {
    return Container(
      constraints: maxHeightContain,
      decoration: selectsCarDecoration,
      child: Container(
        margin: EdgeInsets.only(
          top: 20,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 11),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      'Vehicle',
                      style: titleHomeText,
                    ),
                  ),
                  // Spacer(),
                  // Expanded(
                  //     child: Container(
                  //   alignment: Alignment.topRight,
                  //   child: Text.rich(
                  //     TextSpan(
                  //         text: "Total    ",
                  //         style: TextStyle(
                  //             fontSize: 12,
                  //             fontWeight: FontWeight.w800,
                  //             color: yellowColor,
                  //             fontFamily: 'Kanit'),
                  //         children: [
                  //           TextSpan(
                  //             text: "200",
                  //             style: priceTotalText,
                  //           ),
                  //           TextSpan(
                  //             text: " ฿",
                  //             style: priceTotalText,
                  //           )
                  //         ]),
                  //     maxLines: 4,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ))
                ],
              ),
            ),
            Obx(
              () => SelectCarScreen(
                viewModel.carList.value,
                onSelected: (index) {
                  viewModel.setCarSelected(index);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 21),
              child: Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      if (viewModel.paymentMethod.value.isNotEmpty == true) {
                        return Container(
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
                        );
                      } else {
                        return SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 1,
                          child: OutlinedButton(
                              style: paymentOutlined,
                              onPressed: () async {
                                var result = await Get.to(WebContentScreen(),
                                    arguments: WebContentParams(
                                        showAcceptButton: true,
                                        title: 'Refund Condition',
                                        textHtml: viewModel?.termAndCondition
                                                .value?.description ??
                                            ""));
                                if (result != null) {
                                  result = await Get.to(PaymentMethodScreen(
                                    paymentSelected:
                                        viewModel.paymentMethod.value,
                                  ));
                                  if (result != null) {
                                    viewModel.setPaymentSelected(
                                        result['image'].toString(),
                                        result['name'].toString());
                                  }
                                }
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        child: Text.rich(
                                      TextSpan(
                                        text: "เลือกการชำระเงิน",
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
                      }
                    }),
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
                                  viewModel.couponId = result.id?.toInt() ?? -1;
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
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 21),
              height: 50,
              width: MediaQuery.of(context).size.width * 1,
              child: OutlinedButton(
                style: selectsCarButton,
                onPressed: () async {
                  if (viewModel.carSelected.value.id != null &&
                      viewModel.paymentMethod.value.isNotEmpty == true) {
                    Get.dialog(LoadingFullscreen(
                      backgroundColor: Colors.black45,
                    ));

                    await viewModel.createOrder();
                  } else {
                    Get.defaultDialog(
                      title: 'Error',
                      content: const Text(
                          'You have to choose vehicle and payment method. '),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Confirm',
                      style: selectsCarTextButton,
                    ),
                    // Spacer(),
                    Container(
                      // alignment: Alignment.topRight,
                      child: Obx(() => Text.rich(
                            TextSpan(
                                text: "Total    ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: yellowColor,
                                    fontFamily: 'Kanit'),
                                children: [
                                  TextSpan(
                                    text: viewModel.totalCost.value
                                        .toStringAsFixed(2),
                                    style: priceTotalText,
                                  ),
                                  TextSpan(
                                    text: " ฿",
                                    style: priceTotalText,
                                  )
                                ]),
                            // maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectVehicleViewModel extends GetxController {
  Dio dio;
  GetLinkPaymentUseCaseImpl _getLinkPaymentUseCaseImpl;

  var carList = <Vehicle>[].obs;
  var carSelected = Vehicle().obs;

  String noted = '';

  AddressResponse? pickupLocation;
  List<AddressResponse>? destination;

  List<Destinations> listOfDestination = [];

  DateTime? bookingAdvance;

  CostByDistanceResponse? costByDistanceResponse;

  SelectVehicleViewModel(
    this.dio,
    this._getLinkPaymentUseCaseImpl,
  ) {
    loadTermCondition();
  }

  var paymentMethod = ''.obs;
  var paymentImage = 'assets/images/money.png'.obs;

  var createOrderSuccess = false.obs;
  var createOrderFailed = ''.obs;
  var paymentError = false.obs;

  var couponSelected = Coupon().obs;
  num? couponId;

  var totalCost = 0.0.obs;

  void setCarSelected(int index) {
    carList.where((p0) => p0.selected == true).map((e) => e.selected = false);
    carList[index].selected = true;
    carList.refresh();
    carSelected.value = carList[index];

    num costByDistance = costByDistanceResponse?.result?.cost ?? 0;
    num costByCar = num.tryParse(carSelected.value.cost ?? "0") ?? 0;
    totalCost.value = (costByDistance + costByCar).toDouble();
  }

  void setPaymentSelected(String image, String paymentOption) {
    paymentMethod.value = paymentOption;
    paymentImage.value = image;
  }

  Future addNewAddress() async {
    for (int index = 0; index < (destination?.length ?? 0); index++) {
      final element = destination?[index];
      var request = AddNewAddressRequest(
        name: element?.name ?? "",
        address: element?.address ?? "",
        detail: element?.detail ?? "",
        favorite: false,
        lat: element?.lat ?? 0,
        lng: element?.lng ?? 0,
      );

      try {
        var response = await dio.post('address', data: request.toJson());
        var address = AddNewAddressResponse.fromJson(response.data);

        var data = Destinations(
          addressId: address.result?.id?.toInt() ?? 0,
          destinationNo: index + 1,
        );

        listOfDestination.add(data);
      } on DioError catch (e) {
        var errorResponse = ErrorResponse.fromJson(e.response?.data);
        createOrderFailed.value = errorResponse.message ?? "";
      }
    }
  }

  var termAndCondition = HelpCenter().obs;

  loadTermCondition() async {
    var resp = await dio.get('admin/term-conditions?skip&take',
        queryParameters: {'type': 'REFUND'});
    var termResp = AppHelpCenterResponse.fromJson(resp.data);
    termAndCondition.value = termResp.result!;
  }

  Future createOrder() async {
    createOrderSuccess.value = false;
    createOrderFailed.value = '';
    paymentError.value = false;

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

    await addNewAddress();

    var request = CreateWeRideOrderRequest(
        couponId: couponId,
        paymentTransactionId: paymentTransactionId,
        paymentMethod: paymentMethod.value,
        customerPoint: CustomerPoint(
          lat: pickupLocation?.lat ?? 0,
          lng: pickupLocation?.lng ?? 0,
          name: pickupLocation?.name ?? "",
          address: pickupLocation?.address ?? "",
          detail: pickupLocation?.detail ?? "",
        ),
        ride: Ride(
          cost: totalCost.value,
          destinations: listOfDestination,
          note: noted,
          vehicleTypeId: carSelected?.value.id ?? 0,
        ));

    if (bookingAdvance != null) {
      request.createdAt = '${bookingAdvance?.toIso8601String()}Z';
    }

    try {
      var response = await dio.post('activities/ride', data: request.toJson());
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
