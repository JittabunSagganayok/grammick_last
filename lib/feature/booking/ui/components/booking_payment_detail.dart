import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/colosrConstants.dart';
import '../../../../models/we_service/booking/booking_response.dart';
import '../../../../models/we_service/booking/item_booking_response.dart';
import '../../../../shared/text/app_text_border.dart';
import '../../domain/entity/contact_information_item.dart';

class BookingPaymentDetail extends StatelessWidget {
  List<ContactInformationItem> contactInfoList = [];
  List<ItemBookingData> itemBookingList = [];
  BookingData bookingData;

  BookingPaymentDetail({
    required this.contactInfoList,
    required this.itemBookingList,
    required this.bookingData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Detail',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff189B58),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.comfortable,
                    fixedSize: const Size(48, 24)),
                child: Text(
                  'Hide',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
          const Divider(
            height: 16,
            color: dividerColor,
            indent: 16,
            endIndent: 16,
          ),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(4),
            itemCount: itemBookingList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 8,
              color: Colors.transparent,
            ),
            itemBuilder: (context, index) {
              final item = itemBookingList[index];

              return Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'x${item.quantity}',
                      style: GoogleFonts.kanit(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.name}',
                            // 'Standard Twin Room',
                            style: GoogleFonts.kanit(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 4),
                          if (bookingData.merchantType == 'SERVICE')
                            Row(
                              children: [
                                AppTextBorder(
                                  title: '11 Days',
                                  borderColor: const Color(0xff189B58),
                                  backgroundColor: const Color(0xffCEFFCD),
                                  fontColor: const Color(0xff189B58),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                AppTextBorder(
                                  title: '2 Rooms',
                                  borderColor: const Color(0xff4F86F0),
                                  backgroundColor: const Color(0xffF0FCF8),
                                  fontColor: const Color(0xff4F86F0),
                                ),
                              ],
                            ),
                          Builder(
                            builder: (context) {
                              if (bookingData.merchantType == 'SERVICE') {
                                return ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: 3,
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      '- Breakfast',
                                      style: GoogleFonts.kanit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: const Color(
                                          0xff7A7A7A,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }

                              return ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                shrinkWrap: true,
                                itemCount: item.itemOptionData!.length,
                                primary: false,
                                itemBuilder: (context, index) {
                                  final optionsHeader =
                                      item.itemOptionData![index];

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${optionsHeader.name ?? '-'}',
                                        style: GoogleFonts.kanit(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: const Color(
                                            0xff7A7A7A,
                                          ),
                                        ),
                                      ),
                                      if (optionsHeader.optional != null)
                                        ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          shrinkWrap: true,
                                          itemCount:
                                              optionsHeader.optional!.length,
                                          primary: false,
                                          itemBuilder: (context, index) {
                                            final option =
                                                optionsHeader.optional![index];

                                            return Text(
                                              '- ${option.name ?? '-'}',
                                              style: GoogleFonts.kanit(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: const Color(
                                                  0xff7A7A7A,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          Text(
                            '${item.description ?? ''}',
                            style: GoogleFonts.kanit(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: const Color(
                                0xff7A7A7A,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        Text(
                          '${item.total} ฿',
                          style: GoogleFonts.kanit(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          '${item.total} ฿',
                          style: GoogleFonts.kanit(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: priceRedColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          const Divider(
            height: 16,
            color: dividerColor,
            indent: 16,
            endIndent: 16,
          ),
          if (bookingData.merchantType == 'SERVICE')
            Column(
              children: [
                Text(
                  'Contact Information',
                  style: GoogleFonts.kanit(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color(
                      0xff189B58,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: contactInfoList.length,
                  itemBuilder: (context, index) {
                    final item = contactInfoList[index];
                    return ListTile(
                      onTap: () {},
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      horizontalTitleGap: 0,
                      minLeadingWidth: 32,
                      minVerticalPadding: 0,
                      leading: SvgPicture.asset(
                        item.icon,
                      ),
                      title: Text(
                        item.title,
                        style: GoogleFonts.kanit(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: const Color(
                            0xff828282,
                          ),
                        ),
                      ),
                      trailing: Text(
                        item.data,
                        style: GoogleFonts.kanit(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: const Color(
                            0xff313131,
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
        ],
      ),
    );
  }
}
