import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/dash/dash_widget.dart';
import '../../../../shared/text/app_text_border.dart';
import '../../../hotel/ui/component/detail/hotel_room_list_widget.dart';

class BookingConfirmationDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'KriHara Plearn',
                style: GoogleFonts.kanit(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Color(
                    0xff757575,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              SvgPicture.asset('assets/icon_star_yellow.svg'),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  '4.5',
                  style: GoogleFonts.kanit(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              AppTextBorder(
                title: 'See More',
                borderColor: Color(0xffECEBFF),
                backgroundColor: Color(0xffECEBFF),
                fontColor: Color(0xff564FF0),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          DashWidget(
            height: 1,
            color: Color(0xffDEDEDE),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: ExtendedImage.asset(
                  'assets/mock/mock_restaurant.png',
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Standard Twin Room',
                          style: GoogleFonts.kanit(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff102540)),
                        ),
                        Text(
                          'x2',
                          style: GoogleFonts.kanit(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff102540)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: HotelOptionWidget(
                            'assets/ic_bed.svg',
                            '2 beds',
                          ),
                        ),
                        Expanded(
                          child: HotelOptionWidget(
                            'assets/ic_bed.svg',
                            '2 beds',
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '+ Extra',
                      style: GoogleFonts.kanit(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Color(
                          0xff189B58,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Booking Conditions',
                      style: GoogleFonts.kanit(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        color: Color(
                          0xff564FF0,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
