import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/models/address/my_address_response.dart';

import '../data/assistant_request.dart';

class AssistantRecipientViewModel extends GetxController {
  Dio dio;

  AssistantRecipientViewModel(this.dio);

  AssistantRequest? assistantRequest;

  var destinationAddress = AddressResponse().obs;

  void setParams(AssistantRequest request) {
    assistantRequest = request;

    if (assistantRequest?.isWeFixOrder == true) {
      destinationAddress.value = assistantRequest?.pickupAddress ?? AddressResponse();
    }  else{
      destinationAddress.value = assistantRequest?.destinationAddress ?? AddressResponse();
    }
  }

  void setupNewAddress(AddressResponse pickUpAddress) {
    assistantRequest?.destinationAddress = pickUpAddress;
    destinationAddress.value = pickUpAddress;
  }

  AssistantRequest? createRequest(
    String username,
    String phone,
    String moreDetail,
  ) {
    assistantRequest?.name = username;
    assistantRequest?.phone = phone;
    assistantRequest?.moreDetail = moreDetail;
    return assistantRequest;
  }
}
