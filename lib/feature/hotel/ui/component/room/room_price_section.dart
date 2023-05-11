import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/text/app_text_border.dart';

class RoomPriceSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Row(
                  children: [
                    Text(
                      'Room Price / ',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Night',
                      style: GoogleFonts.kanit(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppTextBorder.withFontSize(
                    title: '10% off',
                    borderColor: Color(0xff20BD6C),
                    backgroundColor: Color(0xff20BD6C),
                    fontColor: Colors.white,
                    fontSize: 10,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    '1,893 ฿',
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'ราคาเป็นไปตามเงื่อนไข',
                style: GoogleFonts.kanit(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '2,500 ฿',
                textAlign: TextAlign.end,
                style: GoogleFonts.kanit(
                    fontSize: 9,
                    fontWeight: FontWeight.w300,
                    color: Color(
                      0xffFFB6B6,
                    ),
                    decoration: TextDecoration.lineThrough
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
