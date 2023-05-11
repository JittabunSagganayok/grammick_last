import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCar.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/paymentCallCar.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/promotion.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/core/domain/get_link_payment_usecase.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/coupon/coupon_response.dart';
import 'package:we_link/models/activity/we-ride/we_ride_activity_response.dart'
    as address;
import 'package:we_link/models/address/add_new_address_response.dart';
import 'package:we_link/models/address/my_address_response.dart';

import '../../../../di/app_module.dart';
import '../../../../models/address/add_new_address_request.dart';
import '../../../../models/distance/cost_by_distance_response.dart';
import '../../../../models/error/error_response.dart';
import '../../../../models/we_ride/create_we_ride_order_request.dart';
import '../../../../models/we_ride/create_we_ride_order_response.dart';
import '../../../../shared/loading/loading_fullscreen.dart';
import '../../../profile/myWalletComponent/payment_webview.dart';
import '../rideComponents/callCar/loadCallCar.dart';
import '../rideComponents/callCar/review.dart';
import '../rideComponents/confirmLocation.dart';

class DriverYourCarDetailScreen extends StatefulWidget {
  DriverYourCarDetailScreen({Key? key}) : super(key: key);

  @override
  State<DriverYourCarDetailScreen> createState() =>
      _DriverYourCarDetailScreenState();
}

class _DriverYourCarDetailScreenState
    extends AppState<DriverYourCarDetailScreen, DriverYourCarDetailViewModel> {
  TextEditingController noteTextController = TextEditingController();

  @override
  DriverYourCarDetailViewModel initViewModel(
      DriverYourCarDetailViewModel viewModel) {
    if (Get.arguments is DriveYourCarRequest) {
      viewModel.setArguments(Get.arguments);
    }

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

    viewModel.getCostByDistance();

    return viewModel;
  }

  @override
  Widget onCreateView(
      BuildContext context, DriverYourCarDetailViewModel viewModel) {
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
              style: titleWhiteAppbar,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Container(
                constraints: maxHeightContain,
                color: Colors.white,
                margin: EdgeInsets.only(top: 12),
                // padding: EdgeInsets.fromLTRB(30, 21, 30, 21),
                child: Column(
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
                                          "Drive your car",
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
                                margin: EdgeInsets.only(bottom: 18, top: 30),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => Text(
                                        viewModel.totalCost.value
                                            .toStringAsFixed(2),
                                        style: const TextStyle(
                                            fontSize: 42,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black,
                                            fontFamily: 'Kanit'),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: const Text(
                                        ' ฿',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFA9A9A9),
                                            fontFamily: 'Kanit'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                  bottom: 18,
                                ),
                                child: Text(
                                  'Detail',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontFamily: 'Kanit'),
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
                                      final item =
                                          viewModel.addressList.value[index];
                                      return ItemDestination(item);
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            Divider(
                                      height: 16,
                                      indent: 40,
                                    ),
                                  ),
                                  Container(
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
                                        Obx(() => Text(
                                              '${viewModel.km.value} km',
                                              style: distanceText,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Color(0xFFE6E6E6),
                                    thickness: 1,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 15, top: 18),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Your car :',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF564FF0),
                                                fontFamily: 'Kanit'),
                                          ),
                                        ),
                                        Text(
                                          viewModel.driveYourCarRequest.value
                                                  ?.yourCar ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black,
                                              fontFamily: 'Kanit'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 15, top: 18),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Drive system :',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF564FF0),
                                                fontFamily: 'Kanit'),
                                          ),
                                        ),
                                        Text(
                                          viewModel.driveYourCarRequest.value
                                                  ?.driveSystem ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black,
                                              fontFamily: 'Kanit'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Color(0xFFE6E6E6),
                                    thickness: 1,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin:
                                        EdgeInsets.only(bottom: 15, top: 18),
                                    child: Text(
                                      'Request',
                                      style: inforTitleText,
                                    ),
                                  ),
                                  Container(
                                      height: 50,
                                      child: TextFormField(
                                        autofocus: false,
                                        controller: noteTextController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: 'Write request',
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintStyle: hintTextStyle,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 14.0),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                color: Color(0xFFEDEDED),
                                              )),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                color: Color(0xFFEDEDED),
                                              )),
                                        ),
                                      )),
                                  SizedBox(height: 20),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xFFE6E6E6),
                      thickness: 1,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 15,
                            ),
                            child: Text(
                              'Payment method',
                              style: inforTitleText,
                            ),
                          ),
                          Row(
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
                                        var result =
                                            await Get.to(PaymentMethodScreen(
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
                                                  text: viewModel
                                                      .paymentMethod.value,
                                                  style: paymentText,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
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
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      child: OutlinedButton(
                                          style: paymentOutlined,
                                          onPressed: () async {
                                            var result =
                                                await Get.to(PromotionScreen());
                                            if (result != null &&
                                                result is Coupon) {
                                              viewModel.couponSelected.value =
                                                  result;
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
                                                    style:
                                                        paymentText?.copyWith(
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
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      child: OutlinedButton(
                                          style: codePromoOutlined,
                                          onPressed: () async {
                                            var result =
                                                await Get.to(PromotionScreen());
                                            if (result != null &&
                                                result is Coupon) {
                                              viewModel.couponSelected.value =
                                                  result;
                                              viewModel.couponId =
                                                  result.id ?? -1;
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
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
                      blurRadius: 15, color: Colors.grey[300]!, spreadRadius: 8)
                ],
              ),
              child: Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
                child: Container(
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
                      await viewModel.createOrder(
                        noteTextController.text,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Confirm',
                          style: selectsCarTextButton,
                        ),
                        Container(
                          child: Obx(() => Text.rich(
                                TextSpan(
                                    text: "Total    ",
                                    style: const TextStyle(
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
                                overflow: TextOverflow.ellipsis,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class DriverYourCarDetailViewModel extends GetxController {
  Dio dio;

  GetCostByDistanceRepository repository;
  GetLinkPaymentUseCaseImpl _getLinkPaymentUseCaseImpl;

  DriverYourCarDetailViewModel(
    this.dio,
    this.repository,
    this._getLinkPaymentUseCaseImpl,
  );

  var driveYourCarRequest = DriveYourCarRequest().obs;
  var addressList = <address.Destinations?>[].obs;

  var paymentMethod = 'CASH'.obs;
  var paymentImage = 'assets/images/money.png'.obs;

  var createOrderSuccess = false.obs;
  var paymentError = false.obs;
  var createOrderFailed = ''.obs;

  var couponSelected = Coupon().obs;
  num? couponId;

  var totalCost = 0.0.obs;
  var km = 0.0.obs;

  void setArguments(arguments) {
    driveYourCarRequest.value = arguments as DriveYourCarRequest;

    var pickup = address.Destinations(
        destination: address.Destination(
      name: driveYourCarRequest.value.pickupAddress?.name ?? "",
      address: driveYourCarRequest.value.pickupAddress?.address ?? "",
      detail: driveYourCarRequest.value.pickupAddress?.detail ?? "",
      icon: 'assets/icons/ic_activity_start.svg',
    ));

    var destination = address.Destinations(
        destination: address.Destination(
      name: driveYourCarRequest.value.destinationAddress?.name ?? "",
      address: driveYourCarRequest.value.destinationAddress?.address ?? "",
      detail: driveYourCarRequest.value.destinationAddress?.detail ?? "",
      icon: 'assets/icons/ic_activity_destination.svg',
    ));

    addressList.add(pickup);
    addressList.add(destination);
  }

  void setPaymentSelected(String image, String paymentOption) {
    paymentMethod.value = paymentOption;
    paymentImage.value = image;
  }

  Future<num> addNewAddress() async {
    var element = driveYourCarRequest.value.destinationAddress!;
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
      AddNewAddressResponse data =
          AddNewAddressResponse.fromJson(response.data);

      return data.result?.id ?? -1;
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      createOrderFailed.value = errorResponse.message ?? "";
      return 0;
    }
  }

  Future createOrder(String noted) async {
    paymentError.value = false;
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

    var addressId = await addNewAddress();

    var pickupAddress = driveYourCarRequest.value.pickupAddress;

    var request = CreateWeRideOrderRequest(
        couponId: couponId,
        paymentMethod: paymentMethod.value,
        customerPoint: CustomerPoint(
          lat: pickupAddress?.lat ?? 0,
          lng: pickupAddress?.lng ?? 0,
          name: pickupAddress?.name ?? "",
          address: pickupAddress?.address ?? "",
          detail: pickupAddress?.detail ?? "",
        ),
        driveYourCar: DriveYourCar(
          car: driveYourCarRequest.value?.yourCar ?? "",
          destinationAddressId: addressId,
          driveSystem: driveYourCarRequest.value?.driveSystem ?? "",
          more: noted,
          cost: totalCost.value,
        ));

    try {
      var response =
          await dio.post('activities/drive-your-car', data: request.toJson());
      var data = response.data;
      var orderResponse = CreateWeRideOrderResponse.fromJson(data);
      weRideOrderResponse = orderResponse.result!;

      createOrderSuccess.value = true;
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      createOrderFailed.value = errorResponse.message ?? "";
    }
  }

  Future getCostByDistance() async {
    CostByDistanceResponse costByDistanceResponse = await repository
        .getCostByDistance(
            driveYourCarRequest.value.pickupAddress ?? AddressResponse(), [
      driveYourCarRequest.value.destinationAddress ?? AddressResponse()
    ]);

    totalCost.value = (costByDistanceResponse.result?.cost ?? 0.0).toDouble();
    km.value = (costByDistanceResponse.result?.distance ?? 0.0).toDouble();
  }
}
