import 'package:badges/badges.dart' as badges;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../components/alert/asking_alert.dart';
import '../../../constant/colosrConstants.dart';
import '../../../shared/ads/ads_section.dart';
import '../../../shared/button/app_button_bar.dart';
import '../../../shared/text/subtitle_header_section.dart';
import '../../../shared/text/title_header_section.dart';
import '../../base/base_we_state.dart';
import '../../order/ui/choose_your_order_screen.dart';
import '../../search/ui/recent/recent_search_screen.dart';
import 'components/restaurant_header_info_widget.dart';
import 'components/restaurant_item_add_more_menu_widget.dart';
import 'menu_info_screen.dart';
import 'restaurant_detail_viewmodel.dart';
import 'restaurant_main_viewmodel.dart';
import 'zone/restaurant_zone_screen.dart';

class RestaurantDetailScreen extends StatefulWidget {
  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState
    extends AppState<RestaurantDetailScreen, RestaurantDetailViewModel> {
  @override
  RestaurantDetailViewModel initViewModel(RestaurantDetailViewModel viewModel) {
    if (Get.arguments is RestaurantArguments) {
      viewModel.setArguments(Get.arguments);
    }

    viewModel.init();

    return viewModel;
  }

  @override
  Widget onCreateView(
    BuildContext context,
    RestaurantDetailViewModel viewModel,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: Stack(
            children: [
              Center(
                child: ExtendedImage.network(
                  viewModel.merchantData.coverImage!,
                  height: 272,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset('assets/icon_back.svg'),
                      onPressed: () {
                        navigator?.pop();
                      },
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Image.asset('assets/images/search.png'),
                            onPressed: () {
                              Get.to(
                                () => RecentSearchScreen(),
                                transition: Transition.rightToLeft,
                              );
                            },
                          ),
                          IconButton(
                            icon: SvgPicture.asset('assets/icon_favorite.svg'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              /// Header Menu
              Container(
                margin: const EdgeInsets.only(top: 240),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 280),
                        height: 132,
                        child: AdsSection(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Divider(
                          height: 16,
                          color: appBackgroundColor,
                          thickness: 16,
                        ),
                      ),

                      /// Menu List
                      ListView.separated(
                        itemCount: viewModel.menuCate.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        primary: false,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          color: Colors.transparent,
                          endIndent: 16,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final item = viewModel.menuCate[index];

                          return Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: TitleHeaderSection(
                                    title: item.name ?? '-',
                                  ),
                                ),
                                const Divider(
                                  height: 16,
                                  indent: 16,
                                  endIndent: 16,
                                  color: dividerColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: SubtitleHeaderSection(
                                    subtitle: 'Promotions',
                                  ),
                                ),
                                ListView.separated(
                                  itemCount: item.menuData?.length ?? 0,
                                  shrinkWrap: true,
                                  primary: false,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var itemMenu = item.menuData?[index];

                                    return RestaurantItemAddMoreMenuWidget(
                                      id: itemMenu!.id,
                                      name: itemMenu.name,
                                      description: itemMenu.description,
                                      image: itemMenu.image,
                                      price: itemMenu.price,
                                      added: itemMenu.added,
                                      // menu: itemMenu,
                                      onClick: () async {
                                        var result = await Get.to(
                                          () => MenuInfoScreen(),
                                          arguments: MenuDetailArguments(
                                            itemMenu: itemMenu,
                                            menuCategory: item,
                                          ),
                                          transition: Transition.downToUp,
                                        );

                                        if (result != null && result == true) {
                                          await viewModel.init();
                                        }
                                      },
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(
                                    height: 16,
                                    color: dividerColor,
                                    indent: 16,
                                    endIndent: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              /// Detail Merchant
              Card(
                margin: const EdgeInsets.only(top: 200, left: 16, right: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: RestaurantHeaderInfoWidget(
                    item: viewModel.merchantData,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(
            () => ChooseYourOrderScreen(),
            transition: Transition.downToUp,
            arguments: ChooseYourOrderArguments(
              merchantId: viewModel.merchantData.id,
            ),
          );
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffFD7224),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: viewModel.itemInCartData?.itemData != null
                ? badges.Badge(
                    badgeContent: Text(
                      '${viewModel.itemInCartData?.itemData?.length ?? ''}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Color(0xff189B58),
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/ic_order_list.svg'),
                    ),
                  )
                : Center(
                    child: SvgPicture.asset('assets/ic_order_list.svg'),
                  ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonBar.withLeftIcon(
        title: 'Book table',
        onClicked: () {
          if (viewModel.itemInCartData?.itemData == null ||
              viewModel.itemInCartData!.itemData!.isEmpty) {
            askingAlert(
              context,
              title: 'คุณยังไม่เลือกเมนู',
              message: 'กรุณาเลือกเมนู',
            );
            return;
          }
          Get.to(
            () => RestaurantZoneScreen(),
            arguments: RestaurantZoneArgument(viewModel.merchantId!),
            transition: Transition.downToUp,
          );
          // Get.to(
          //   () => BookingTableScreen(),
          //   transition: Transition.downToUp,
          // );
        },
        leadingWidget: Row(
          children: [
            SizedBox(
              height: 48,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.black,
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
                  navigator?.pop();
                  Get.to(
                    () => RestaurantDetailScreen(),
                    transition: Transition.downToUp,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: SvgPicture.asset(
                        'assets/icon_union.svg',
                        fit: BoxFit.fill,
                        color: Colors.white,
                        height: 13,
                        width: 13,
                      ),
                    ),
                    Text(
                      'Branch',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 16,
            )
          ],
        ),
      ),
    );
  }
}
