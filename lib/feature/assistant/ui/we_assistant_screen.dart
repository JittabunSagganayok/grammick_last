import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/selectTime.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLocation.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/assistant/ui/we_assistant_viewmodel.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/activity/assistant/service_category_response.dart';
import 'package:we_link/models/address/my_address_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../../views/main_screen.dart';
import 'assistant_recipient_screen.dart';

class WeAssistantScreen extends StatefulWidget {
  WeAssistantScreen({Key? key}) : super(key: key);

  @override
  State<WeAssistantScreen> createState() => _WeAssistantScreenState();
}

class _WeAssistantScreenState
    extends AppState<WeAssistantScreen, WeAssistantViewModel> {
  GoogleMapController? mapController;

  var formKey = GlobalKey<FormState>();

  @override
  WeAssistantViewModel initViewModel(WeAssistantViewModel viewModel) {
    viewModel.initLocation();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, WeAssistantViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: blackColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          shape: appbarBorder,
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.only(left: 5),
            child: IconButton(
              onPressed: () async {
                navigator?.pop();
                Get.to(MainScreen());
              },
              icon: Image.asset('assets/images/goBack.png'),
            ),
          ),
          title: Text(
            'We Assistant',
            style: titleYellowAppbar,
          ),
        ),
      ),
      body: Obx(() {
        if (viewModel.loading.value == true) {
          return LoadingFullscreen();
        } else {
          return Container(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    height: 56,
                    child: Obx(() => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: viewModel.tabList.entries.map((e) {
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    formKey.currentState?.reset();
                                    viewModel.setTabSelected(e);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: e.value == true
                                          ? const Color(0xff3BCC53)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      e.key,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.kanit(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: e.value == true
                                              ? Colors.white
                                              : const Color(0xff999999)),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )),
                  ),
                  Expanded(
                      child: Obx(() => GoogleMap(
                        zoomGesturesEnabled: true,
                        // zoomControlsEnabled: true,
                        myLocationButtonEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: viewModel.isSelectedAddress.value == true ? viewModel.getPickUpLatLng() : viewModel.currentLocation,
                          zoom: 16.5,
                        ),
                        markers: viewModel.currentMarker,
                        mapType: MapType.normal,
                        onMapCreated: (controller) {
                          setState(() {
                            mapController = controller;
                          });
                        },
                      ))),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SelectTimeWidget(),
                          SizedBox(
                            height: 21,
                          ),
                          Container(
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
                                    child: Obx(() {
                                      if (viewModel.isWeFixSelected.isTrue) {
                                        return SvgPicture.asset(
                                          'assets/icons/ic_activity_destination.svg',
                                          width: 16,
                                          height: 16,
                                        );
                                      } else {
                                        return SvgPicture.asset(
                                          'assets/icons/ic_we_fix_start.svg',
                                          width: 16,
                                          height: 16,
                                        );
                                      }
                                    }),
                                  ),
                                  Expanded(
                                    child: Container(child: Obx(() {
                                      var address = viewModel.pickupAddress.value.name;
                                      var title = viewModel.isWeFixSelected.isTrue ? address ?? "Home" : address ?? "Start";
                                      return TextFormField(
                                        readOnly: true,
                                        onTap: () {
                                          Get.to(SearchLocationScreen(
                                            searchLocationBy: SearchLocationBy.RENT,
                                            address: AddressResponse(),
                                            onSelectAddress: (
                                              pickUpAddress,
                                              destinationAddress,
                                            ) {
                                              viewModel.isSelectedAddress.value = true;
                                              viewModel.pickupAddress.value = pickUpAddress;
                                            },
                                          ));
                                        },
                                        validator: (text) {
                                          if (text == 'Home' || text == 'Start') {
                                            return 'Please Select Your Address';
                                          }
                                        },
                                        controller: TextEditingController(text: title),
                                        style: bottomReviewText,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      );
                                    })),
                                  ),
                                ],
                              )),
                          Obx(() {
                            if (viewModel.isWeFixSelected.isTrue) {
                              return GestureDetector(
                                onTap: () async {
                                  await Get.bottomSheet(
                                      ServiceCategorySheet(
                                          viewModel.serviceCategoryList.value),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16))));

                                  viewModel.checkSelectedServiceCategory();
                                },
                                child: Container(
                                    height: 43,
                                    margin:
                                        EdgeInsets.only(right: 20, bottom: 15),
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
                                            child: SvgPicture.asset(
                                              'assets/icons/ic_service_category.svg',
                                              width: 16,
                                              height: 16,
                                            )),
                                        Expanded(
                                          child: Container(
                                              child: Obx(() => Text.rich(
                                                    TextSpan(
                                                      text: viewModel
                                                          .serviceCategory
                                                          .value,
                                                      style: bottomReviewText,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ))),
                                        ),
                                      ],
                                    )),
                              );
                            } else {
                              return Container(
                                  height: 43,
                                  margin:
                                      EdgeInsets.only(right: 20, bottom: 15),
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
                                          child: SvgPicture.asset(
                                            'assets/icons/ic_we_fix_destination.svg',
                                            width: 16,
                                            height: 16,
                                          )),
                                      Expanded(
                                        child: Container(
                                            child: Obx(() => TextFormField(
                                                  readOnly: true,
                                                  validator: (text) {
                                                    if (text == 'Destination') {
                                                      return 'Please Select Your Address';
                                                    }
                                                  },
                                                  controller: TextEditingController(
                                                      text: viewModel
                                                              .destinationAddress
                                                              .value
                                                              .name ??
                                                          "Destination"),
                                                  style: bottomReviewText,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  onTap: () {
                                                    Get.to(SearchLocationScreen(
                                                      searchLocationBy:
                                                          SearchLocationBy.RENT,
                                                      address:
                                                          AddressResponse(),
                                                      onSelectAddress: (
                                                        pickUpAddress,
                                                        destinationAddress,
                                                      ) {
                                                        viewModel
                                                            .destinationAddress
                                                            .value = pickUpAddress;
                                                      },
                                                    ));
                                                  },
                                                ))),
                                      ),
                                    ],
                                  ));
                            }
                          }),
                          Obx(() {
                            if (viewModel.isWeFixSelected.isTrue) {
                              return Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  margin:
                                      EdgeInsets.only(bottom: 15, right: 20),
                                  width: MediaQuery.of(context).size.width * 1,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 12, bottom: 12),
                                            child: SvgPicture.asset(
                                              'assets/icons/ic_fix_more_detail.svg',
                                              width: 16,
                                              height: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: Container(
                                                child: Obx(() => TextFormField(
                                                      readOnly: true,
                                                      validator: (text) {
                                                        if (text ==
                                                            'More details') {
                                                          return 'Please Enter More Detail';
                                                        }
                                                      },
                                                      controller: TextEditingController(
                                                          text: viewModel
                                                                      .moreDetail
                                                                      .value
                                                                      .isEmpty ==
                                                                  true
                                                              ? 'More details'
                                                              : viewModel
                                                                  .moreDetail
                                                                  .value),
                                                      style: bottomReviewText,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      onTap: () async {
                                                        displayMoreDetailDialog();
                                                      },
                                                    ))),
                                          ),
                                        ],
                                      ),
                                      Obx(() {
                                        if (viewModel.weFixImage.isNotEmpty) {
                                          return Container(
                                            margin: EdgeInsets.only(top: 32),
                                            height: 64,
                                            child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      Divider(
                                                indent: 8,
                                                endIndent: 8,
                                              ),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final filePath =
                                                    viewModel.weFixImage[index];
                                                return Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      child: ExtendedImage.file(
                                                        File(filePath),
                                                        width: 64,
                                                        height: 64,
                                                        border: Border.all(
                                                            width: 1,
                                                            color: Color(
                                                                0xffF9AC12)),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      child: GestureDetector(
                                                        child: Container(
                                                          child: const Icon(
                                                              Icons.remove,
                                                              size: 16),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Color(
                                                                      0xffFD2E2E)),
                                                          padding:
                                                              EdgeInsets.all(4),
                                                        ),
                                                        onTap: () {
                                                          viewModel.weFixImage
                                                              .remove(filePath);
                                                        },
                                                      ),
                                                      top: 4,
                                                      right: 4,
                                                    )
                                                  ],
                                                );
                                              },
                                              itemCount:
                                                  viewModel.weFixImage.length,
                                              shrinkWrap: true,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return SizedBox(
                                            height: 0,
                                          );
                                        }
                                      })
                                    ],
                                  ));
                            } else {
                              return Container(
                                  height: 43,
                                  margin:
                                      EdgeInsets.only(right: 20, bottom: 15),
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
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_we_fix_time.svg',
                                          width: 16,
                                          height: 16,
                                        ),
                                      ),
                                      // How Long ?
                                      Expanded(
                                        child: Container(
                                            child: Obx(() => TextFormField(
                                                  readOnly: true,
                                                  validator: (text) {
                                                    if (text == 'How Long ?') {
                                                      return 'Please Estimate Your Time';
                                                    }
                                                  },
                                                  controller: TextEditingController(
                                                      text: viewModel
                                                                  .estimateTimeText
                                                                  .value
                                                                  .isEmpty ==
                                                              true
                                                          ? 'How Long ?'
                                                          : viewModel
                                                              .estimateTimeText
                                                              .value),
                                                  onTap: () async {
                                                    await showDurationTimerPicker(
                                                        context, onSelected:
                                                            (MapEntry<String,
                                                                    num>?
                                                                data) {
                                                      if (data != null) {
                                                        viewModel
                                                            .estimateTimeText
                                                            .value = data!.key;
                                                        viewModel
                                                                .estimateTimeValue
                                                                .value =
                                                            data.value.toInt();
                                                      }
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  style: bottomReviewText,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                ))),
                                      ),
                                    ],
                                  ));
                            }
                          }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 80,
          child: Container(
            height: 56,
            padding: EdgeInsets.all(16),
            width: Get.width,
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
                if (formKey.currentState!.validate()) {
                  Get.to(
                    AssistantRecipientScreen(),
                    arguments: viewModel.createRequest(),
                  );
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
        ),
      ),
    );
  }

  Future displayMoreDetailDialog() async {
    var result = await Get.to(Container(color: Colors.white,
        child: WeFixMoreDetailSheet(
          viewModel.moreDetail.value,
          viewModel.weFixImage.value,
          viewModel.offerPrice.value.toString(),
        ),
      ),
      transition: Transition.downToUp,
    );
    if (result != null && result is WeFixMoreDetailResult) {
      viewModel.moreDetail.value = result.moreDetail;
      viewModel.offerPrice.value = result.offerPrice;
      viewModel.weFixImage.value = result.images ?? [];
    }
  }
}

Future showDurationTimerPicker(
  BuildContext context, {
  required Function(MapEntry<String, num>?) onSelected,
}) async {
  return await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return TimePicker(
          onSelected: onSelected,
        );
      });
}

class TimePicker extends StatelessWidget {
  Function(MapEntry<String, num>?) onSelected;

  TimePicker({
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimePickerViewModel>(
      init: TimePickerViewModel(),
      builder: (TimePickerViewModel controller) {
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
                        margin: EdgeInsets.only(top: 24),
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
                            children: controller.timeList.entries
                                .map((e) => Center(
                                        child: Text(
                                      e.key,
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF132150),
                                          fontFamily: 'Kanit'),
                                    )))
                                .toList(),
                            onSelectedItemChanged: (value) {
                              controller.setEstimateTimeSelected(value);
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
                            child: Text('Time', style: selectTimeTitle),
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
                            Navigator.of(context).pop();
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
                            onSelected.call(controller.data);
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
      },
    );
  }
}

class TimePickerViewModel extends GetxController {
  Map<String, num> timeList = {
    "30 Mins": 30,
    "1 Hours": 60,
    "1.30 MinHourss": 90,
    "2 Hours": 120,
    "2.30 Hours": 150,
  };

  String timeSelected = '';
  num timeValue = 0;

  MapEntry<String, num>? data;

  void setEstimateTimeSelected(int value) {
    data = timeList.entries.toList()[value] as MapEntry<String, num>?;
  }
}

class ServiceCategorySheet extends StatefulWidget {
  List<ServiceCategory> serviceCategory;

  ServiceCategorySheet(this.serviceCategory);

  @override
  State<ServiceCategorySheet> createState() =>
      _ServiceCategorySheetState(serviceCategory);
}

class _ServiceCategorySheetState extends State<ServiceCategorySheet> {
  List<ServiceCategory> serviceCategory;

  _ServiceCategorySheetState(this.serviceCategory);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                "Service Category",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                primary: false,
                itemCount: serviceCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = serviceCategory[index];
                  return ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onTap: () {
                      setState(() {
                        for (var element in serviceCategory) {
                          element.selected = false;
                        }
                        serviceCategory[index].selected = true;
                      });
                    },
                    tileColor:
                        item.selected ? Color(0xff189B58) : Color(0xffF8F8F8),
                    title: Text(
                      item.name ?? "",
                      style: GoogleFonts.kanit(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: item.selected ? Colors.white : Colors.black),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 16,
                  color: Colors.transparent,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 32),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
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
                        Navigator.of(context).pop();
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
  }
}

class WeFixMoreDetailSheet extends StatefulWidget {
  String moreDetail, offer;
  List<String> images;

  WeFixMoreDetailSheet(
    this.moreDetail,
    this.images,
    this.offer,
  );

  @override
  State<WeFixMoreDetailSheet> createState() => _WeFixMoreDetailSheetState(
        moreDetail,
        offer,
        images,
      );
}

class _WeFixMoreDetailSheetState extends State<WeFixMoreDetailSheet> {
  String moreDetail, offer;
  List<String> images;

  _WeFixMoreDetailSheetState(this.moreDetail, this.offer, this.images);

  TextEditingController moreDetailController = TextEditingController();
  TextEditingController offerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    moreDetailController.text = moreDetail;
    offerController.text = offer;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/ic_fix_more_detail.svg'),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'More details',
                      style: GoogleFonts.kanit(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 1,
                        color: Color(0xffEBEBEB),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: moreDetailController,
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                'Add details such as car repair, make, model ',
                            hintStyle: GoogleFonts.inter(
                              color: Color(0xff8A8A8A),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Builder(
                        builder: (BuildContext context) {
                          if (images.isNotEmpty) {
                            return Container(
                              margin: EdgeInsets.only(top: 32),
                              height: 64,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder:
                                    (BuildContext context, int index) => Divider(
                                  indent: 8,
                                  endIndent: 8,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  final filePath = images[index];
                                  return Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: ExtendedImage.file(
                                          File(filePath),
                                          width: 64,
                                          height: 64,
                                          border: Border.all(
                                              width: 1, color: Color(0xffF9AC12)),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        child: GestureDetector(
                                          child: Container(
                                            child: const Icon(Icons.remove,
                                                size: 16),
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffFD2E2E)),
                                            padding: EdgeInsets.all(4),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              images.remove(filePath);
                                            });
                                          },
                                        ),
                                        top: 4,
                                        right: 4,
                                      )
                                    ],
                                  );
                                },
                                itemCount: images.length,
                                shrinkWrap: true,
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: 0,
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () async {
                          var pickFile = await FilePicker.platform.pickFiles(
                              type: FileType.image, allowMultiple: true);

                          if (pickFile != null) {
                            for (int index = 0;
                                index < pickFile.files.length;
                                index++) {
                              var element = pickFile.files[index];
                              images.add(element.path ?? "");
                            }
                          }

                          setState(() {});
                        },
                        icon: Icon(Icons.image))
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      'Offer',
                      style: GoogleFonts.kanit(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 1,
                        color: Color(0xffEBEBEB),
                      )),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'You can set your own price.',
                            hintStyle: GoogleFonts.inter(
                              color: Color(0xff8A8A8A),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                        controller: offerController,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true,),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(
                  WeFixMoreDetailResult(
                    moreDetail: moreDetailController.text,
                    offerPrice: offerController.text,
                    images: images,
                  ),
                );
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
        ),
      ),
    );
  }
}

class WeFixMoreDetailResult {
  String moreDetail;
  String offerPrice;
  List<String>? images;

  WeFixMoreDetailResult({
    required this.moreDetail,
    required this.offerPrice,
    this.images,
  });
}
