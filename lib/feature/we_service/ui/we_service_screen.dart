import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/components/home/homeComponents/banner_list_section.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/hotel/route/hotel_route.dart';
import 'package:we_link/feature/restaurant/route/restaurant_main_route.dart';
import 'package:we_link/feature/service_reserve/route/service_reserve_route.dart';
import 'package:we_link/feature/we_service/ui/we_service_viewmodel.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/gridview/grid_view_fix_height.dart';

import '../../../constant/colosrConstants.dart';
import '../../../shared/textfield/we_textfield_border_widget.dart';
import 'components/item_gallery_with_bottom_text_widget.dart';

class WeServiceScreen extends StatefulWidget {
  @override
  State<WeServiceScreen> createState() => _WeServiceScreenState();
}

class _WeServiceScreenState
    extends AppState<WeServiceScreen, WeServiceViewModel> {
  @override
  WeServiceViewModel initViewModel(WeServiceViewModel controller) {
    return controller;
  }

  @override
  Widget onCreateView(BuildContext context, WeServiceViewModel controller) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: 'WeService',
            onBackPressed: () {
              navigator?.pop();
            },
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(top: 24, left: 16, right: 16),
              child: WeTextFieldBorderWidget(
                hintLabel: 'Search',
                textColor: yellDarkColor,
                borderColor: textFieldBorderColor,
                prefixIcon: Icon(Icons.search, color: yellDarkColor),
                onTextChanged: (text) {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16, left: 6, right: 6),
              child: BannerListSection([]),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 24,
                left: 16,
                right: 16,
              ),
              child: Text(
                'Category',
                style: GoogleFonts.kanit(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
            ),
            Obx(
              () => GridView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                gridDelegate: GridViewFixHeight(
                  crossAxisCount: 2,
                  height: 160,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: controller.serviceItems.length,
                itemBuilder: (context, index) {
                  final item = controller.serviceItems[index];
                  return InkWell(
                      onTap: () {
                        switch (item.itemType) {
                          case WeServiceItemType.HOTEL:
                            navigator?.pushNamed(
                              HotelRoute.hotelMainScreen,
                            );
                            break;
                          case WeServiceItemType.RESTAURANT:
                            navigator?.pushNamed(
                              RestaurantMainRoute.serviceRestaurantMainScreen,
                            );
                            break;
                          default:
                            navigator?.pushNamed(
                              ServiceReserveRoute.serviceReserveScreen,
                            );
                            break;
                        }
                      },
                      child: ItemGalleryWithBottomTextWidget(item));
                },
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
