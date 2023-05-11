import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/shared/text/app_text_border.dart';

import '../../../../models/we_service/booking/booking_response.dart';
import '../../../../models/we_service/booking/item_booking_response.dart';

class BookingSummarySection extends StatelessWidget {
  BookingData bookingData;
  String? total;

  BookingSummarySection({
    required this.bookingData,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Summary',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(
                  0xff9D9E9B,
                ),
              ),
            ),
            Text(
              'Total',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(
                  0xff9D9E9B,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            AppTextBorder(
              title: 'CASH',
              borderColor: const Color(0xff189B58),
              backgroundColor: const Color(0xff189B58),
              fontColor: Colors.white,
            ),

            ///! Coupon ซ่อนไปก่อน
            // const SizedBox(width: 16),
            // AppTextBorder(
            //   title: 'ride50freeiks',
            //   borderColor: const Color(0xff83D79B),
            //   backgroundColor: const Color(0xffCEFFCD),
            //   fontColor: const Color(0xff22A876),
            //   prefixIcon: 'assets/icon_coupon.svg',
            // ),

            const SizedBox(width: 16),
            Expanded(
              child: Text(
                '$total ฿',
                textAlign: TextAlign.end,
                style: GoogleFonts.kanit(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),

        ///! Point ซ่อนก่อน
        // const SizedBox(height: 4),
        // Container(
        //   margin: EdgeInsets.only(bottom: 24),
        //   alignment: Alignment.centerRight,
        //   child: Text(
        //     '+13,903pts',
        //     textAlign: TextAlign.end,
        //     style: GoogleFonts.inter(
        //       fontWeight: FontWeight.w400,
        //       fontSize: 12,
        //       color: Color(0xff9D9E9B),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
