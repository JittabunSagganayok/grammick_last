import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:we_link/components/home/homeComponents/coupon_list_section.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/favorite/ui/my_favourite_screen.dart';
import 'package:we_link/feature/restaurant/ui/restaurant_detail_screen.dart';
import 'package:we_link/feature/restaurant/ui/restaurant_main_viewmodel.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/banner/banner_widget.dart';
import 'package:we_link/shared/search/app_bar_search_section.dart';
import 'package:we_link/shared/text/title_header_section.dart';

import '../../../shared/ads/ads_section.dart';
import '../../../shared/booking/service_book_again_section.dart';
import '../../../shared/hot_deal/service_hot_deal_section.dart';
import '../../../shared/recommend/item_service_recommend_widget.dart';
import '../../../shared/text/subtitle_header_section.dart';
import '../../advertise/ui/advertise_screen.dart';
import '../../booking/ui/main/booking_screen.dart';
import 'components/restaurant_app_bar_center_widget.dart';
import 'components/restaurant_item_recommend_widget.dart';
import 'components/restaurant_tag_recommend_section.dart';

class RestaurantMainScreen extends StatefulWidget {
  @override
  State<RestaurantMainScreen> createState() => _RestaurantMainScreenState();
}

class _RestaurantMainScreenState
    extends AppState<RestaurantMainScreen, RestaurantMainViewModel> {
  @override
  RestaurantMainViewModel initViewModel(
    RestaurantMainViewModel viewModel,
  ) {
    viewModel.init();
    // viewModel.getCategoryRestaurant();
    // viewModel.getMerchantRestaurant();
    return viewModel;
  }

  @override
  Widget onCreateView(
    BuildContext context,
    RestaurantMainViewModel viewModel,
  ) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(
            BookingScreen(),
            transition: Transition.rightToLeft,
          );
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff564FF0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: viewModel.bookingList.isNotEmpty
                ? badges.Badge(
                    badgeContent: Text(
                      '${viewModel.bookingList.length}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Color(0xff189B58),
                    ),
                    child: Center(
                      child:
                          SvgPicture.asset('assets/icon_fab_service_hotel.svg'),
                    ),
                  )
                : Center(
                    child:
                        SvgPicture.asset('assets/icon_fab_service_hotel.svg'),
                  ),
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
                  AppBarSearchSection(),
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: BannerWidget(
                        banners: [
                          'assets/mock_service_restaurant.png',
                          'assets/mock_service_restaurant.png',
                          'assets/mock_service_restaurant.png'
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 64,
                          child: RestaurantTagRecommendSection(
                            onTap: (item) {
                              viewModel.setTagsSelected(item);
                              viewModel.getMerchantRestaurant();
                            },
                            tags: viewModel.tags,
                          ),
                        ),
                        SizedBox(
                          height: 176,
                          child: ListView.separated(
                            itemCount: viewModel.merchants.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                              color: Colors.transparent,
                              endIndent: 16,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final item = viewModel.merchants[index];

                              return InkWell(
                                onTap: () {
                                  Get.to(
                                    () => RestaurantDetailScreen(),
                                    arguments: RestaurantArguments(
                                      merchantId: item.id,
                                      merchantRestaurantData: item,
                                    ),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                child: RestaurantItemRecommendWidget(item),
                              );
                            },
                          ),
                        ),
                        Container(
                          child: CouponListSection([]),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          margin: EdgeInsets.only(top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleHeaderSection(title: 'Popular'),
                              SubtitleHeaderSection(
                                  subtitle: 'Recommend for you'),
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
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ServiceBookAgainSection(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
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
