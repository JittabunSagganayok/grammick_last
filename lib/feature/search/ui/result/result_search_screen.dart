import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/favorite/ui/my_favourite_screen.dart';
import 'package:we_link/feature/hotel/ui/detail/hotel_detail_screen.dart';
import 'package:we_link/feature/search/ui/result/result_search_viewmodel.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/dropdown/app_dropdown_button.dart';

import '../../../../shared/banner/banner_widget.dart';
import '../../../../shared/textfield/we_textfield_border_widget.dart';
import '../../../advertise/ui/advertise_screen.dart';
import '../../../hotel/ui/component/hotel_main_recommend_section.dart';

class ResultSearchScreen extends StatefulWidget {
  @override
  State<ResultSearchScreen> createState() => _ResultSearchScreenState();
}

class _ResultSearchScreenState
    extends AppState<ResultSearchScreen, ResultSearchViewModel> {
  @override
  Widget onCreateView(BuildContext context, ResultSearchViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: '',
            onBackPressed: () {
              navigator?.pop();
            },
            widgetTitle: WeTextFieldBorderWidget(
              hintLabel: 'Search',
              borderColor: Colors.white,
              textColor: Color(0xffCECECE),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff303030),
              ),
              onTextChanged: (text) {},
            ),
            actionsButton: [
              IconButton(
                onPressed: () {
                  Get.to(MyFavouriteScreen(),
                      transition: Transition.rightToLeft);
                },
                icon: SvgPicture.asset(
                  'assets/icon_favorite.svg',
                ),
              )
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Obx(() => Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  color: Colors.white,
                  height: 48,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = viewModel.filterList[index];
                      return InkWell(
                        onTap: () {},
                        child: AppDropdownButton(
                          title: item.label,
                          suffixIcon: 'assets/icon_arrow_down.svg',
                          suffixIconColor:
                              item.checked ? Colors.white : Color(0xff191919),
                          borderColor: item.checked
                              ? Color(0xff564FF0)
                              : Color(0xffEDEDED),
                          backgroundColor: item.checked
                              ? Color(0xff564FF0)
                              : Color(0xffEDEDED),
                          fontColor:
                              item.checked ? Colors.white : Color(0xff3C3C3C),
                        ),
                      );
                    },
                    itemCount: viewModel.filterList.length,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      color: Colors.transparent,
                      indent: 8,
                    ),
                  ),
                )),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 16),
              child: ListView.separated(
                primary: false,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index != 1) {
                    return InkWell(
                      onTap: () {
                        Get.to(HotelDetailScreen(),
                            transition: Transition.rightToLeft);
                      },
                      child: ItemHotelListWidget(),
                    );
                  } else {
                    return BannerWidget(
                      onClicked: () {
                        Get.to(
                          AdvertiseScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      banners: ['assets/mock/mock_restaurant.png'],
                    );
                  }
                },
                itemCount: 6,
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 16,
                  color: Colors.transparent,
                ),
              ),
            ),
          ]))
        ],
      ),
    );
  }

  @override
  ResultSearchViewModel initViewModel(ResultSearchViewModel viewModel) {
    return viewModel;
  }
}
