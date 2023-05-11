import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/confirmLocation.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/bodySearchLo.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/core/data/search_place_repository.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/helper/app_helper.dart';
import 'package:we_link/models/address/my_address_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:we_link/shared/location/select_location_button.dart';

import '../../../../di/app_module.dart';
import '../../../signin/map.dart';

enum SearchLocationBy { RIDE, DRIVE_YOUR_CAR, RENT }

enum SelectLocationType { PICK_UP, FIRST_DESTINATION, SECOND_DESTINATION }

class SearchLocationScreen extends StatefulWidget {
  AddressResponse? address;
  DateTime? bookingAdvance;
  SearchLocationBy searchLocationBy;
  Function(AddressResponse, AddressResponse?)? onSelectAddress;

  SearchLocationScreen({
    required this.searchLocationBy,
    this.address,
    this.bookingAdvance,
    this.onSelectAddress,
  });

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState
    extends AppState<SearchLocationScreen, SearchLocationViewModel> {
  TextEditingController pickUpAtController = TextEditingController();
  TextEditingController firstDestinationController = TextEditingController();
  TextEditingController secondDestinationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pickUpAtController.addListener(() {
      if (pickUpAtController.text.isEmpty == true) {
        viewModel.searchAddress('');
      }
      viewModel.isSelectPickUp.value = true;
      viewModel.isSelectFirstDestination.value = false;
      viewModel.isSelectMultipleDestinationAddress.value = false;
    });

    firstDestinationController.addListener(() {
      if (firstDestinationController.text.isEmpty == true) {
        viewModel.searchAddress('');
      }
      viewModel.isSelectPickUp.value = false;
      viewModel.isSelectFirstDestination.value = true;
      viewModel.isSelectMultipleDestinationAddress.value = false;
    });

    secondDestinationController.addListener(() {
      if (secondDestinationController.text.isEmpty == true) {
        viewModel.searchAddress('');
      }
      viewModel.isSelectPickUp.value = false;
      viewModel.isSelectFirstDestination.value = false;
      viewModel.isSelectMultipleDestinationAddress.value = true;
    });
  }

  @override
  SearchLocationViewModel initViewModel(SearchLocationViewModel viewModel) {
    viewModel.currentLocation.listen((p0) {
      pickUpAtController.text = p0.name ?? '';
    });

    viewModel.pickUpAddress.listen((result) {
      if (widget.searchLocationBy == SearchLocationBy.RENT) {
        if (viewModel.firstInit == false) {
          widget.onSelectAddress?.call(result, null);
          navigator?.pop();
        }

        viewModel.firstInit = false;
      } else {
        pickUpAtController.text = result.name ?? '';
      }
    });

    viewModel.firstDestinationAddress.listen((result) {
      firstDestinationController.text = result.name ?? '';

      if (widget.searchLocationBy == SearchLocationBy.DRIVE_YOUR_CAR) {
        widget.onSelectAddress?.call(viewModel.pickUpAddress.value, result);
        navigator?.pop();
      } else {
        if (viewModel.isSelectMultipleDestinationAddress.value == false) {
          Get.to(ConfirmLocationScreen(
            pickUpAddress: viewModel.pickUpAddress.value,
            destinationAddress: [viewModel.firstDestinationAddress.value],
            bookingAdvance: viewModel.bookingAdvance,
          ));
        }
      }
    });

    viewModel.secondDestinationAddress.listen((p0) {
      secondDestinationController.text = p0.name ?? '';

      Get.to(ConfirmLocationScreen(
        pickUpAddress: viewModel.pickUpAddress.value,
        destinationAddress: [
          viewModel.firstDestinationAddress.value,
          viewModel.secondDestinationAddress.value,
        ],
        bookingAdvance: viewModel.bookingAdvance,
      ));
    });

    viewModel.getLocation(widget.address, widget.searchLocationBy);
    viewModel.setBookingAdvance(widget.bookingAdvance);

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, SearchLocationViewModel viewModel) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: blackColor,
          automaticallyImplyLeading: false,
          // shape: widget.DriveYourCar == 1 ? appbarBorder : null,
          elevation: 0,
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
          actions: [
            /*
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: Image.asset(
                'assets/images/map2.png',
                fit: BoxFit.contain,
                height: 20,
                width: 20,
              ),
            )*/
          ],
          title: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      // margin: EdgeInsets.only(left: ),
                      height: 43,
                      child: _buildPickUpTextField()),
                )
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (viewModel.loading.value) {
          return LoadingFullscreen();
        } else {
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    // height: 60,
                    constraints: maxHeightContain,
                    decoration: const BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(37),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: Stack(
                        children: [
                          Column(children: [
                            const SizedBox(
                              height: 18,
                              child: DottedLine(
                                direction: Axis.vertical,
                                dashColor: Colors.white,
                                dashLength: 4,
                                dashGapLength: 4,
                                lineThickness: 4,
                                dashRadius: 7,
                              ),
                            ),
                            Row(
                              children: [
                                Obx(() {
                                  if (viewModel
                                          .isSelectMultipleDestinationAddress
                                          .value ==
                                      false) {
                                    return const SizedBox(
                                      height: 0,
                                    );
                                  } else {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          left: 29, right: 29),
                                      child: const Text(
                                        'p1',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Kanit',
                                            color: Color(0xFFBABABA)),
                                      ),
                                    );
                                  }
                                }),
                                if (widget.searchLocationBy !=
                                    SearchLocationBy.RENT) ...[
                                  Expanded(
                                    child: Obx(() => Container(
                                        margin: viewModel
                                                    .isSelectMultipleDestinationAddress
                                                    .value ==
                                                false
                                            ? const EdgeInsets.only(
                                                left: 74, right: 50)
                                            : const EdgeInsets.only(right: 10),
                                        height: 43,
                                        child: Builder(builder: (context) {
                                          return _buildFirstDestinationTextField();
                                        }))),
                                  )
                                ],
                                Obx(() => viewModel
                                            .isSelectMultipleDestinationAddress
                                            .value ==
                                        false
                                    ? Container()
                                    : Container(
                                        margin: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            var firstVal =
                                                firstDestinationController.text;
                                            firstDestinationController.text =
                                                secondDestinationController
                                                    .text;
                                            secondDestinationController.text =
                                                firstVal;
                                          },
                                          child: Image.asset(
                                            'assets/images/change.png',
                                            fit: BoxFit.contain,
                                            height: 29,
                                            width: 29,
                                          ),
                                        ),
                                      )),
                              ],
                            ),
                            if (widget.searchLocationBy ==
                                SearchLocationBy.RIDE) ...[
                              Obx(() {
                                if (viewModel.isSelectMultipleDestinationAddress
                                        .value ==
                                    false) {
                                  return GestureDetector(
                                    onTap: () {
                                      viewModel
                                          .isSelectMultipleDestinationAddress
                                          .value = true;
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 74, right: 50, top: 16),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            child: Image.asset(
                                              'assets/images/add.png',
                                              fit: BoxFit.contain,
                                              color: yellowColor,
                                              height: 16,
                                              width: 16,
                                            ),
                                          ),
                                          const Text(
                                            'More destination',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Kanit',
                                                color: yellowColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox(
                                    height: 0,
                                  );
                                }
                              }),
                              Obx(() {
                                if (viewModel.isSelectMultipleDestinationAddress
                                        .value ==
                                    true) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      const SizedBox(
                                        height: 18,
                                        child: DottedLine(
                                          direction: Axis.vertical,
                                          dashColor: Colors.white,
                                          dashLength: 4,
                                          dashGapLength: 4,
                                          lineThickness: 4,
                                          dashRadius: 7,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 29, right: 29),
                                            child: const Text(
                                              'p2',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Kanit',
                                                  color: Color(0xFFBABABA)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 50),
                                                height: 43,
                                                child:
                                                    _buildSecondDestinationTextField()),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return const SizedBox(
                                    height: 0,
                                  );
                                }
                              }),
                            ]
                          ]),
                          Obx(() {
                            if (viewModel
                                    .isSelectMultipleDestinationAddress.value ==
                                false) {
                              return Positioned(
                                right: 20,
                                bottom: 50,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/line.png',
                                      fit: BoxFit.fill,
                                      height: 50,
                                      width: 40,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox(
                                height: 0,
                              );
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    const SizedBox(
                      height: 10,
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
                          showMore: viewModel
                              .isSelectMultipleDestinationAddress.value,
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
                  ]))),
                  Container(
                    color: Colors.white,
                    child: SelectLocationButton((type) {
                      if (type == OnClickSelectLocationType.CURRENT_LOCATION) {
                        viewModel.chooseAddressFromCurrentLocation(
                            widget.searchLocationBy);
                      } else {
                        Get.to(ChooseLocationByMapScreen())?.then((value) {
                          if (value != null && value is AddressResponse) {
                            viewModel.setAddressSelected(value);
                          }
                        });
                      }
                    }),
                  )
                ],
              ),
            ],
          );
        }
      }),
    );
  }

  Widget _buildPickUpTextField() {
    return TextFormField(
      autofocus: false,
      controller: pickUpAtController,
      onTap: () async {
        viewModel.isSelectPickUp.value = true;
        viewModel.isSelectFirstDestination.value = false;
        viewModel.isSelectMultipleDestinationAddress.value = false;
      },
      onFieldSubmitted: (text) {
        viewModel.searchAddress(text);
      },
      keyboardType: TextInputType.text,
      style: const TextStyle(
          color: Color(0xFF4B4B4B),
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: 'Kanit'),
      decoration: InputDecoration(
        hintText: 'Select Address',
        fillColor: Colors.white,
        filled: true,
        hintStyle: hintTextStyle,
        contentPadding: fieldPadding,
        enabledBorder: searchBoder,
        focusedBorder: searchBoder,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/yourLo.png',
            fit: BoxFit.contain,
            height: 10,
            width: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildFirstDestinationTextField() {
    return TextFormField(
      autofocus: true,
      controller: firstDestinationController,
      onFieldSubmitted: (text) {
        viewModel.searchAddress(text);
      },
      onTap: () async {
        viewModel.isSelectPickUp.value = false;
        viewModel.isSelectFirstDestination.value = true;
        viewModel.isSelectMultipleDestinationAddress.value = false;
      },
      keyboardType: TextInputType.text,
      style: const TextStyle(
          color: Color(0xFF4B4B4B),
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: 'Kanit'),
      decoration: InputDecoration(
        hintText: 'Where you go?',
        fillColor: Colors.white,
        filled: true,
        hintStyle: hintTextStyle,
        contentPadding: fieldPadding,
        enabledBorder: searchBoder,
        focusedBorder: searchBoder,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/assis.png',
            fit: BoxFit.contain,
            height: 10,
            width: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildSecondDestinationTextField() {
    return TextFormField(
      onTap: () async {
        viewModel.isSelectPickUp.value = false;
        viewModel.isSelectFirstDestination.value = false;
        viewModel.isSelectMultipleDestinationAddress.value = true;
      },
      onFieldSubmitted: (text) {
        viewModel.searchAddress(text);
      },
      autofocus: false,
      controller: secondDestinationController,
      keyboardType: TextInputType.text,
      style: const TextStyle(
          color: Color(0xFF4B4B4B),
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: 'Kanit'),
      decoration: InputDecoration(
          hintText: 'Where you go?',
          fillColor: Colors.white,
          filled: true,
          hintStyle: hintTextStyle,
          contentPadding: fieldPadding,
          enabledBorder: searchBoder,
          focusedBorder: searchBoder,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/images/loca3.png',
              fit: BoxFit.contain,
              height: 10,
              width: 10,
            ),
          ),
          suffixIcon: GestureDetector(
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
              secondDestinationController.clear();
              // viewModel.isSelectMultipleDestinationAddress.value = false;
              // viewModel.isSelectFirstDestinationAddress.value = true;
            },
          )),
    );
  }
}

class LocationNotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/location_not_found.png',
          width: 173,
          height: 173,
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          'Your Destination not found.',
          style: GoogleFonts.kanit(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Color(0xff636363)),
        )
      ],
    );
  }
}

class SearchLocationViewModel extends GetxController {
  Dio dio;

  DateTime? bookingAdvance;

  SearchLocationViewModel(
    this.dio,
    this.searchPlaceRepository,
  );

  var searching = false.obs;
  var locationNotFound = false.obs;

  var addressList = <AddressResponse>[].obs;
  SearchPlaceRepository searchPlaceRepository;

  LatLng? myLocation;

  var firstInit = true;

  var favList = <AddressResponse>[].obs;
  var recentList = <AddressResponse>[].obs;

  var loading = false.obs;

  var currentLocation = AddressResponse().obs;

  var isSelectPickUp = true.obs;
  var isSelectFirstDestination = false.obs;
  var isSelectMultipleDestinationAddress = false.obs;

  var pickUpAddress = AddressResponse().obs;
  var firstDestinationAddress = AddressResponse().obs;
  var secondDestinationAddress = AddressResponse().obs;

  var isWriting = false.obs;

  Future getLocation(
    AddressResponse? address,
    SearchLocationBy searchLocationBy,
  ) async {
    loading.value = true;
    myLocation = LatLng(homeAddress?.lat ?? 0, homeAddress?.lng ?? 0);

    if (address != null) {
      currentLocation.value = address;
    } else {
      currentLocation.value = homeAddress!;
    }

    setAddressSelected(
      currentLocation.value,
      searchLocationBy: searchLocationBy,
    );

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

  Future init() async {
    myLocation = await getMyLocation();
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
    AddressResponse item, {
    SearchLocationBy searchLocationBy = SearchLocationBy.RIDE,
  }) {
    if (isSelectPickUp.value == true) {
      pickUpAddress.value = item;
    } else {
      if (isSelectPickUp.value == false &&
          isSelectFirstDestination.value == true) {
        firstDestinationAddress.value = item;
      } else {
        secondDestinationAddress.value = item;
      }
    }
  }

  void setFavouriteAddressSelected(AddressResponse item) async {
    setAddressSelected(item);
  }

  void chooseAddressFromCurrentLocation(
    SearchLocationBy searchLocationBy,
  ) async {
    var location = await getCurrentLocation();
    setAddressSelected(
      location,
      searchLocationBy: searchLocationBy,
    );
  }

  void setBookingAdvance(DateTime? bookingAdvance) {
    this.bookingAdvance = bookingAdvance;
  }
}
