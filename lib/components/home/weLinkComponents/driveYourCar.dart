import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/alert/driveSystem/driveSystemAlert.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCarComponents/checkDetails.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/selectTime.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLocation.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';

import '../../../models/address/my_address_response.dart';

class DriveYourCarScreen extends StatefulWidget {
  DriveYourCarScreen({Key? key}) : super(key: key);

  @override
  State<DriveYourCarScreen> createState() => _DriveYourCarScreenState();
}

class _DriveYourCarScreenState
    extends AppState<DriveYourCarScreen, DriveYourCarViewModel> {
  TextEditingController yourCarController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  DriveYourCarViewModel initViewModel(DriveYourCarViewModel viewModel) {
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, DriveYourCarViewModel viewModel) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: containerDecoration,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 35, bottom: 18),
                            child: Image.asset(
                              'assets/images/drive.png',
                              fit: BoxFit.fill,
                              height: 220,
                              width: 220,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text("Let us drive you wherever you go.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Kanit')),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 3),
                          child: Text(
                              "The driver's fee depends on the distance",
                              style: TextStyle(
                                  color: Color(0xFFACACAC),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Kanit')),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 38),
                          child: Text("and type of vehicle.",
                              style: TextStyle(
                                  color: Color(0xFFACACAC),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Kanit')),
                        ),
                        SelectTimeWidget(),
                        SizedBox(
                          height: 21,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(SearchLocationScreen(
                              searchLocationBy: SearchLocationBy.DRIVE_YOUR_CAR,
                              onSelectAddress: (
                                  pickUpAddress,
                                  destinationAddress,
                                  ) {
                                viewModel.pickupAddress.value = pickUpAddress;
                                viewModel.destinationAddress.value =
                                destinationAddress!;
                              },
                            ));
                          },
                          child: Container(
                              height: 43,
                              margin: EdgeInsets.only(bottom: 15),
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
                                      'assets/images/yourLo.png',
                                      fit: BoxFit.fill,
                                      height: 20,
                                      width: 17,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        child: Obx(()=> Text.rich(
                                          TextSpan(
                                            text:
                                            "${viewModel.pickupAddress.value.name ?? ""}",
                                            style: bottomReviewText,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ))),
                                  ),
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(SearchLocationScreen(
                              searchLocationBy: SearchLocationBy.DRIVE_YOUR_CAR,
                              onSelectAddress: (
                                  pickUpAddress,
                                  destinationAddress,
                                  ) {
                                viewModel.pickupAddress.value = pickUpAddress;
                                viewModel.destinationAddress.value =
                                destinationAddress!;
                              },
                            ));
                          },
                          child: Container(
                              height: 43,
                              margin: EdgeInsets.only(bottom: 15),
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
                                        child: Obx(()=> Text.rich(
                                          TextSpan(
                                              text:
                                              "${viewModel.destinationAddress.value.name ?? ""} ",
                                              style: bottomReviewText),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ))),
                                  ),
                                ],
                              )),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => searchLocation()),
                                  //   );
                                },
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    width:
                                    MediaQuery.of(context).size.width * 1,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(14),
                                        )),
                                    child: TextFormField(
                                      autofocus: false,
                                      controller: yourCarController,
                                      onFieldSubmitted: (keyword) {},
                                      keyboardType: TextInputType.text,
                                      validator: (text) {
                                        if (text?.isEmpty == true) {
                                          return 'Please Enter Your Car';
                                        }
                                      },
                                      style: const TextStyle(
                                          color: Color(0xFF8A8A8A),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Kanit'),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 12.0),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(14.0)),
                                          borderSide: BorderSide(
                                            width: 0,
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(14.0)),
                                          borderSide: BorderSide(
                                            width: 0,
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                        errorBorder: InputBorder.none,
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(14.0)),
                                          borderSide: BorderSide(
                                            width: 0,
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                        fillColor: Color(0xFFEEEEEE),
                                        filled: true,
                                        hintText: 'Your car',
                                        hintStyle: hintTextStyle,
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  driveSystemAlert(context, (driveSystem) {
                                    Navigator.pop(context);
                                    viewModel.driveSystem.value = driveSystem;
                                  });
                                },
                                child: Container(
                                    height: 43,
                                    margin: const EdgeInsets.only(bottom: 15),
                                    width:
                                    MediaQuery.of(context).size.width * 1,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(14),
                                        )),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 12),
                                              child: Obx(() => Text.rich(
                                                TextSpan(
                                                    text: viewModel
                                                        .driveSystem.value,
                                                    style: const TextStyle(
                                                        color: Color(
                                                            0xFF8A8A8A),
                                                        fontSize: 13,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontFamily:
                                                        'Kanit')),
                                                maxLines: 2,
                                                overflow:
                                                TextOverflow.ellipsis,
                                              ))),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(12),
                                          child: Image.asset(
                                            'assets/images/select.png',
                                            fit: BoxFit.fill,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
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
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              side: BorderSide(
                                width: 0.0,
                                color: yellowColor,
                              ),
                            ),
                            onPressed: () {

                              if (viewModel.pickupAddress.value.id == null) {
                                Get.defaultDialog(
                                  title: 'Error',
                                  content: Text('Please select pickup address'),
                                );
                                return;
                              }

                              if (viewModel.destinationAddress.value.id == null) {
                                Get.defaultDialog(
                                  title: 'Error',
                                  content: Text('Please select pickup address'),
                                );
                                return;
                              }

                              if (viewModel.driveSystem.value == 'Drive system') {
                                Get.defaultDialog(
                                  title: 'Error',
                                  content: Text('Please select your drive system'),
                                );
                                return;
                              }



                              if (_formKey.currentState!.validate()) {
                                Get.to(DriverYourCarDetailScreen(),
                                    arguments: viewModel.createRequest(
                                      yourCarController.text,
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
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class DriveYourCarViewModel extends GetxController {
  Dio dio;

  DriveYourCarViewModel(this.dio);

  var pickupAddress = AddressResponse().obs;
  var destinationAddress = AddressResponse().obs;
  var driveSystem = 'Drive system'.obs;

  DriveYourCarRequest createRequest(
    String yourCar,
  ) {
    var request = DriveYourCarRequest(
        pickupAddress: pickupAddress.value,
        destinationAddress: destinationAddress.value,
        driveSystem: driveSystem.value,
        yourCar: yourCar);
    return request;
  }
}

class DriveYourCarRequest {
  AddressResponse? pickupAddress;
  AddressResponse? destinationAddress;
  String? driveSystem;
  String? yourCar;

  DriveYourCarRequest({
    this.pickupAddress,
    this.destinationAddress,
    this.yourCar,
    this.driveSystem,
  });
}
