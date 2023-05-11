import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/feature/restaurant/ui/zone/restaurant_zone_viewmodel.dart';

import '../../../../constant/colosrConstants.dart';
import '../../../../shared/appbar/we_app_bar.dart';
import '../../../../shared/loading/loading_fullscreen.dart';
import '../../../base/base_we_state.dart';
import '../../../favorite/ui/my_favourite_screen.dart';
import '../components/restaurant_app_bar_center_widget.dart';
import 'restaurant_zone_detail_screen.dart';

class RestaurantZoneArgument {
  num restaurantId;

  RestaurantZoneArgument(this.restaurantId);
}

class RestaurantZoneScreen extends StatefulWidget {
  @override
  State<RestaurantZoneScreen> createState() => _RestaurantZoneScreenState();
}

class _RestaurantZoneScreenState
    extends AppState<RestaurantZoneScreen, RestaurantZoneViewModel> {
  @override
  RestaurantZoneViewModel initViewModel(RestaurantZoneViewModel viewModel) {
    if (Get.arguments is RestaurantZoneArgument) {
      viewModel.getZoneList(arguments: Get.arguments);
    }

    // viewModel.getZoneList(arguments: RestaurantZoneArgument(18));
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, RestaurantZoneViewModel viewModel) {
    return Obx(() {
      if (viewModel.loading.isTrue) {
        return LoadingFullscreen();
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              WeAppBar(
                title: 'Zone',
                titleColor: blackColor,
                backgroundColor: Colors.white,
                radius: 0,
                navigationIcon: IconButton(
                  onPressed: () {
                    navigator?.pop();
                  },
                  icon: SvgPicture.asset('assets/icon_close_sheet.svg'),
                ),
              ),
              SliverFillRemaining(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  itemCount: viewModel.zoneList.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 16,
                    color: Colors.transparent,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final item = viewModel.zoneList[index];
                    return InkWell(
                      onTap: () {
                        Get.to(
                          RestaurantZoneDetailScreen(),
                          arguments: RestaurantZoneDetailArgument(
                            restaurantId: item.merchantId ?? -1,
                            zoneId: item.id ?? -1,
                          ),
                          transition: Transition.downToUp,
                        );
                      },
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: SizedBox(
                          height: 155,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: ExtendedImage.network(
                                  item.image ?? "",
                                  width: Get.width,
                                  fit: BoxFit.cover,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        item.title ?? "",
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
                                              item.name ?? "",
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
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      }
    });
  }
}
