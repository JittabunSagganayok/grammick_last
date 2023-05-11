import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/bodySearchLo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLocation.dart';
import 'package:we_link/components/signin/addAddress.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/address/data/model/save_favourite_address_request.dart';
import 'package:we_link/feature/address/domain/usecase/save_favourite_address_usecase.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:we_link/shared/location/select_location_button.dart';

import '../../core/data/search_place_repository.dart';
import '../../di/app_module.dart';
import '../../models/address/my_address_response.dart';
import '../signin/map.dart';

class SelectAddressScreen extends StatefulWidget {
  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState
    extends AppState<SelectAddressScreen, SelectAddressViewModel> {
  TextEditingController editingController = TextEditingController();

  @override
  SelectAddressViewModel initViewModel(SelectAddressViewModel viewModel) {
    editingController.addListener(() {
      if (editingController.text.isEmpty == true) {
        viewModel.searchAddress('', true);
      }
    });

    viewModel.selectCurrentAddress.listen((selectAddress) {
      editingController.text = selectAddress.address ?? '';

      navigator?.pop(selectAddress);
    });

    viewModel.getLocation();

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, SelectAddressViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          backgroundColor: blackColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          shape: appbarBorder,
          centerTitle: false,
          leading: Container(
            margin: const EdgeInsets.only(left: 5),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset('assets/images/goBack.png'),
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    height: 43,
                    child: TextFormField(
                      autofocus: false,
                      controller: editingController,
                      onFieldSubmitted: (keyword) {
                        viewModel.searchAddress(keyword, true);
                      },
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
                          child: editingController.text.isNotEmpty
                              ? Image.asset(
                                  'assets/images/loca4.png',
                                  fit: BoxFit.contain,
                                  height: 10,
                                  width: 10,
                                )
                              : Image.asset(
                                  'assets/images/loca5.png',
                                  fit: BoxFit.contain,
                                  height: 10,
                                  width: 10,
                                ),
                        ),
                        suffixIcon: editingController.text.isNotEmpty
                            ? GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Image.asset(
                                    'assets/images/close.png',
                                    fit: BoxFit.contain,
                                    height: 10,
                                    width: 10,
                                  ),
                                ),
                                onTap: () {
                                  editingController.clear();
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                              )
                            : null,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
      body: Obx(() {
        if (viewModel.loading.value == true) {
          return LoadingFullscreen();
        } else {
          return Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () {
                              if (viewModel.locationNotFound.value == true) {
                                return SizedBox(
                                  width: Get.width,
                                  height: Get.height / 2,
                                  child: LocationNotFoundScreen(),
                                );
                              } else {
                                if (viewModel.searching.value == false &&
                                    viewModel.addressList.isEmpty == true) {
                                  return bodySearchLo(
                                    favList: viewModel.favList,
                                    recentList: viewModel.recentList,
                                    onClickListener: (item) {
                                      viewModel.setAddressSelected(item);
                                    },
                                    onClickBookmark: (item) {
                                      viewModel.addFavouriteAddress(
                                          response: item);
                                    },
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
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final item =
                                              viewModel.addressList[index];
                                          return InkWell(
                                            onTap: () {
                                              viewModel
                                                  .setAddressSelected(item);
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Text.rich(
                                                              TextSpan(
                                                                text:
                                                                    item.name ??
                                                                        "",
                                                                style: const TextStyle(
                                                                    color: Color(
                                                                        0xFF4B4B4B),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontFamily:
                                                                        'Kanit'),
                                                              ),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text.rich(
                                                              TextSpan(
                                                                text:
                                                                    item.address ??
                                                                        "",
                                                                style: const TextStyle(
                                                                    color: Color(
                                                                        0xFFACACAC),
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontFamily:
                                                                        'Kanit'),
                                                              ),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
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
                              }
                            },
                          )
                        ],
                      )),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      }),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SelectLocationButton((type) async {
          if (type == OnClickSelectLocationType.CURRENT_LOCATION) {
            viewModel.chooseFromCurrentLocation();
          } else {
            Get.to(ChooseLocationByMapScreen())?.then((value) {
              if (value != null && value is AddressResponse) {
                viewModel.setAddressSelected(value);
              }
            });
          }
        }),
      ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: () async {
            await Get.to(AddNewAddressScreen(
              currentAddress: null,
              keyword: 'searchAddress',
            ));
          },
          backgroundColor: Color(0xFF189B58),
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
    );
  }
}

class SelectAddressViewModel extends GetxController {
  Dio dio;
  SaveFavouriteAddressUseCaseImpl saveFavouriteAddressUseCaseImpl;
  SearchPlaceRepository searchPlaceRepository;

  SelectAddressViewModel(
    this.dio,
    this.searchPlaceRepository,
    this.saveFavouriteAddressUseCaseImpl,
  );

  var favList = <AddressResponse>[].obs;
  var recentList = <AddressResponse>[].obs;

  var loading = false.obs;
  var searching = false.obs;
  var locationNotFound = false.obs;

  var currentLocation = AddressResponse().obs;

  var selectCurrentAddress = AddressResponse().obs;
  var addressList = <AddressResponse>[].obs;

  Future getLocation() async {
    loading.value = true;

    currentLocation.value = homeAddress!;

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

  void setAddressSelected(AddressResponse item) {
    selectCurrentAddress.value = item;
  }

  Future searchAddress(
    String keyword,
    bool isSelectPickUp,
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
      var response = await searchPlaceRepository.searchByPlace(
        keyword,
        LatLng(homeAddress?.lat ?? 0, homeAddress?.lng ?? 0),
      );
      addressList.value = response;
      locationNotFound.value = response.isEmpty == true;
      searching.value = false;
    } catch (e) {
      searching.value = false;
    }
  }

  void clearAddress() {
    addressList.clear();
  }

  void setFavouriteAddressSelected(AddressResponse item) async {
    setAddressSelected(item);
  }

  void chooseFromCurrentLocation() async {
    setFavouriteAddressSelected(homeAddress!);
  }

  void addFavouriteAddress({
    required AddressResponse response,
  }) async {
    var request = SaveFavouriteAddressRequest(
      addressId: response.id,
      favorite: response.favorite == true,
    );

    await saveFavouriteAddressUseCaseImpl.saveFavouriteAddress(
        request: request);

    var mySaveLocation = await Future.wait([
      dio.get('address/favorite'),
    ]);

    var favLocation = MyAddressResponse.fromJson(mySaveLocation[0].data);
    favList.value = favLocation.result ?? [];
    refresh();
  }
}
