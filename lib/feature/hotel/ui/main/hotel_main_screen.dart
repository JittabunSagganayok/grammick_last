import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constant/colosrConstants.dart';
import '../../../../constant/stylesConstants.dart';
import '../../../../di/app_module.dart';
import '../../../../shared/banner/banner_widget.dart';
// import '../../../../shared/booking/service_book_again_section.dart';
// import '../../../../shared/hot_deal/service_hot_deal_section.dart';
import '../../../../shared/search/app_bar_search_section.dart';
import '../../../advertise/ui/advertise_screen.dart';
import '../../../favorite/ui/my_favourite_screen.dart';
import '../component/hotel_main_recommend_section.dart';
import 'hotel_main_viewmodel.dart';

class HotelMainScreen extends StatefulWidget {
  @override
  State<HotelMainScreen> createState() => _HotelMainScreenState();
}

class _HotelMainScreenState extends State<HotelMainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelMainViewModel>(
      init: appModule.get<HotelMainViewModel>(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: appBackgroundColor,
          appBar: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                navigator?.pop();
              },
              icon: Image.asset('assets/images/goBack.png'),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(MyFavouriteScreen(),
                  transition: Transition.rightToLeft);
                },
                icon: SvgPicture.asset('assets/icon_favorite.svg'),
              ),
            ],
            centerTitle: true,
            title: Text(
              'WeStay',
              style: titleWhiteAppbar,
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  child: AppBarSearchSection(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: BannerWidget(
                    banners: const [
                      'assets/mock/mock_restaurant.png',
                      'assets/mock/mock_restaurant.png',
                      'assets/mock/mock_restaurant.png'
                    ],
                    onClicked: () {
                      Get.to(
                        AdvertiseScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: HotelMainRecommendSection(),
                )
              ],
            ),
          ),
          /*
          body: ListView.builder(
            cacheExtent: 1000,
            padding: const EdgeInsets.only(
              bottom: 80,
            ),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  margin: const EdgeInsets.only(top: 0),
                  child: AppBarSearchSection(),
                );
              } else if (index == 1) {
                return Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: BannerWidget(
                    banners: const [
                      'assets/mock/mock_restaurant.png',
                      'assets/mock/mock_restaurant.png',
                      'assets/mock/mock_restaurant.png'
                    ],
                    onClicked: () {
                      Get.to(
                        AdvertiseScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                  ),
                );
              } else if (index == 2) {
                return Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: HotelMainRecommendSection(),
                );
              } else if (index == 3) {
                return Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: ServiceBookAgainSection(),
                );
              } else if (index == 4) {
                return Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: ServiceHotDealSection(),
                );
              } else {
                return Container();
              }
            },
            itemCount: 3, // 5
          ),
          floatingActionButton: Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff564FF0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: badges.Badge(
                badgeContent: const Text(
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
          */
        );
      },
    );
  }
}
