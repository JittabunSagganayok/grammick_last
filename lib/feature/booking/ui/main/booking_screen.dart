import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/booking/ui/summary/booking_summary_screen.dart';
import 'package:we_link/feature/booking/ui/main/booking_viewmodel.dart';
import 'package:we_link/feature/booking/ui/components/booking_tab_widget.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends AppState<BookingScreen, BookingViewModel> {
  @override
  BookingViewModel initViewModel(BookingViewModel viewModel) {
    viewModel.init();
    return viewModel;
  }

  @override
  Widget onCreateView(
    BuildContext context,
    BookingViewModel viewModel,
  ) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: 'My Reservation',
            onBackPressed: () {
              navigator?.pop();
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Obx(
                  () => Container(
                    height: 48,
                    margin: const EdgeInsets.only(top: 16),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        indent: 8,
                        endIndent: 8,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = viewModel.bookingTabs[index];
                        return BookingTabWidget(
                          item: item,
                          onClicked: () {
                            viewModel.updateTabChanged(index);
                          },
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.bookingTabs.length,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 24),
                  child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      height: 16,
                      color: dividerColor,
                    ),
                    itemCount: viewModel.bookingList.length,
                    itemBuilder: (context, index) {
                      var item = viewModel.bookingList[index];
                      var mechantData = item.merchantData;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Order :    ${item.bookingCode ?? '-'}',
                                  style: GoogleFonts.kanit(
                                    fontSize: 10,
                                    color: const Color(0xff949494),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  item.status ?? '-',
                                  style: GoogleFonts.kanit(
                                    fontSize: 10,
                                    color: const Color(0xff949494),
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              ExtendedImage.network(
                                mechantData!.profileImage!,
                                width: 40,
                                height: 40,
                                shape: BoxShape.circle,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mechantData.name ?? '-',
                                      style: GoogleFonts.kanit(
                                        fontSize: 16,
                                        color: titleBlackColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '(14, Ekkamai Tonglor...)',
                                          style: GoogleFonts.kanit(
                                            fontSize: 11,
                                            color: titleBlackColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icon_star_yellow.svg',
                                          width: 12,
                                          height: 12,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '4.5',
                                          style: GoogleFonts.kanit(
                                            fontSize: 10,
                                            color: titleBlackColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffFFEBC1),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        color: Color(0xffD7970D),
                                      ),
                                      Text(
                                        item.reservationDate != null
                                            ? DateFormat(
                                                    'dd MMM yyyy / hh : mm')
                                                .format(
                                                DateTime.parse(
                                                  item.reservationDate!,
                                                ),
                                              )
                                            : '-',
                                        style: GoogleFonts.kanit(
                                          fontSize: 12,
                                          color: const Color(0xffD7970D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(
                                    BookingSummaryScreen(),
                                    arguments: BookingSummaryArguments(
                                      isConfirmation: false,
                                      bookingId: item.id,
                                    ),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffCEFFCD),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                child: Text(
                                  'See more',
                                  style: GoogleFonts.kanit(
                                    fontSize: 12,
                                    color: const Color(0xff189B58),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
