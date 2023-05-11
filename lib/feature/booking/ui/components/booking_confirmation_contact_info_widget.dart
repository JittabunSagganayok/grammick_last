import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/dash/dash_widget.dart';
import '../../../../shared/textfield/we_textfield_border_widget.dart';

enum BookingType { BOOKING_FOR_OTHER, NONE }

class BookingConfirmationContactInfoWidget extends StatelessWidget {
  BookingType? bookingType = BookingType.BOOKING_FOR_OTHER;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: GoogleFonts.kanit(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff212B32)),
        ),
        SizedBox(
          height: 16,
        ),
        WeTextFieldBorderWidget(
          hintLabel: 'Madison James',
          prefixIcon: Icon(
            Icons.person,
            color: Color(0xffDADADA),
          ),
          textColor: Color(0xff313131),
          borderColor: Color(0xffEDEDED),
          onTextChanged: (text) {},
        ),
        SizedBox(
          height: 16,
        ),
        WeTextFieldBorderWidget(
          hintLabel: 'Email',
          prefixIcon: Icon(
            Icons.email,
            color: Color(0xffDADADA),
          ),
          textColor: Color(0xff313131),
          borderColor: Color(0xffEDEDED),
          onTextChanged: (text) {},
        ),
        SizedBox(
          height: 16,
        ),
        WeTextFieldBorderWidget(
          hintLabel: 'Phone',
          prefixIcon: Icon(
            Icons.phone,
            color: Color(0xffDADADA),
          ),
          textColor: Color(0xff313131),
          borderColor: Color(0xffEDEDED),
          onTextChanged: (text) {},
        ),
        SizedBox(
          height: 16,
        ),
        WeTextFieldBorderWidget(
          hintLabel: 'Country',
          prefixIcon: Icon(
            Icons.map_outlined,
            color: Color(0xffDADADA),
          ),
          textColor: Color(0xff313131),
          borderColor: Color(0xffEDEDED),
          onTextChanged: (text) {},
        ),
        SizedBox(
          height: 16,
        ),
        DashWidget(
          height: 1,
          color: Color(0xffDEDEDE),
        ),
        RadioListTile<BookingType>(
          title: Text(
            'Book for Others',
            style: GoogleFonts.kanit(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          contentPadding: EdgeInsets.all(0),
          activeColor: Color(0xffFDCD03),
          value: BookingType.BOOKING_FOR_OTHER,
          groupValue: bookingType,
          onChanged: (BookingType? value) {},
        ),
        WeTextFieldBorderWidget(
          hintLabel: 'Name Lastname',
          prefixIcon: Icon(
            Icons.person,
            color: Color(0xffDADADA),
          ),
          textColor: Color(0xff313131),
          borderColor: Color(0xffEDEDED),
          onTextChanged: (text) {},
        ),
        SizedBox(
          height: 16,
        ),
        WeTextFieldBorderWidget(
          hintLabel: 'Country',
          prefixIcon: Icon(
            Icons.map_outlined,
            color: Color(0xffDADADA),
          ),
          textColor: Color(0xff313131),
          borderColor: Color(0xffEDEDED),
          onTextChanged: (text) {},
        ),
      ],
    );
  }
}
