import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/components/signin/selectAddress.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/address/add_new_address_request.dart';
import 'package:we_link/models/address/my_address_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:we_link/views/main_screen.dart';

import '../../models/error/error_response.dart';

class AddNewAddressArguments{
  final String? keyword;
  final AddressResponse? currentAddress;

  AddNewAddressArguments({
    this.keyword,
    this.currentAddress,
  });
}

class AddNewAddressScreen extends StatefulWidget {
  final String? keyword;
  final AddressResponse? currentAddress;

  AddNewAddressScreen({
    this.keyword,
    this.currentAddress,
  });

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState
    extends AppState<AddNewAddressScreen, AddNewAddressViewModel> {
  var nameController = TextEditingController();
  var detailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  AddNewAddressViewModel initViewModel(AddNewAddressViewModel viewModel) {
    if (widget.currentAddress != null) {
      viewModel.address.value = widget.currentAddress!;
      nameController.text = widget.currentAddress?.name ?? "";
    }



    viewModel.createSuccess.listen((p0) {
      navigator?.pop();

      displaySuccessDialog();
    });

    viewModel.createError.listen((message) {
      navigator?.pop();
      Get.defaultDialog(
        title: 'Error',
        content: Text(message, textAlign: TextAlign.center),
      );
    });

    return viewModel;
  }

  displaySuccessDialog() {
    showDialog<Widget>(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Center(
              child: Container(
            margin: EdgeInsets.all(50),
            constraints: maxHeightContain,
            decoration: alertBoxDecoration,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 20),
                      child: Image.asset(
                        'assets/images/alert.png',
                        fit: BoxFit.fill,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    Container(
                      child: Text(
                        'Saved',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF2F2F2F),
                            fontFamily: 'Kanit'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        'You have saved Get started now',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF7E7E7E),
                            fontFamily: 'Kanit'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 10),
                      height: 47,
                      width: 165,
                      child: OutlinedButton(
                        style: alertOutlinedButton,
                        onPressed: () {
                          Get.offAll(MainScreen());
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
        });
  }

  @override
  Widget onCreateView(BuildContext context, AddNewAddressViewModel viewModel) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: true,
            leading: Container(
              margin: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            title: Text(
              'Add new Address',
              style: titleWhiteAppbar,
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Address',
                              style: addNewAddrBlackText,
                            ),
                            Text(
                              ' *',
                              style: addNewAddrYellowText,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchAddressScreen(
                                      keyword: widget.keyword)),
                            ).then((value){
                              if (value is AddNewAddressArguments) {
                                AddNewAddressArguments result = value;
                                viewModel.address.value = result.currentAddress!;
                                nameController.text = result.keyword ?? "";
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/loca2.png',
                                  fit: BoxFit.fill,
                                  height: 29,
                                  width: 19,
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(() => Text.rich(
                                        TextSpan(
                                          text: viewModel.address.value?.name ?? "",
                                          style: const TextStyle(
                                              color: Color(0xFF212B32),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Kanit'),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                      Obx(() => Text.rich(
                                        TextSpan(
                                          text:
                                          viewModel.address.value?.address ?? "",
                                          style: const TextStyle(
                                              color: Color(0xFF979797),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Kanit'),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Image.asset(
                                    'assets/images/edit.png',
                                    fit: BoxFit.fill,
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color(0xFFEEEEEE),
                          thickness: 1,
                        ),
                        const SizedBox(height: 22),
                        Row(
                          children: [
                            Text(
                              'Name',
                              style: addNewAddrBlackText,
                            ),
                            Text(
                              ' *',
                              style: addNewAddrYellowText,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                            height: 55,
                            child: TextFormField(
                              controller: nameController,
                              readOnly: true,
                              validator: (text) {
                                if (text?.isEmpty == true) {
                                  return 'Please Enter Name';
                                }
                              },
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              style: addAddressText,
                              decoration: InputDecoration(
                                hintText: 'Add new name',
                                fillColor: Color(0xFFFBFBFB),
                                filled: true,
                                hintStyle: hintTextStyle,
                                enabledBorder: searchBoder,
                                focusedBorder: searchBoder,
                              ),
                            )),
                        SizedBox(height: 22),
                        Row(
                          children: [
                            Text(
                              'More Detail',
                              style: addNewAddrBlackText,
                            ),
                            Text(
                              ' *',
                              style: addNewAddrYellowText,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: TextFormField(
                            controller: detailController,
                            validator: (text) {
                              if (text?.isEmpty == true) {
                                return 'Please enter more detail';
                              }
                            },
                            keyboardType: TextInputType.text,
                            maxLines: 5,
                            style: addAddressText,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Add description more',
                              fillColor: Color(0xFFFBFBFB),
                              filled: true,
                              hintStyle: hintTextStyle,
                              enabledBorder: searchBoder,
                              focusedBorder: searchBoder,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 30),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 1,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: yellowColor,
                        textStyle: const TextStyle(fontSize: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        side: const BorderSide(
                          width: 0.0,
                          color: yellowColor,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Get.dialog(LoadingFullscreen(backgroundColor: Colors.black45,));

                          await viewModel.addNewAddress(
                              nameController.text,
                              detailController.text,
                              currentAddress: widget.currentAddress
                          );
                        }
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                            color: Color(0xFF363636),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class AddNewAddressViewModel extends GetxController {
  Dio dio;

  var address = AddressResponse().obs;

  var createSuccess = false.obs;
  var createError = ''.obs;

  AddNewAddressViewModel(this.dio);

  Future addNewAddress(
    String name,
    String detail,
    {AddressResponse? currentAddress}

  ) async {



    var request = AddNewAddressRequest(
      name: name,
      detail: detail,
      address: address.value?.name ?? "",
      favorite: false,
      lat: address.value?.lat ?? 0,
      lng: address.value?.lng ?? 0,
    );

    try {
      await dio.post('address', data: request.toJson());
      createSuccess.value = true;
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      createError.value = errorResponse.message ?? "";
    }
  }
}
