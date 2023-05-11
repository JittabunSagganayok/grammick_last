import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/we_service/restaurant/merchant_response.dart';
import '../../../booking/ui/main/booking_screen.dart';

class RestaurantItemRecommendWidget extends StatelessWidget {
  final MerchantRestaurantData item;

  const RestaurantItemRecommendWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(16),
            //   topRight: Radius.circular(16),
            //   bottomLeft: Radius.circular(16),
            //   bottomRight: Radius.circular(16),
            // ),
            borderRadius: BorderRadius.circular(16),
            child: ExtendedImage.network(
              item.coverImage!,
              height: 176,
              width: 220,
              fit: BoxFit.cover,
            ),
            // child: ExtendedImage.asset(
            //   'assets/mock/mock_pizza.png',
            //   height: 176,
            //   fit: BoxFit.cover,
            // ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text.rich(
                              TextSpan(
                                text: '${item.name}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icon_star_yellow.svg'),
                              const SizedBox(width: 4),
                              Text(
                                '4.5',
                                style: GoogleFonts.kanit(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  item.addressData?.location ?? '-',
                                  // 'The Mall ... 4.3 km',
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.kanit(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff6C6C6C),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.to(
                            BookingScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(
                            0xffECEBFF,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 0,
                        ),
                        child: Text(
                          'Booking',
                          style: GoogleFonts.kanit(
                              color: Color(
                                0xff564FF0,
                              ),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
