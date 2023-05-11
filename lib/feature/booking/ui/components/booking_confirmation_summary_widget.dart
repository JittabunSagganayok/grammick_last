import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/shared/text/app_text_border.dart';

import '../../../../constant/colosrConstants.dart';

class BookingConfirmationSummaryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Summary',
                style: GoogleFonts.kanit(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
              ),
            )
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  AppTextBorder(
                    title: '11 Days',
                    borderColor: Color(0xff189B58),
                    backgroundColor: Color(0xffCEFFCD),
                    fontColor: Color(0xff189B58),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  AppTextBorder(
                    title: '2 Rooms',
                    borderColor: Color(0xff8EB0F4),
                    backgroundColor: Color(0xffF0FCF8),
                    fontColor: Color(0xff8EB0F4),
                  ),
                ],
              ),
            ),
            AppTextBorder(
              title: '10% off',
              borderColor: Color(0xff20BD6C),
              backgroundColor: Color(0xff20BD6C),
              fontColor: Colors.white,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total amount to be paid',
              style: GoogleFonts.kanit(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Color(
                  0xff323232,
                ),
              ),
            ),
            Text(
              '20,823 ฿',
              style: GoogleFonts.kanit(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'including taxes and fees',
              style: GoogleFonts.kanit(
                fontSize: 9,
                fontWeight: FontWeight.w300,
                color: Color(
                  0xff787878,
                ),
              ),
            ),
            Text('38,000 ฿',
              style: GoogleFonts.kanit(
                fontSize: 9,
                fontWeight: FontWeight.w300,
                color: priceRedColor,
              ),),
          ],
        )
      ],
    );
  }
}
