import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:we_link/core/domain/get_link_payment_usecase.dart';
import 'package:we_link/feature/assistant/data/assistant_request.dart';
import 'package:we_link/feature/assistant/data/create_assistant_order_request.dart';
import 'package:we_link/models/activity/we-ride/we_ride_activity_response.dart'
    as address;

import '../../../components/home/weLinkComponents/rideComponents/confirmLocation.dart';
import '../../../components/profile/myWalletComponent/payment_webview.dart';
import '../../../di/app_module.dart';
import '../../../models/address/add_new_address_request.dart';
import '../../../models/address/add_new_address_response.dart';
import '../../../models/address/my_address_response.dart';
import '../../../models/distance/cost_by_distance_response.dart';
import '../../../models/error/error_response.dart';
import '../../../models/we_ride/create_we_ride_order_request.dart';
import '../../../models/we_ride/create_we_ride_order_response.dart';
import '../../../views/auth/createProfile.dart';
import '../../coupon/coupon_response.dart';

class AssistantConfirmOrderViewModel extends GetxController {
  Dio dio;
  GetCostByDistanceRepository repository;
  GetLinkPaymentUseCaseImpl _getLinkPaymentUseCaseImpl;

  AssistantConfirmOrderViewModel(
    this.dio,
    this.repository,
    this._getLinkPaymentUseCaseImpl,
  );

  AssistantRequest? assistantRequest;
  var addressList = <address.Destinations?>[].obs;

  var paymentMethod = 'CASH'.obs;
  var paymentImage = 'assets/images/money.png'.obs;

  var createOrderSuccess = false.obs;
  var paymentError = false.obs;
  var createOrderFailed = ''.obs;

  var couponSelected = Coupon().obs;
  num? couponId;

  void setArguments(arguments) {
    assistantRequest = arguments as AssistantRequest;

    var pickup = address.Destinations(
        destination: address.Destination(
      name: assistantRequest?.pickupAddress?.name ?? "",
      address: assistantRequest?.pickupAddress?.address ?? "",
      detail: assistantRequest?.pickupAddress?.detail ?? "",
      icon: assistantRequest?.isWeFixOrder == true
          ? 'assets/icons/ic_we_fix_destination.svg'
          : 'assets/icons/ic_activity_start.svg',
    ));

    addressList.add(pickup);

    if (assistantRequest?.isWeFixOrder == false) {
      var destination = address.Destinations(
          destination: address.Destination(
        name: assistantRequest?.destinationAddress?.name ?? "",
        address: assistantRequest?.destinationAddress?.address ?? "",
        detail: assistantRequest?.destinationAddress?.detail ?? "",
        icon: 'assets/icons/ic_activity_destination.svg',
      ));

      addressList.add(destination);
    }
  }

  void setPaymentSelected(String image, String paymentOption) {
    paymentMethod.value = paymentOption;
    paymentImage.value = image;
  }

  Future<num> addNewAddress(AddressResponse element) async {
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
      var response = await _getLinkPaymentUseCaseImpl
          .getLinkPayment(shippingCost?.value?.cost ?? -1);

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

    bool isWeFixOrder = assistantRequest?.isWeFixOrder == true;

    AddressResponse? address;

    if (isWeFixOrder) {
      address = assistantRequest?.pickupAddress;
    } else {
      address = assistantRequest?.destinationAddress;
    }

    var addressId = await addNewAddress(address!);

    var pickupAddress = assistantRequest?.pickupAddress;

    List<Items>? items = [];
    List<String> imageUrl = [];

    if (isWeFixOrder == false) {
      assistantRequest?.items?.forEach((element) {
        items.add(Items(
          name: element.product?.text,
          piece: num.tryParse(
                  element.amount?.text.toString().replaceAll(',', '') ?? "1") ??
              1,
          price: null,
        ));
      });
    } else {
      if (assistantRequest?.weFixImage?.isNotEmpty == true) {
        var imageList = assistantRequest?.weFixImage ?? [];
        for (int i = 0; i < imageList.length; i++) {
          var filePath = imageList[i];

          var image = http.FormData.fromMap({
            'picture': await http.MultipartFile.fromFile(filePath ?? ""),
          });

          var response = await dio.post('upload/one', data: image);
          var uploadResult = UploadImageResult.fromJson(response.data);
          imageUrl.add(uploadResult.result ?? "");
        }
      }
    }

    var request = CreateAssistantOrderRequest(
        couponId: couponId,
        paymentMethod: paymentMethod.value,
        paymentTransectionId: paymentTransactionId,
        customerPoint: CustomerPoint(
          lat: pickupAddress?.lat ?? 0,
          lng: pickupAddress?.lng ?? 0,
          name: pickupAddress?.name ?? "",
          address: pickupAddress?.address ?? "",
          detail: pickupAddress?.detail ?? "",
        ),
        assistant: Assistant(
          cost: shippingCost?.value?.cost ?? -1,
          note: assistantRequest?.moreDetail ?? "",
          additionalCost: isWeFixOrder
              ? num.tryParse(assistantRequest?.offerPrice
                          .toString()
                          .replaceAll(',', '') ??
                      "0") ??
                  0
              : null,
          type: assistantRequest?.assistantType ?? "ERRAND",
          estimateTime:
              isWeFixOrder ? null : assistantRequest?.estimateTime ?? 30,
          addressId: addressId,
          categoryId:
              isWeFixOrder ? assistantRequest?.serviceCategory?.id ?? 0 : null,
          estimatePrice: isWeFixOrder
              ? num.tryParse(assistantRequest?.offerPrice ?? "0") ?? 0
              : num.tryParse(assistantRequest?.estimatePrice ?? "0"),
          items: items,
          recipientName: assistantRequest?.name ?? "",
          recipientPhone: assistantRequest?.phone ?? "",
          pictures: imageUrl,
        ));

    try {
      var response =
          await dio.post('activities/assistant', data: request.toJson());
      var data = response.data;
      var orderResponse = CreateWeRideOrderResponse.fromJson(data);
      weRideOrderResponse = orderResponse.result!;

      createOrderSuccess.value = true;
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      createOrderFailed.value = errorResponse.message ?? "";
    }
  }

  var shippingCost = CostByDistance().obs;
  var loading = false.obs;

  Future getShippingCost() async {
    loading.value = true;

    var response = await repository.getCostByDistance(
        assistantRequest?.pickupAddress ?? AddressResponse(),
        [assistantRequest?.destinationAddress ?? AddressResponse()]);

    shippingCost.value = response.result!;
    loading.value = false;
  }
}
