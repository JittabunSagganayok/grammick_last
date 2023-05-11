import 'package:badges/badges.dart' as badges;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../components/home/weLinkComponents/rideComponents/searchLoComponents/promotion.dart';
import '../../../../constant/colosrConstants.dart';
import '../../../../models/we_service/restaurant/merchant_response.dart';
import '../../../../shared/rating/app_rating.dart';
import '../../../../shared/text/app_text_border.dart';
import '../../../review/ui/customer_review_screen.dart';
import '../restaurant_information_screen.dart';

class RestaurantHeaderInfoWidget extends StatelessWidget {
  final MerchantRestaurantData item;

  const RestaurantHeaderInfoWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: IconButton(
        visualDensity: VisualDensity.compact,
        onPressed: () {
          Get.to(
            () => RestaurantInformationScreen(),
            transition: Transition.rightToLeft,
          );
        },
        icon: const Icon(Icons.info_outline),
      ),
      position: badges.BadgePosition.topEnd(top: -32, end: 16),
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExtendedImage.network(
                  item.profileImage!,
                  height: 20,
                  width: 20,
                ),
                // ExtendedImage.asset(
                //   'assets/mock/mock_rest_logo.png',
                // ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name ?? '-',
                        style: GoogleFonts.kanit(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '(${item.addressData?.location ?? '-'})',
                            // '(The Mall Bangkapi ) 4.3 km',
                            style: GoogleFonts.kanit(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff4D4D4D)),
                          ),
                          Text(
                            'Open',
                            style: GoogleFonts.kanit(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff189B58)),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              height: 16,
              color: dividerColor,
            ),
            Row(
              children: [
                AppRating(rating: 4),
                const SizedBox(width: 4),
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
            Text(
              'Thai Fusion , Pizza , Romania',
              style: GoogleFonts.kanit(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            Text(
              item.description ?? '-',
              style: GoogleFonts.kanit(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff7A7A7A)),
            ),
            Divider(
              height: 16,
              color: dividerColor,
            ),
            TextButton(
              onPressed: () {
                Get.to(
                  () => PromotionScreen(),
                  transition: Transition.rightToLeft,
                );
              },
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'See Promotion',
                          style: GoogleFonts.kanit(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        AppTextBorder(
                          title: '10% off',
                          borderColor: Color(0xff20BD6C),
                          backgroundColor: Color(0xff20BD6C),
                          fontColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icon_arrow_yellow.svg',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
