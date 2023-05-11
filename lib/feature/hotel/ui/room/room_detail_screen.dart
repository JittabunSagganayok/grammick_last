import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/booking/ui/confirmation/booking_confirmation_screen.dart';
import 'package:we_link/feature/hotel/ui/room/room_detail_viewmodel.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/button/app_button_bar.dart';

import '../../../../shared/gridview/grid_view_fix_height.dart';
import '../component/detail/hotel_room_list_widget.dart';
import '../component/room/room_price_section.dart';

class RoomDetailScreen extends StatefulWidget {
  @override
  State<RoomDetailScreen> createState() => _RoomDetailScreenState();
}

enum RoomSpecialRequest { smoking, non_smoking }

class _RoomDetailScreenState
    extends AppState<RoomDetailScreen, RoomDetailViewModel> {
  RoomSpecialRequest? _roomSpecialRequest = RoomSpecialRequest.smoking;

  final PageController pageController = PageController();

  @override
  Widget onCreateView(BuildContext context, RoomDetailViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: '',
            onBackPressed: () {
              navigator?.pop();
            },
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ExtendedImage.asset(
                        'assets/mock/mock_hotel_detail.jpg',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Standard Twin Room',
                        style: GoogleFonts.kanit(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      gridDelegate: GridViewFixHeight(
                          crossAxisCount: 3,
                          height: 40,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8),
                      itemCount: viewModel.roomOption.length,
                      itemBuilder: (context, index) {
                        final item = viewModel.roomOption[index];
                        return HotelOptionWidget(
                          item.icon,
                          item.label,
                        );
                      },
                    ),
                    Divider(
                      thickness: 8,
                      color: appBackgroundColor,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Color(0xff189B58)),
                      child: RoomPriceSection(),
                    ),
                    Divider(
                      thickness: 8,
                      color: appBackgroundColor,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: RichText(
                        text: TextSpan(
                            text: 'Summary : ',
                            style: GoogleFonts.kanit(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Taxes and fees are not included.',
                                style: GoogleFonts.kanit(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff6C6C6C)),
                              )
                            ]),
                      ),
                    ),
                    Divider(
                      thickness: 8,
                      color: appBackgroundColor,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Options    ',
                                style: GoogleFonts.kanit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: '( Choose more than 1 )',
                                    style: GoogleFonts.kanit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffCBCBCB)),
                                  )
                                ]),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                value: true,
                                checkColor: Colors.white,
                                activeColor: Color(0xffFDCD03),
                                contentPadding: EdgeInsets.all(0),
                                visualDensity: VisualDensity.compact,
                                isThreeLine: false,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (checked) {},
                                title: Text(
                                  'Breakfast',
                                  style: GoogleFonts.kanit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                secondary: Text(
                                  '+300 ฿',
                                  style: GoogleFonts.kanit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff808080)),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 8,
                      color: appBackgroundColor,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Spacial Request    ',
                                style: GoogleFonts.kanit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: '( 1 Choose )',
                                    style: GoogleFonts.kanit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffCBCBCB)),
                                  )
                                ]),
                          ),
                          Column(
                            children: [
                              RadioListTile<RoomSpecialRequest>(
                                title: Text(
                                  'Smoking room',
                                  style: GoogleFonts.kanit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                activeColor: Color(0xffFDCD03),
                                value: RoomSpecialRequest.smoking,
                                groupValue: _roomSpecialRequest,
                                onChanged: (RoomSpecialRequest? value) {},
                              ),
                              RadioListTile<RoomSpecialRequest>(
                                title: Text(
                                  'Non Smoking room',
                                  style: GoogleFonts.kanit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                activeColor: Color(0xffFDCD03),
                                value: RoomSpecialRequest.non_smoking,
                                groupValue: _roomSpecialRequest,
                                onChanged: (RoomSpecialRequest? value) {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 8,
                      color: appBackgroundColor,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: viewModel.serviceInfoList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = viewModel.serviceInfoList[index];
                              return Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: item.backgroundColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: item.iconColor),
                                      child: SvgPicture.asset(
                                        item.icon,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Text(
                                        item.title,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.kanit(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color(
                                            0xff3D3D3D,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: item.iconColor),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(
                              height: 16,
                              color: Colors.transparent,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'Condition   ',
                                style: GoogleFonts.kanit(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff102540)),
                                children: [
                                  TextSpan(
                                    text: r"'*Can't get a refund'",
                                    style: GoogleFonts.kanit(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300,
                                      color: Color(
                                        0xff6C6C6C,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: AppButtonBar.withLeftIcon(
        title: 'Reserve',
        onClicked: () {
          Get.to(
            BookingConfirmationScreen(),
            transition: Transition.rightToLeft,
          );
        },
        backgroundColor: Color(0xff212B32),
        textColor: Colors.white,
        leadingWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffF3F3F3),
                ),
                child: Icon(Icons.remove),
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 48,
              child: Text(
                '1',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            IconButton(
              icon: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffCEFFCD),
                ),
                child: Icon(Icons.add),
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 16,
            )
          ],
        ),
      ),
    );
  }

  @override
  RoomDetailViewModel initViewModel(
    RoomDetailViewModel viewModel,
  ) {
    return viewModel;
  }
}
