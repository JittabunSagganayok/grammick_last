import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderCalendarBookingWidget extends StatelessWidget {
  String startDate;
  String endDate;
  bool showHeader;

  HeaderCalendarBookingWidget({
    required this.startDate,
    required this.endDate,
    required this.showHeader,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Color(0xff189B58), borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          if (showHeader) ...[
            Text(
              'Calendar Booking',
              style: GoogleFonts.kanit(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
          SizedBox(
            height: showHeader ? 16 : 0,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check in',
                      style: GoogleFonts.kanit(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      startDate,
                      style: GoogleFonts.kanit(
                        fontSize: 27,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                  size: 48,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Check out',
                      style: GoogleFonts.kanit(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      endDate,
                      style: GoogleFonts.kanit(
                        fontSize: 27,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
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
