import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/colosrConstants.dart';
import '../../../../constant/stylesConstants.dart';
import '../../../../shared/button/app_button_bar.dart';
import '../../../../shared/loading/loading_fullscreen.dart';
import '../../../base/base_we_state.dart';
import '../../../order/ui/choose_your_order_screen.dart';
import '../../../we_service/route/we_service_route.dart';
import '../checkin/booking_checkin_screen.dart';
import '../components/booking_confirmation_payment_method_widget.dart';
import '../summary/booking_summary_screen.dart';
import 'booking_table_viewmodel.dart';

class BookingTableArgument {
  num merchantId;
  num zoneId;
  num tableId;

  BookingTableArgument({
    required this.merchantId,
    required this.zoneId,
    required this.tableId,
  });
}

class BookingTableScreen extends StatefulWidget {
  @override
  State<BookingTableScreen> createState() => _BookingTableScreenState();
}

class _BookingTableScreenState
    extends AppState<BookingTableScreen, BookingTableViewModel> {
  @override
  BookingTableViewModel initViewModel(BookingTableViewModel viewModel) {
    if (Get.arguments is BookingTableArgument) {
      viewModel.setArguments(Get.arguments);
    }

    viewModel.getItemInCartBooking();

    return viewModel;
  }

  @override
  Widget onCreateView(
    BuildContext context,
    BookingTableViewModel viewModel,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: 80,
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                navigator?.pop();
              },
              icon: SvgPicture.asset('assets/icon_close_sheet.svg'),
            ),
            centerTitle: true,
            title: Text(
              'Book a table',
              style: titleWhiteAppbar,
            ),
          ),
          SliverFillRemaining(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32))),
                  height: 80,
                ),
                Obx(() {
                  if (viewModel.loading.isTrue) {
                    return LoadingFullscreen();
                  }

                  return Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: 388,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ExtendedImage.asset(
                                      'assets/mock/mock_rest_logo.png',
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Small Pizza Hawaii',
                                            style: GoogleFonts.kanit(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '(The Mall Bangkapi ) 4.3 km',
                                                style: GoogleFonts.kanit(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                    color: const Color(
                                                        0xff4D4D4D)),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              SvgPicture.asset(
                                                  'assets/ic_rating_full.svg'),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '4.5',
                                                style: GoogleFonts.kanit(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                    color: const Color(
                                                        0xff4D4D4D)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(
                                  height: 16,
                                  color: Color(0xffEFEFEF),
                                ),
                                Text(
                                  'When do you want to visit this place?',
                                  style: GoogleFonts.kanit(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff4D4D4D)),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => BookingCheckInScreen(),
                                        arguments: BookingType(
                                          allowSelectMultiple: false,
                                        ),
                                        transition: Transition.downToUp);
                                  },
                                  child: Container(
                                    height: 52,
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.only(top: 16),
                                    decoration: const BoxDecoration(
                                        color: Color(0xffFAFAFA)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          'Reservation',
                                          style: GoogleFonts.kanit(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff191919)),
                                        )),
                                        Text(
                                          '(Today) 11 May 2021',
                                          style: GoogleFonts.kanit(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff189B58)),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color(0xff323232),
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 52,
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(top: 16),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffFAFAFA)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'Time',
                                        style: GoogleFonts.kanit(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff191919)),
                                      )),
                                      Text(
                                        '11 : 30 pm',
                                        style: GoogleFonts.kanit(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xffBABABA)),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xff323232),
                                        size: 16,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 52,
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(top: 16),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffFAFAFA)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'How many people?',
                                        style: GoogleFonts.kanit(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff191919)),
                                      )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xffF3F3F3),
                                              ),
                                              child: const Icon(Icons.remove),
                                              width: 24,
                                              height: 24,
                                              alignment: Alignment.center,
                                            ),
                                            onTap: () {},
                                          ),
                                          SizedBox(
                                            width: 64,
                                            child: Text(
                                              '1',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.kanit(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          InkWell(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xffCEFFCD),
                                              ),
                                              child: const Icon(Icons.add),
                                              width: 24,
                                              height: 24,
                                              alignment: Alignment.center,
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => ChooseYourOrderScreen(),
                                      transition: Transition.downToUp,
                                      arguments: ChooseYourOrderArguments(
                                        merchantId:
                                            viewModel.argument.merchantId,
                                        fromBookingPage: true,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 52,
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.only(top: 16),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffFAFAFA),
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        SvgPicture.asset(
                                          'assets/ic_order_list.svg',
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Menu',
                                            style: GoogleFonts.kanit(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff191919),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 32,
                                          height: 32,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff189B58)),
                                          child: Text(
                                            '${viewModel.itemInCartData!.itemData!.length}',
                                            style: GoogleFonts.kanit(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color(0xff323232),
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: BookingConfirmationPaymentMethodWidget(),
                      ),
                    ],
                  );
                }),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: viewModel.loading.isTrue
          ? const SizedBox()
          : AppButtonBar(
              title: viewModel.getSumPriceText(),
              onClicked: () async {
                Get.dialog(LoadingFullscreen(
                  backgroundColor: Colors.black45,
                ));

                await viewModel.updateBooking();
                await viewModel.sendBookingPlace();

                navigator?.popUntil(
                  (route) =>
                      route.settings.name == WeServiceRoute.weServiceScreen,
                );

                await Get.to(
                  BookingSummaryScreen(),
                  arguments: BookingSummaryArguments(
                    isConfirmation: true,
                    bookingId: viewModel.itemInCartData!.cartData!.bookingId!,
                  ),
                  transition: Transition.rightToLeft,
                );
              },
            ),
    );
  }
}
