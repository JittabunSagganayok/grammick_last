import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../models/we_service/booking/booking_response.dart';

class BookingCodeSection extends StatelessWidget {
  BookingData bookingData;

  BookingCodeSection({required this.bookingData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Booking code',
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff9D9E9B)),
            ),
            const Icon(
              Icons.info_outline,
              color: Color(
                0xff616161,
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          height: 136,
          decoration: BoxDecoration(
            color: bookingData.merchantType == 'RESTAURANT'
                ? const Color(0xffFFEBC1)
                : const Color(0xffCEFFCD),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 16,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 72,
                  child: Text(
                    bookingData.bookingCode ?? '-',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kanit(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: bookingData.merchantType == 'RESTAURANT'
                          ? const Color(
                              0xffAD7908,
                            )
                          : const Color(
                              0xff189B58,
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: 64,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: bookingData.merchantType == 'RESTAURANT'
                          ? const Color(0xffFDB824)
                          : const Color(0xff189B58),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Builder(
                      builder: (context) {
                        if (bookingData.merchantType == 'RESTAURANT') {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                bookingData.reservationDate != null
                                    ? DateFormat('dd MMM yyyy / hh : mm')
                                        .format(
                                        DateTime.parse(
                                          bookingData.reservationDate!,
                                        ),
                                      )
                                    : '-',
                                style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          );
                        }
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.calendar_today_outlined,
                                        color: Color(
                                          0xffCEFFCD,
                                        ),
                                        size: 12,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Check in',
                                        style: GoogleFonts.kanit(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(
                                            0xffCEFFCD,
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                    ],
                                  ),
                                  Text(
                                    '12 May',
                                    style: GoogleFonts.kanit(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(child: Container()),
                                      const Icon(
                                        Icons.calendar_today_outlined,
                                        color: Color(
                                          0xffCEFFCD,
                                        ),
                                        size: 12,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Check out',
                                        style: GoogleFonts.kanit(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(
                                            0xffCEFFCD,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '12 May',
                                    style: GoogleFonts.kanit(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icon_amount_people.svg',
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                'Amount people',
                style: GoogleFonts.kanit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff3D3D3D),
                ),
              ),
            ),
            Text(
              '${bookingData.people ?? '-'}',
              style: GoogleFonts.kanit(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(
                  0xff3D3D3D,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
