import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/restaurant/ui/restaurant_information_viewmodel.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';

import '../../../shared/rating/app_rating.dart';
import '../../review/ui/customer_review_screen.dart';

class RestaurantInformationScreen extends StatefulWidget {
  @override
  State<RestaurantInformationScreen> createState() =>
      _RestaurantInformationScreenState();
}

class _RestaurantInformationScreenState extends AppState<
    RestaurantInformationScreen, RestaurantInformationViewModel> {
  @override
  RestaurantInformationViewModel initViewModel(
    RestaurantInformationViewModel viewModel,
  ) {
    return viewModel;
  }

  @override
  Widget onCreateView(
    BuildContext context,
    RestaurantInformationViewModel viewModel,
  ) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: 'Information',
            onBackPressed: () {
              navigator?.pop();
            },
          ),
          SliverFillRemaining(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                primary: false,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExtendedImage.asset(
                            'assets/mock/mock_rest_logo.png',
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Small Pizza Hawaii',
                                  style: GoogleFonts.kanit(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '(The Mall Bangkapi ) 4.3 km',
                                      style: GoogleFonts.kanit(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff4D4D4D)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 16,
                        color: dividerColor,
                      ),
                      Row(
                        children: [
                          AppRating(
                            rating: 4,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              '4',
                              style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(
                                () => CustomerReviewScreen(),
                                transition: Transition.rightToLeft,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'See Review',
                                  style: GoogleFonts.kanit(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset('assets/icon_arrow_yellow.svg')
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 16,
                        color: dividerColor,
                      ),
                      Divider(
                        height: 16,
                        color: dividerColor,
                      ),
                      ExtendedImage.asset('assets/mock_restaurant_map.png'),
                      ListView.separated(
                        itemCount: viewModel.infoList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          final item = viewModel.infoList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(item.icon),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    item.title,
                                    style: GoogleFonts.kanit(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                        color: Color(0xff4D4D4D)),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      item.data,
                                      style: GoogleFonts.kanit(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Color(0xff262626)),
                                    ),
                                    if (item.showArrowIcon) ...[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: SvgPicture.asset(
                                            'assets/ic_next_arrow_yellow.svg'),
                                      )
                                    ]
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                          height: 16,
                          color: dividerColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
