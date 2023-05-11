import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/booking/ui/checkin/booking_checkin_screen.dart';
import 'package:we_link/feature/search/ui/recent/recent_search_screen.dart';
import 'package:we_link/feature/search/ui/result/result_search_screen.dart';
import 'package:we_link/feature/search/ui/hotel/search_hotel_viewmodel.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/text/app_text_border.dart';
import 'package:we_link/shared/textfield/we_textfield_border_widget.dart';

class SearchHotelScreen extends StatefulWidget {
  @override
  _SearchHotelScreenState createState() => _SearchHotelScreenState();
}

class _SearchHotelScreenState
    extends AppState<SearchHotelScreen, SearchHotelViewModel> {
  @override
  Widget onCreateView(BuildContext context, SearchHotelViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: 'Search',
            onBackPressed: () {
              navigator?.pop();
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            AppTextBorder(
                              title: 'Overnight',
                              borderColor: Color(0xff564FF0),
                              backgroundColor: Color(0xff564FF0),
                              fontColor: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            AppTextBorder(
                              title: 'Monthly',
                              borderColor: Color(0xffEDEDED),
                              backgroundColor: Color(0xffEDEDED),
                              fontColor: Color(0xff3C3C3C),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        WeTextFieldBorderWidget(
                          hintLabel: 'Search',
                          readOnly: true,
                          prefixIcon:
                              Icon(Icons.search, color: Color(0xff303030)),
                          suffixIcon:
                              Icon(Icons.send, color: Color(0xffB9B9B9)),
                          textColor: Color(0xffCECECE),
                          borderColor: Color(0xffEDEDED),
                          onTextChanged: (text) {},
                          onTap: () {
                            Get.to(
                              RecentSearchScreen(),
                              transition: Transition.rightToLeft,
                            );
                          },
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Check in',
                                style: GoogleFonts.kanit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff333333)),
                              ),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Expanded(
                              child: Text(
                                'Check out',
                                style: GoogleFonts.kanit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff333333)),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 48,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: viewModel.startDateController,
                                  readOnly: true,
                                  onTap: () async {
                                    BookingDateArgument arguments = await Get.to(
                                      BookingCheckInScreen(),
                                      transition: Transition.downToUp,
                                    );
                                    viewModel.setBookingDateArgument(arguments);
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 12),
                                      prefixIcon: Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.black),
                                      hintText: 'Date',
                                      hintStyle: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffCECECE),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                width: 1,
                                color: Color(0xffE5E5E5),
                                margin: EdgeInsets.symmetric(vertical: 8),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: viewModel.endDateController,
                                  readOnly: true,
                                  onTap: () {
                                    Get.to(
                                      BookingCheckInScreen(),
                                      transition: Transition.downToUp,
                                    );
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 12),
                                      prefixIcon: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.black,
                                      ),
                                      hintText: 'Date',
                                      hintStyle: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffCECECE),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              width: 1,
                              color: Color(0xffEDEDED),
                            ),
                          ),
                          margin: EdgeInsets.only(top: 8),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Options',
                                style: GoogleFonts.kanit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff333333)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        WeTextFieldBorderWidget(
                          hintLabel: '2 Adults  0 Child 1 Room',
                          readOnly: true,
                          onTap: () {},
                          textColor: Color(0xffCECECE),
                          borderColor: Color(0xffEDEDED),
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_right,
                            color: Color(
                              0xff232323,
                            ),
                          ),
                          onTextChanged: (text) {},
                        ),
                        Container(
                          height: 48,
                          margin: EdgeInsets.only(top: 32),
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color(0xff564FF0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            onPressed: () {
                              Get.to(ResultSearchScreen(),
                                  transition: Transition.rightToLeft);
                            },
                            child: Text(
                              'Search',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  SearchHotelViewModel initViewModel(SearchHotelViewModel viewModel) {
    return viewModel;
  }
}
