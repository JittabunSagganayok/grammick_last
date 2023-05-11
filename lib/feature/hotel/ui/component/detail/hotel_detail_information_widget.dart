import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant/colosrConstants.dart';

class HotelDetailInformationWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'KriHara Plearn',
                  style: GoogleFonts.kanit(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: titleBlackColor),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/icon_star_yellow.svg'),
              SizedBox(width: 4,),
              Text(
                '4.5',
                style: GoogleFonts.kanit(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/icon_map_direction.svg'),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  '123, Kaoyai s,Royale Prince...',
                  style: GoogleFonts.kanit(
                    fontSize: 13,
                    color: subtitleGrayColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icon_hotel_detail_direction.svg',
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
