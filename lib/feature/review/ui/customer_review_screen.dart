import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/rating/app_rating.dart';

import 'customer_review_view_model.dart';

class CustomerReviewScreen extends StatefulWidget {
  @override
  _CustomerReviewScreenState createState() => _CustomerReviewScreenState();
}

class _CustomerReviewScreenState
    extends AppState<CustomerReviewScreen, CustomerReviewViewModel> {
  @override
  Widget onCreateView(BuildContext context, CustomerReviewViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: 'Review',
            onBackPressed: () {
              navigator?.pop();
            },
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(top: 16),
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Review',
                      style: GoogleFonts.kanit(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff313131)),
                    ),
                    trailing: Text(
                      '4.0',
                      style: GoogleFonts.kanit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC7C7C7)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1, horizontal: 16),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
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
                  ),
                  ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return ItemCustomerReviewWidget();
                    },
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      height: 16,
                      color: Colors.transparent,
                    ),
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }

  @override
  CustomerReviewViewModel initViewModel(
      CustomerReviewViewModel viewModel) {
    return viewModel;
  }
}

class ItemCustomerReviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Image.asset(
                    'assets/mock/mock_avatar.png'),
                backgroundColor: Colors.transparent,
                radius: 16,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  'Hirosu',
                  style: GoogleFonts.kanit(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icon_star_yellow.svg'),
                  SizedBox(width: 4,),
                  Text(
                    '4',
                    style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 8,),
          Text('บริการเยี่ยมมากบริการห้องพักดีมาก',style: GoogleFonts.kanit(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Color(0xff2D2D2D),
          ),)
        ],
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xffECECEC))),
    );
  }
}
