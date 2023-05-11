import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/components/home/homeComponents/rentCar/rentCarComponent.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/verhicle/selectsCar.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../../../models/driver/all_vehicle_type_reponse.dart' as vehicleList;
import '../../../../models/vehicle_promotion/vehicle_promotion_list_response.dart'
    as promotion;

enum Fuel { including, non }

class RentPackageArgument {
  promotion.VehiclePromotion? packageSelected;
  vehicleList.Vehicle? carSelected;
  String? rentDuration;

  RentPackageArgument({
    this.packageSelected,
    this.carSelected,
    this.rentDuration,
  });
}

class RentPackageScreen extends StatefulWidget {
  RentPackageScreen({Key? key}) : super(key: key);

  @override
  State<RentPackageScreen> createState() => _RentPackageScreenState();
}

class _RentPackageScreenState
    extends AppState<RentPackageScreen, RentPackageViewModel> {
  Duration? selectedValue;

  Future<String> showTimerPicker(BuildContext context) async {
    var days = '';

    return await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            constraints: maxHeightContain,
            decoration: selectTimeDecoration,
            padding: EdgeInsets.only(bottom: 35, top: 40),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40, bottom: 10),
                          child: SizedBox(
                            height: 130,
                            child: CupertinoPicker(
                              backgroundColor: Colors.white,
                              itemExtent: 40,
                              // useMagnifier: true,
                              // looping: false,
                              // diameterRatio:1,
                              scrollController:
                                  FixedExtentScrollController(initialItem: -1),
                              children: [
                                for (var i = 1; i < 5; i++)
                                  Center(
                                      child: Text(
                                    "$i",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF132150),
                                        fontFamily: 'Kanit'),
                                  ))
                              ],
                              onSelectedItemChanged: (value) {
                                setState(() {
                                  days = (value + 1).toString();
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              child: Text('Days', style: selectTimeTitle),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17, right: 17),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(days);
                            },
                            child: Container(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: selectNow,
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: selectTimeText,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(days);
                            },
                            child: Container(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: slectSchedule,
                              child: Center(
                                child: Text(
                                  'Confirm',
                                  style: selectTimeText,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  RentPackageViewModel initViewModel(RentPackageViewModel viewModel) {
    viewModel.getCarPackage();

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, RentPackageViewModel viewModel) {
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
            'Rent Package',
            style: titleWhiteAppbar,
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
                    child: Column(
                  children: [
                    if (viewModel.carSelected.value.id == null) ...[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 25, 0, 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                'Promotion',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Kanit'),
                              ),
                            ),
                            rentCarComponent(
                              viewModel.vehiclePromotionList,
                              onPackageSelected: (promotion.VehiclePromotion package) {
                                viewModel.packageSelected.value = package;
                              },
                              onRemovePackage: () {
                                viewModel.packageSelected.value = promotion.VehiclePromotion();
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                    Divider(
                      color: Color(0xFFE6E6E6),
                      thickness: 1,
                    ),
                    if (viewModel.packageSelected.value.id == null) ...[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 22, 0, 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                'Category',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Kanit'),
                              ),
                            ),
                            Obx(
                              () => SelectCarScreen(
                                viewModel.carList.value,
                                RentPackage: 'RentPackage',
                                onSelected: (index) {
                                  viewModel.setCarSelected(index);
                                },
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20, top: 20),
                                  child: Text(
                                    'Add optional ',
                                    style: TextStyle(
                                        color: Color(0xFF9A9A9A),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Kanit'),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    var result = await showTimerPicker(context);
                                    viewModel.rentDuration.value = result;
                                  },
                                  child: Container(
                                      height: 45,
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 16),
                                      width:
                                          MediaQuery.of(context).size.width * 1,
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
                                              height: 22,
                                              width: 22,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                                child: Obx(() => Text.rich(
                                                      TextSpan(
                                                          text:
                                                              "${viewModel.rentDuration.value} days",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF8A8A8A),
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'Kanit')),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ))),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 12),
                                            child: Image.asset(
                                              'assets/images/select.png',
                                              fit: BoxFit.fill,
                                              height: 17,
                                              width: 18,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 32,
                            ),
                          ],
                        ),
                      ),
                    ]
                  ],
                )),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.fromLTRB(20, 25, 20, 34),
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
                    navigator?.pop(RentPackageArgument(
                        carSelected: viewModel.carSelected.value,
                        packageSelected: viewModel.packageSelected.value,
                        rentDuration: viewModel.rentDuration.value,));
                  },
                  child: Obx((){
                    num totalCost = 0.0;
                    if (viewModel.packageSelected.value.id != null) {
                      totalCost = num.tryParse(viewModel.packageSelected.value.price ?? '0') ?? 0;
                    }  else{
                      totalCost = (num.tryParse(viewModel.carSelected.value.cost ?? '0') ?? 0).toDouble() * (num.tryParse(viewModel.rentDuration.value)?.toInt() ?? 0);
                    }
                    return Text(
                      totalCost <= 0 ? 'Confirm': 'Total $totalCost ฿',
                      style: TextStyle(
                          color: Color(0xFF363636),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit'),
                    );
                  }),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}

class RentPackageViewModel extends GetxController {
  Dio dio;

  RentPackageViewModel(this.dio);

  var loading = false.obs;
  var vehiclePromotionList = <promotion.VehiclePromotion>[].obs;

  var packageSelected = promotion.VehiclePromotion().obs;

  var carList = <vehicleList.Vehicle>[].obs;
  var carSelected = vehicleList.Vehicle().obs;

  var rentDuration = '0'.obs;

  Future getCarPackage() async {
    loading.value = true;
    var response = await dio.get('vehicle-packets');
    var vehiclePromotionListResponse =
        promotion.VehiclePromotionListResponse.fromJson(response.data);

    vehiclePromotionList.value = vehiclePromotionListResponse.result ?? [];

    response = await dio.get('vehicle-types');
    var data = vehicleList.AllVehicleTypeReponse.fromJson(response.data);
    carList.value = data.result ?? [];

    loading.value = false;
  }

  void setCarSelected(int index) {
    if (index == -1) {
      carList.value.where((element) => element.selected == true).map((e) => e.selected = false);
      carList.refresh();
      carSelected.value = vehicleList.Vehicle();
    }  else{
      carList.where((p0) => p0.selected == true).map((e) => e.selected = false);
      carList[index].selected = true;
      carList.refresh();
      carSelected.value = carList[index];
    }
  }
}
