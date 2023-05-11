import 'package:badges/badges.dart' as badges;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/stylesConstants.dart';
import '../../feature/booking/ui/main/booking_screen.dart';

class ItemServiceBookAgainWidget extends StatelessWidget {
  bool showBadge;

  ItemServiceBookAgainWidget({
    required this.showBadge,
  });

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      showBadge: showBadge,
      position: badges.BadgePosition.topEnd(),
      badgeContent: Container(
        decoration: BoxDecoration(
          color: const Color(0xff20BD6C),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 24,
        width: 56,
        alignment: Alignment.center,
        child: Text(
          '10% off',
          style: GoogleFonts.kanit(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.all(0),
      ),
      child: Container(
        height: 96,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [payMentShadow],
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            ExtendedImage.asset(
              'assets/mock/mock_restaurant.png',
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(
                      text: "Ammoti",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Kanit'),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icon_star_yellow.svg'),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '4.5',
                        style: GoogleFonts.kanit(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          'The Mall ... 4.3 km',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.kanit(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff6C6C6C),
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
                  primary: const Color(
                    0xffECEBFF,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: Text(
                  'Booking',
                  style: GoogleFonts.kanit(
                      color: const Color(
                        0xff564FF0,
                      ),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
