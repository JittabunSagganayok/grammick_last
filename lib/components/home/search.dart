import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/searchComponents/searchMenu.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/bodySearchLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLocation.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';

import '../../core/data/search_place_repository.dart';
import '../../helper/app_helper.dart';
import '../../models/address/my_address_response.dart';

class HomeSearchScreen extends StatefulWidget {
  HomeSearchScreen({Key? key, this.DriveYourCar}) : super(key: key);
  final int? DriveYourCar;

  @override
  State<HomeSearchScreen> createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState
    extends AppState<HomeSearchScreen, HomeSearchViewModel> {
  var pickUpAtController = TextEditingController();

  @override
  HomeSearchViewModel initViewModel(HomeSearchViewModel viewModel) {
    viewModel.getLocation();

    pickUpAtController.addListener(() {
      if (pickUpAtController.text.isEmpty == true) {
        viewModel.searchAddress('');
      }
    });

    viewModel.pickUpAddress.listen((result) {
      Get.off(SearchLocationScreen(
        address: result,
        searchLocationBy: SearchLocationBy.RIDE,
      ));
    });

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, HomeSearchViewModel viewModel) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
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
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 43,
                    child: TextFormField(
                      autofocus: true,
                      controller: pickUpAtController,
                      onFieldSubmitted: (text){
                        viewModel.searchAddress(text);
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Search',
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: hintTextStyle,
                          contentPadding: fieldPadding,
                          enabledBorder: searchBoder,
                          focusedBorder: searchBoder,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.search,
                              color: Color(0xFF303030),
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/images/close.png',
                                fit: BoxFit.contain,
                                height: 10,
                                width: 10,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )),
                    )),
              )
            ],
          )),
        ),
        body: Column(
          children: [
            searchMenu(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      pickUpAtController.text.isNotEmpty
                          ? Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 29, bottom: 10),
                              child: Text(
                                "Result",
                                style: resultText,
                              ),
                            )
                          : Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 29, bottom: 10),
                              child: Text(
                                "Recent",
                                style: resultText,
                              ),
                            ),
                      Obx(() {
                        if (viewModel.locationNotFound.value == true) {
                          return SizedBox(
                            height: Get.height / 2,
                            child: LocationNotFoundScreen(),
                          );
                        }
                        if (viewModel.searching.value == false &&
                            viewModel.addressList.isEmpty == true) {
                          return bodySearchLo(
                            showMore: false,
                            favList: viewModel.favList,
                            recentList: viewModel.recentList,
                            onClickListener: (item) {
                              viewModel.setAddressSelected(item);
                            },
                            onClickBookmark: (item) {},
                          );
                        } else {
                          if (viewModel.searching.value == true) {
                            return SizedBox(
                              height: Get.height / 2,
                              child: const Center(
                                  child: CircularProgressIndicator(
                                color: yellowColor,
                              )),
                            );
                          } else {
                            return Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                shrinkWrap: true,
                                primary: false,
                                itemCount: viewModel.addressList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final item = viewModel.addressList[index];
                                  return InkWell(
                                    onTap: () {
                                      viewModel.setAddressSelected(item);
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                'assets/images/loca2.png',
                                                fit: BoxFit.fill,
                                                height: 29,
                                                width: 19,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 13,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text.rich(
                                                      TextSpan(
                                                        text: item.name ?? "",
                                                        style: const TextStyle(
                                                            color:
                                                                Color(0xFF4B4B4B),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily: 'Kanit'),
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text.rich(
                                                      TextSpan(
                                                        text: item.address ?? "",
                                                        style: const TextStyle(
                                                            color:
                                                                Color(0xFFACACAC),
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: 'Kanit'),
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(
                                  height: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                            );
                          }
                        }
                      })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeSearchViewModel extends GetxController {
  Dio dio;
  SearchPlaceRepository searchPlaceRepository;

  HomeSearchViewModel(this.dio, this.searchPlaceRepository);

  var pickUpAddress = AddressResponse().obs;

  var loading = false.obs;
  var searching = false.obs;
  var locationNotFound = false.obs;

  var addressList = <AddressResponse>[].obs;

  var favList = <AddressResponse>[].obs;
  var recentList = <AddressResponse>[].obs;
  LatLng? myLocation;

  Future getLocation() async {
    loading.value = true;

    myLocation = await getMyLocation();

    var mySaveLocation = await Future.wait([
      dio.get('address/favorite'),
      dio.get('address/recent'),
    ]);

    var favLocation = MyAddressResponse.fromJson(mySaveLocation[0].data);
    var recentLocation = MyAddressResponse.fromJson(mySaveLocation[1].data);

    favList.value = favLocation.result ?? [];
    recentList.value = recentLocation.result ?? [];

    loading.value = false;
  }

  Future searchAddress(
    String keyword,
  ) async {
    addressList.clear();
    searching.value = true;
    locationNotFound.value = false;

    if (keyword.isEmpty == true) {
      searching.value = false;
      addressList.clear();
      return;
    }

    try {
      var response =
          await searchPlaceRepository.searchByPlace(keyword, myLocation!);
      addressList.value = response;

      locationNotFound.value = response.isEmpty == true;

      searching.value = false;
    } catch (e) {
      searching.value = false;
    }
  }

  void setAddressSelected(
    AddressResponse item,
  ) {
    pickUpAddress.value = item;
  }
}
