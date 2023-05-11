import 'package:badges/badges.dart' as badges;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/coupon/coupon_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../../../../models/profile/user_profile_response.dart';

class PromotionScreen extends StatefulWidget {
  PromotionScreen({Key? key}) : super(key: key);

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState
    extends AppState<PromotionScreen, PromotionViewModel> {
  @override
  PromotionViewModel initViewModel(PromotionViewModel viewModel) {
    viewModel.getMyCoupon();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, PromotionViewModel viewModel) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: false,
            shape: appbarBorder,
            leading: Container(
              margin: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  // setState(() {
                  //   primaryFocus.unfocus(disposition: disposition);
                  // });
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/close1.png'),
              ),
            ),
            title: Container(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 43,
                      child: TextFormField(
                        autofocus: false,
                        // focusNode: focusSearch,
                        // controller: _searchview,
                        // onChanged: onItemChanged,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'Search Promotion',
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: hintTextStyle,
                            contentPadding: fieldPadding,
                            enabledBorder: searchBoder,
                            focusedBorder: searchBoder,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.search,
                                color: Color(0xFF303030),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/images/close.png',
                                  fit: BoxFit.contain,
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )),
                      )),
                )
              ],
            )),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: pomotionBgButton,
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 1,
              child: OutlinedButton(
                style: pomotionButton,
                onPressed: () {
                  Navigator.pop(
                    context,
                    viewModel.couponSelected,
                  );
                },
                child: Text(
                  'Confirm',
                  style: pomotionTextButton,
                ),
              ),
            ),
          ),
        ),
        body: Obx(() {
          if (viewModel.loading.value == true) {
            return LoadingFullscreen();
          } else {
            return SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Let’s use point.',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Kanit'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 13, right: 12),
                        child: Image.asset(
                          'assets/images/c.png',
                          fit: BoxFit.fill,
                          height: 14,
                          width: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'My points',
                          style: TextStyle(
                              color: yellowColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Kanit'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 13, right: 12),
                        child: Text(
                          '${viewModel.userProfile.value?.customer?.points ?? 0}',
                          style: TextStyle(
                              color: yellowColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Kanit'),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() => ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      itemCount: viewModel.couponList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = viewModel.couponList[index];
                        return InkWell(
                          onTap: () {
                            viewModel.selectCoupon(item, index);
                          },
                          child: badges.Badge(
                            showBadge: item.selected == true,
                            badgeStyle: const badges.BadgeStyle(
                              badgeColor: Color(0xff189B58),
                              shape: badges.BadgeShape.circle,
                            ),
                            position: badges.BadgePosition.topEnd(),
                            // toAnimate: true,
                            badgeContent: Container(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                            child: Container(
                                height: 56,
                                width: MediaQuery.of(context).size.width * 1,
                                decoration: item.selected == true
                                    ? pomotionSelectedDecoration
                                    : pomotionDecoration,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Container(
                                      child: Image.asset(
                                        'assets/images/wallet1.png',
                                        fit: BoxFit.fill,
                                        height: 32,
                                        width: 32,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Text.rich(
                                          TextSpan(
                                            text: "${item.name?.toString()}",
                                            style: pomotionTitleText?.copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: "${item.discountValue} points",
                                        style: pomotionTitleText?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFCBCBCB),
                                          fontSize: 14,
                                        ),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                  ],
                                )),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                        height: 16,
                        color: Colors.transparent,
                      ),
                    )),
              ],
            ));
          }
        }));
  }
}

class PromotionViewModel extends GetxController {
  Dio dio;

  PromotionViewModel(this.dio);

  var loading = false.obs;
  var couponList = <Coupon>[].obs;
  var userProfile = Profile().obs;

  Coupon? couponSelected;

  Future getMyCoupon() async {
    loading.value = true;

    var response = await Future.wait([
      dio.get('coupons/ride'),
      dio.get('auth/profile'),
    ]);

    var data = CouponResponse.fromJson(response[0].data);
    var result = data.result ?? [];

    var filterOutExpiryDate = result
        .where((element) =>
            DateTime.parse(element.endDate ?? "").isAfter(DateTime.now()))
        .toList();

    couponList.value = filterOutExpiryDate;

    var userProfileResponse = UserProfileResponse.fromJson(response[1].data);
    userProfile.value = userProfileResponse.result!;

    loading.value = false;
  }

  void selectCoupon(Coupon item, int index) {
    couponList[index].selected = item.selected == false;

    for (var element in couponList) {
      if (element.id != couponList[index].id) {
        element.selected = false;
      }
    }

    if (item.selected == false) {
      couponSelected = null;
    } else {
      couponSelected = item;
    }

    couponList.refresh();
  }
}
