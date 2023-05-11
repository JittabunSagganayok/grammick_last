import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/home/homeComponents/rentCar/rentCarComponent.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/models/vehicle_promotion/vehicle_promotion_list_response.dart';

import '../../../views/home_screen.dart';

class HomeRentCarScreen extends StatelessWidget {
  List<VehiclePromotion> vehiclePromotionList;

  HomeRentCarScreen(this.vehiclePromotionList);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: appModule.get<HomeViewModel>(),
      builder: (HomeViewModel viewModel){
      return Column(children: [
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Container(
                child: Image.asset(
                  'assets/images/car8.png',
                  fit: BoxFit.fill,
                  height: 20,
                  width: 23,
                ),
              ),
              SizedBox(
                width: 13,
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: "Rent Car",
                    style: titleHomeText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        rentCarComponent(
          vehiclePromotionList,
          isHomeScreen: true,
          onPackageSelected: (package) {
            viewModel.packageSelected.value = package;
          },
          onRemovePackage: () {
            viewModel.packageSelected.value = VehiclePromotion();
          },
        )
      ]);
    },);
  }
}
