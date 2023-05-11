import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelDetailInformationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Information',
          style: GoogleFonts.kanit(
              fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icon_phone.svg',
              color: Color(0xff189B58),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '02-482-6666',
              style: GoogleFonts.kanit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/ic_calendar.svg',
                    color: Color(0xff189B58),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Checkin 12 PM',
                    style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/ic_calendar.svg',
                    color: Color(0xff189B58),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Checkout 11 AM',
                    style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
