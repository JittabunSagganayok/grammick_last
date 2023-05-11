import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/selectTime.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLocation.dart';
import 'package:we_link/components/home/weLinkComponents/weRentComponents/planToGo.dart';
import 'package:we_link/components/home/weLinkComponents/weRentComponents/rentPackage.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';

import '../../../../models/driver/all_vehicle_type_reponse.dart' as vehicleList;
import '../../../../models/vehicle_promotion/vehicle_promotion_list_response.dart'
    as promotion;
import '../../../constant/colosrConstants.dart';
import '../../../models/address/my_address_response.dart';
import '../../../models/driver/all_vehicle_type_reponse.dart';
import '../../../models/vehicle_promotion/vehicle_promotion_list_response.dart';
import '../weLinkToGo.dart';

class WeRentScreen extends StatefulWidget {
  VehiclePromotion? packageSelected;

  WeRentScreen({
    this.packageSelected,
  });

  @override
  State<WeRentScreen> createState() => _WeRentScreenState();
}

class _WeRentScreenState extends AppState<WeRentScreen, WeRentViewModel> {
  @override
  WeRentViewModel initViewModel(WeRentViewModel viewModel) {

    if (widget.packageSelected!=null) {
      viewModel.setSelectRentPackage(RentPackageArgument(
          carSelected: Vehicle(),
          packageSelected: widget.packageSelected,
          rentDuration: '0',));
    }

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, WeRentViewModel viewModel) {
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
            SelectTimeWidget(),
            SizedBox(
              height: 21,
            ),
            GestureDetector(
              onTap: () {
                Get.to(SearchLocationScreen(
                  searchLocationBy: SearchLocationBy.RENT,
                  onSelectAddress: (
                    pickUpAddress,
                    destinationAddress,
                  ) {
                    viewModel.pickupAddress.value = pickUpAddress;
                  },
                ));
              },
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
                                      text:
                                          viewModel.pickupAddress.value.name ??
                                              "Pick up Confirm",
                                      style: bottomReviewText),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ))),
                      ),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () async {
                if (viewModel.pickupAddress.value.name == null) {
                  Get.defaultDialog(
                    title: 'ขออภัย',
                    content: Text(
                      'คุณยังไม่ได้เลือกจุดที่ต้องการให้ไปรับ',
                      textAlign: TextAlign.center,
                    ),
                  );
                  return;
                }

                var result = await Get.to(RentPackageScreen());

                if (result != null) {
                  viewModel.setSelectRentPackage(result);
                }
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
                      // How Long ?
                      Expanded(
                        child: Container(child: Obx(() {
                          var packageSelected =
                              viewModel.packageSelected.value.id != null;
                          return Text.rich(
                            TextSpan(
                                text: packageSelected
                                    ? viewModel.packageSelected.value.title
                                    : '${viewModel.carSelected.value.name ?? ''} - ${viewModel.rentDuration.value} days',
                                style: bottomReviewText),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          );
                        })),
                      ),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () async {
                var result = await planToGo(context);
                if (result != null) {
                  viewModel.planYouGo.value = result;
                }
              },
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
                                      text: viewModel.planYouGo.value,
                                      style: bottomReviewText),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ))),
                      ),
                    ],
                  )),
            ),
            Container(
              height: 50,
              width: Get.width,
              margin: EdgeInsets.only(
                right: 20,
                top: 24,
              ),
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
                  var request = viewModel.createWeRentRequest();

                  Get.to(WeLinkToGoScreen(
                    valueSelectedIndex: 2,
                    request: request,
                  ));
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
          ],
        ),
      ),
    );
  }
}

class WeRentViewModel extends GetxController {
  Dio dio;

  WeRentViewModel(this.dio);

  var pickupAddress = AddressResponse().obs;
  var planYouGo = 'Which place you plan to go to ?'.obs;
  var rentDuration = ''.obs;
  var packageSelected = promotion.VehiclePromotion().obs;
  var carSelected = vehicleList.Vehicle().obs;

  void setSelectRentPackage(RentPackageArgument result) {
    rentDuration.value = result.rentDuration ?? "";
    packageSelected.value = result.packageSelected!;
    carSelected.value = result.carSelected!;
  }

  WeRentRequest createWeRentRequest() {
    var request = WeRentRequest(
      pickUpAddress: pickupAddress.value,
      rentDuration: rentDuration.value,
      packageSelected: packageSelected.value,
      carSelected: carSelected.value,
      planYouGo: planYouGo.value,
    );
    return request;
  }
}

class WeRentRequest {
  AddressResponse? pickUpAddress;
  promotion.VehiclePromotion? packageSelected;
  vehicleList.Vehicle? carSelected;
  String? rentDuration;
  String? planYouGo;
  String? paymentMethod;
  String? couponId;

  WeRentRequest({
    this.pickUpAddress,
    this.packageSelected,
    this.carSelected,
    this.rentDuration,
    this.planYouGo,
    this.paymentMethod,
    this.couponId,
  });
}
