import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/components/home/homeComponents/appBarComponent.dart';
import 'package:we_link/components/home/homeComponents/article_list_screen.dart';
import 'package:we_link/components/home/homeComponents/banner_list_section.dart';
import 'package:we_link/components/home/homeComponents/bottomAppBar.dart';
import 'package:we_link/components/home/homeComponents/coupon_list_section.dart';
import 'package:we_link/components/home/homeComponents/home_menu_section.dart';
import 'package:we_link/components/home/homeComponents/rentCar.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/address/my_address_response.dart';
import 'package:we_link/models/article/article_list_response.dart';
import 'package:we_link/models/banner/banner_list_response.dart' as banner;
import 'package:we_link/models/coupon/coupon_list_response.dart';
import 'package:we_link/models/profile/user_profile_response.dart';
import 'package:we_link/models/vehicle_promotion/vehicle_promotion_list_response.dart';
import 'package:we_link/models/wallet/my_wallet_response.dart';

import '../components/home/weLinkToGo.dart';
import '../helper/app_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AppState<HomeScreen, HomeViewModel> {
  @override
  HomeViewModel initViewModel(HomeViewModel viewModel) {

    viewModel.packageSelected.listen((result) {
      if (result.id != null ) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WeLinkToGoScreen(currentTabSelected: 2,packageSelected : result)),
        ).then((value){
          viewModel.packageSelected.value = VehiclePromotion();
        });
      }
    });

    viewModel.getHomeFeed();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, HomeViewModel viewModel) {
    return Obx(() {
      if (viewModel.loading.value) {
        return SizedBox(
            width: Get.width,
            height: Get.height,
            child: const Center(
              child: CircularProgressIndicator(
                color: yellowColor,
              ),
            ));
      } else {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: AppBar(
              backgroundColor: blackColor,
              automaticallyImplyLeading: false,
              elevation: 0,
              centerTitle: false,
              title: Obx(() => AppBarComponent(
                    AppBarType.HOME,
                    viewModel.myBalance.value,
                    viewModel.currentAddress.value,
                  )),
            ),
          ),
          body: Column(
            children: [
              bottomAppBar(),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    BannerListSection(viewModel.banners),
                    const SizedBox(
                      height: 20,
                    ),
                    const HomeMenuSection(),
                    if (viewModel.couponList.isNotEmpty == true) ...[
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: CouponListSection(viewModel.couponList,
                            onSaveCoupon: (coupon) {
                          viewModel.saveCoupon(coupon);
                        }),
                      ),
                    ],
                    const SizedBox(
                      height: 20,
                    ),
                    ArticleListScreen(viewModel.articles),
                    const SizedBox(
                      height: 20,
                    ),
                    HomeRentCarScreen(viewModel.vehiclePromotionList.value),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
              ),
            ],
          ),
        );
      }
    });
  }
}

class HomeViewModel extends GetxController {
  Dio dio;

  HomeViewModel(this.dio);

  var articles = <Article>[].obs;
  var couponList = <Coupon>[].obs;
  var myBalance = 0.0.obs;
  var userProfile = Profile().obs;
  var banners = <banner.Banner>[].obs;
  var vehiclePromotionList = <VehiclePromotion>[].obs;
  var currentAddress = AddressResponse().obs;
  var loading = false.obs;

  var packageSelected = VehiclePromotion().obs;

  Future getHomeFeed() async {
    loading.value = true;

    var response = await Future.wait([
      dio.get('articles'),
      dio.get('auth/profile'),
      dio.get('coupons'),
      dio.get('wallets/balance'),
      dio.get('banners'),
      dio.get('vehicle-packets'),
      dio.get('address/current'),
    ]);

    var articleResponse = ArticlesListResponse.fromJson(response[0].data);
    articles.addAll(articleResponse.result ?? []);

    var userProfileResponse = UserProfileResponse.fromJson(response[1].data);
    userProfile.value = userProfileResponse.result!;
    userProfileTemp = userProfile.value;

    var couponListResponse = CouponListResponse.fromJson(response[2].data);

    var data = couponListResponse.result?.where((element) {
      return element.customers?.contains(userProfile.value.id) == false;
    }).toList() ?? [];

    couponList.value = data;

    var myWalletResponse = MyWalletResponse.fromJson(response[3].data);
    myBalance.value = myWalletResponse.result ?? -1;

    var bannerListResponse =
        banner.BannerListResponse.fromJson(response[4].data);
    banners.value = bannerListResponse.result!;

    var vehiclePromotionListResponse =
        VehiclePromotionListResponse.fromJson(response[5].data);
    vehiclePromotionList.value = vehiclePromotionListResponse.result ?? [];

    try {
      var data = await getCurrentLocation();
      currentAddress.value = data;
      homeAddress = currentAddress.value;
    } catch (e) {
      loading.value = false;
    } finally {
      loading.value = false;
    }
  }

  Future saveCoupon(Coupon coupon) async {
    await dio.post('coupons', data: {
      "coupon_id": coupon.id,
    });
  }
}
