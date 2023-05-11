import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/colosrConstants.dart';
import '../../../../models/we_service/booking/booking_response.dart';
import '../../../../shared/text/app_text_border.dart';

class BookingOrderDetailSection extends StatelessWidget {
  final BookingData bookingData;

  const BookingOrderDetailSection({required this.bookingData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Order :',
              style: GoogleFonts.kanit(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff8E8E8E)),
            ),
            const SizedBox(width: 24),
            AppTextBorder(
              title: 'We${bookingData.merchantType ?? '-'}',
              fontColor: const Color(0xff189B58),
              backgroundColor: const Color(0xffCEFFCD),
              borderColor: const Color(0xff83D79B),
              underlineTextView: true,
            ),
            Expanded(
              child: Text(
                bookingData.bookingCode ?? '-',
                textAlign: TextAlign.end,
                style: GoogleFonts.kanit(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff8E8E8E)),
              ),
            )
          ],
        ),
        const Divider(
          height: 24,
          color: dividerColor,
          indent: 16,
          endIndent: 16,
        ),
        Row(
          children: [
            ExtendedImage.network(
              bookingData.merchantData!.profileImage!,
              width: 40,
              height: 40,
              shape: BoxShape.circle,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookingData.merchantData?.name ?? '-',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: titleBlackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      Text(
                        '(14, Ekkamai Tonglor...)',
                        style: GoogleFonts.kanit(
                          fontSize: 11,
                          color: titleBlackColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        'assets/icon_star_yellow.svg',
                        width: 12,
                        height: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '4.5',
                        style: GoogleFonts.kanit(
                          fontSize: 10,
                          color: titleBlackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff5DBA66),
                ),
                child: SvgPicture.asset(
                  'assets/icon_call.svg',
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFDB824),
                ),
                child: SvgPicture.asset(
                  'assets/icon_chat.svg',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
