import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/rating/app_rating.dart';
import '../../../../review/ui/customer_review_screen.dart';

class HotelCustomerReviewSection extends StatelessWidget {
  final PageController pageController = PageController(
    viewportFraction: 0.93,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            'Review',
            style: GoogleFonts.kanit(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xff313131)),
          ),
          trailing: TextButton(
            onPressed: () {
              Get.to(CustomerReviewScreen(),
                  transition: Transition.rightToLeft);
            },
            child: Text(
              'See More',
              style: GoogleFonts.kanit(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffC7C7C7)),
            ),
          ),
          contentPadding: EdgeInsets.all(0),
          dense: true,
          visualDensity: VisualDensity.compact,
        ),
        Row(
          children: [
            AppRating(
              rating: 4,
              ignoreGestures: true,
              itemSize: 12,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '4',
              style: GoogleFonts.kanit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 96,
          child: PageView.builder(
              itemCount: 5,
              controller: pageController,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ItemCustomerReviewWidget(),
                );
              }),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
