import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/feature/restaurant/ui/zone/restaurant_zone_detail_viewmodel.dart';

import '../../../../constant/colosrConstants.dart';
import '../../../../shared/appbar/we_app_bar.dart';
import '../../../../shared/loading/loading_fullscreen.dart';
import '../../../base/base_we_state.dart';
import '../../../booking/ui/table/booking_table_screen.dart';

class RestaurantZoneDetailArgument {
  num zoneId;
  num restaurantId;

  RestaurantZoneDetailArgument({
    required this.restaurantId,
    required this.zoneId,
  });
}

class RestaurantZoneDetailScreen extends StatefulWidget {
  @override
  State<RestaurantZoneDetailScreen> createState() =>
      _RestaurantZoneDetailScreenState();
}

class _RestaurantZoneDetailScreenState extends AppState<
    RestaurantZoneDetailScreen, RestaurantZoneDetailViewModel> {
  @override
  RestaurantZoneDetailViewModel initViewModel(
      RestaurantZoneDetailViewModel viewModel) {
    // viewModel.getZoneDetail(
    //   arguments: RestaurantZoneDetailArgument(
    //     restaurantId: 18,
    //     zoneId: 5,
    //   ),
    // );
    if (Get.arguments is RestaurantZoneDetailArgument) {
      viewModel.setArguments(Get.arguments);
      viewModel.getZoneDetail(
        arguments: Get.arguments,
      );
    }

    return viewModel;
  }

  @override
  Widget onCreateView(
      BuildContext context, RestaurantZoneDetailViewModel viewModel) {
    return Obx(() {
      if (viewModel.loading.isTrue) {
        return LoadingFullscreen();
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Builder(builder: (context) {
                  final zone = viewModel.zoneDetail.value;
                  return Stack(
                    children: [
                      Center(
                        child: ExtendedImage.network(
                          zone.image ?? "",
                          height: 272,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 32,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                  'assets/icon_close_sheet.svg'),
                              onPressed: () {
                                navigator?.pop();
                              },
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                            bottom: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff282828).withAlpha(0),
                                  Color(0xff141414).withAlpha(100),
                                  Color(0xff000000).withAlpha(100),
                                ]),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                zone.title ?? "",
                                style: GoogleFonts.kanit(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      zone.name ?? "",
                                      style: GoogleFonts.kanit(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Available 3/12',
                                      style: GoogleFonts.kanit(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff28CB77),
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                })
              ],
            ),
          ),
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
                    textStyle: const TextStyle(fontSize: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    side: const BorderSide(
                      width: 0.0,
                      color: yellowColor,
                    ),
                  ),
                  onPressed: () {
                    Get.to(
                      () => BookingTableScreen(),
                      transition: Transition.downToUp,
                      arguments: BookingTableArgument(
                        merchantId: viewModel.zoneDetail.value.merchantId!,
                        zoneId: viewModel.zoneDetail.value.id!,
                        tableId: viewModel.zoneDetail.value.tableData!.first
                            .id! //! ล็อคไว้ก่อน
                        ,
                      ),
                    );
                  },
                  child: const Text(
                    'Reserve',
                    style: TextStyle(
                        color: Color(0xff191919),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Kanit'),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
