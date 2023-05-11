import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/components/signin/map.dart';
import 'package:we_link/components/signin/selectAddress.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/helper/app_helper.dart';
import 'package:we_link/models/address/my_address_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:we_link/views/main_screen.dart';

import '../../core/data/search_place_repository.dart';
import '../../di/app_module.dart';
import '../../shared/location/select_location_button.dart';
import 'addAddress.dart';

class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends AppState<LocationScreen, LocationViewModel> {
  FocusNode focusSearch = new FocusNode();
  UnfocusDisposition disposition = UnfocusDisposition.scope;

  _onFocusChange() async {
    if (focusSearch.hasFocus == true) {
      var result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchAddressScreen()),
      );

      setState(() {
        primaryFocus!.unfocus(disposition: disposition);
      });


      if (result!=null) {
        var value = result as AddNewAddressArguments;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddNewAddressScreen(currentAddress: value.currentAddress)),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    focusSearch.addListener(_onFocusChange);
  }

  @override
  LocationViewModel initViewModel(LocationViewModel viewModel) {
    viewModel.redirectToAddNewAddressScreen.listen((result) {
      if (result == true) {
        navigator?.pop();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddNewAddressScreen(
                  currentAddress: viewModel.currentLocation)),
        );
      }
    });

    viewModel.redirectToMapScreen.listen((result) {
      if (result == true) {
        navigator?.pop();
        openMapScreen();
      }
    });
    viewModel.getLocation();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, LocationViewModel viewModel) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: false,
            leading: Container(
              margin: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            title: Container(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      height: 43,
                      child: TextFormField(
                        autofocus: false,
                        focusNode: focusSearch,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Select Address',
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: hintTextStyle,
                          contentPadding: fieldPadding,
                          enabledBorder: searchBoder,
                          focusedBorder: searchBoder,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/loca5.png',
                              fit: BoxFit.contain,
                              height: 10,
                              width: 10,
                            ),
                          ),
                        ),
                      )),
                )
              ],
            )),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: SelectLocationButton((type) async {
            if (type == OnClickSelectLocationType.CURRENT_LOCATION) {
              Get.dialog(
                LoadingFullscreen(
                  backgroundColor: Colors.black45,
                ),
                barrierDismissible: kDebugMode,
              );

              await viewModel.chooseFromCurrentLocation();
            } else {
              openMapScreen();
            }
          }),
        ),
        body: Obx(() {
          if (viewModel.address.value == null) {
            return LoadingFullscreen();
          } else {
            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/images/Location.png',
                              fit: BoxFit.contain,
                              height: 122,
                              width: 222,
                            ),
                          ),
                          Text(
                            'Location',
                            style: TextStyle(
                                color: Color(0xFF132150),
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Kanit'),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Add main place',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 24),
                            child: Text(
                              'to provide you with faster service',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 70,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(fontSize: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                side: BorderSide(
                                  width: 0.0,
                                  color: Colors.grey,
                                ),
                              ),
                              onPressed: () {
                                Get.offAll(MainScreen());
                              },
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Kanit'),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            );
          }
        }));
  }

  openMapScreen() {
    Get.to(ChooseLocationByMapScreen())?.then((value) {
      if (value != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddNewAddressScreen(currentAddress: value)),
        );
      }
    });
  }
}

class LocationViewModel extends GetxController {
  var address = AddressResponse().obs;

  AddressResponse? currentLocation;

  var redirectToMapScreen = false.obs;
  var redirectToAddNewAddressScreen = false.obs;

  Future getLocation() async {
    address.value = await getCurrentLocation();
  }

  Future chooseFromCurrentLocation() async {
    await getLocation();
    await searchByLatLng(address.value);
  }

  Future searchByLatLng(AddressResponse item) async {
    redirectToAddNewAddressScreen.value = false;
    redirectToMapScreen.value = false;

    SearchPlaceRepository searchPlaceRepository = appModule.get();
    var data = await searchPlaceRepository.searchByLatLng(
        item.lat ?? 0, item.lng ?? 0,);

    if (data.isEmpty == true) {
      redirectToMapScreen.value = true;
    } else {
      currentLocation = data.first;
      redirectToAddNewAddressScreen.value = true;
    }
  }
}
