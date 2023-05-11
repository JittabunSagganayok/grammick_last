import 'package:badges/badges.dart' as badges;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/service_reserve/ui/service_reserve_viewmodel.dart';
import 'package:we_link/shared/gridview/grid_view_fix_height.dart';

import '../../../components/home/homeComponents/coupon_list_section.dart';
import '../../../constant/colosrConstants.dart';
import '../../../shared/ads/ads_section.dart';
import '../../../shared/appbar/we_app_bar.dart';
import '../../../shared/banner/banner_widget.dart';
import '../../../shared/booking/service_book_again_section.dart';
import '../../../shared/hot_deal/service_hot_deal_section.dart';
import '../../../shared/recommend/item_service_recommend_widget.dart';
import '../../../shared/search/app_bar_search_section.dart';
import '../../../shared/text/subtitle_header_section.dart';
import '../../../shared/text/title_header_section.dart';
import '../../advertise/ui/advertise_screen.dart';
import '../../favorite/ui/my_favourite_screen.dart';
import '../../restaurant/ui/components/restaurant_app_bar_center_widget.dart';
import 'component/item_special_reserve_service_widget.dart';

class ServiceReserveScreen extends StatefulWidget {
  @override
  State<ServiceReserveScreen> createState() => _ServiceReserveScreenState();
}

class _ServiceReserveScreenState
    extends AppState<ServiceReserveScreen, ServiceReserveViewModel> {
  @override
  ServiceReserveViewModel initViewModel(ServiceReserveViewModel viewModel) {
    return viewModel;
  }

  @override
  Widget onCreateView(
    BuildContext context,
    ServiceReserveViewModel viewModel,
  ) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xff564FF0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: badges.Badge(
            badgeContent: Text(
              '3',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Color(0xff189B58),
            ),
            child: SvgPicture.asset('assets/icon_fab_service_hotel.svg'),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: '',
            onBackPressed: () {
              navigator?.pop();
            },
            radius: 0,
            widgetTitle: RestaurantAppBarCenterWidget(),
            actionsButton: [
              IconButton(
                onPressed: () {
                  Get.to(
                    MyFavouriteScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                icon: SvgPicture.asset(
                  'assets/icon_favorite.svg',
                ),
              )
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: 80,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(child: AppBarSearchSection()),
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: BannerWidget(
                        banners: [
                          'assets/mock/mock_beauty_service_banner.png',
                          'assets/mock/mock_beauty_service_banner.png',
                          'assets/mock/mock_beauty_service_banner.png',
                        ],
                        onClicked: () {
                          Get.to(
                            AdvertiseScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      )),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleHeaderSection(title: 'Our Service'),
                          GridView.builder(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: viewModel.ourServiceList.length,
                            gridDelegate: GridViewFixHeight(
                              crossAxisCount: 5,
                              height: 72,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final item = viewModel.ourServiceList[index];
                              return Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: Color(
                                          0xffFEE681,
                                        ),
                                        width: 1,
                                      ),
                                    ),
                                    child: ExtendedImage.asset(
                                      item.icon,
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    item.title,
                                    style: GoogleFonts.kanit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff999999)),
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: CouponListSection([]),
                          color: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          margin: EdgeInsets.only(top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleHeaderSection(title: 'Reccomend for you'),
                              SubtitleHeaderSection(subtitle: 'Place near by'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 216,
                          child: ListView.separated(
                            itemCount: 4,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(
                                    color: Colors.transparent, endIndent: 16),
                            itemBuilder: (BuildContext context, int index) {
                              return ItemServiceRecommendWidget();
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          height: 132,
                          child: AdsSection(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.only(bottom: 16),
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: TitleHeaderSection(
                            title: 'Spacial Package',
                          ),
                        ),
                        SizedBox(
                          height: 176,
                          child: ListView.separated(
                            itemCount: 3,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(
                              color: Colors.transparent,
                              endIndent: 16,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                  onTap: () {},
                                  child: ItemSpecialReserveServiceWidget());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ServiceBookAgainSection(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ServiceHotDealSection(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
