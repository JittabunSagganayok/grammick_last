import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/hotel/ui/component/detail/hotel_facilities_service_section.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/button/app_button_bar.dart';

import '../component/detail/hotel_customer_review_section.dart';
import '../component/detail/hotel_detail_gallery_widget.dart';
import '../component/detail/hotel_detail_information_section.dart';
import '../component/detail/hotel_detail_information_widget.dart';
import '../component/detail/hotel_room_list_widget.dart';
import 'hotel_detail_viewmodel.dart';

class HotelDetailScreen extends StatefulWidget {
  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState
    extends AppState<HotelDetailScreen, HotelDetailViewModel> {
  @override
  Widget onCreateView(BuildContext context, HotelDetailViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: '',
            onBackPressed: () {
              navigator?.pop();
            },
            actionsButton: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icon_share.svg',
                ),
              )
            ],
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  ExtendedImage.asset(
                    'assets/mock/mock_hotel_detail.jpg',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 64,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Color(0xff0F0F0F).withAlpha(0),
                            Color(0xff000000).withAlpha(80),
                          ])),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: HotelDetailGalleryWidget(),
                  color: Colors.white,
                ),
                Container(
                  child: HotelDetailInformationWidget(),
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Facilities & Service',
                        style: GoogleFonts.kanit(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Container(
                        height: 96,
                        child: HotelFacilitiesServiceSection(
                            viewModel.facilitiesItem),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: HotelDetailInformationSection(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  margin: EdgeInsets.only(top: 16),
                  color: Colors.white,
                  child: HotelCustomerReviewSection(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rooms',
                        style: GoogleFonts.kanit(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      HotelRoomListWidget(
                        viewModel.roomOption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: AppButtonBar.withLeftIcon(
        title: 'See The Room',
        onClicked: () {},
        textColor: Colors.white,
        backgroundColor: Color(
          0xff564FF0,
        ),
        leadingWidget: InkWell(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xff189B58),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SvgPicture.asset('assets/icon_call.svg'),
                margin: EdgeInsets.only(right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HotelDetailViewModel initViewModel(HotelDetailViewModel viewModel) {
    return viewModel;
  }
}
