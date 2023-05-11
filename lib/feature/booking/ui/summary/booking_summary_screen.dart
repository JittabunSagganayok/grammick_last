import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/booking/ui/components/booking_service_info_section.dart';
import 'package:we_link/feature/booking/ui/components/booking_summary_section.dart';
import 'package:we_link/feature/booking/ui/summary/booking_summary_viewmodel.dart';
import 'package:we_link/feature/term/ui/term_and_cond_screen.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/timeline_stepper/timeline_stepper_widget.dart';

import '../../../../shared/button/app_button_bar.dart';
import '../../../../shared/loading/loading_fullscreen.dart';
import '../cancel/booking_cancel_order_screen.dart';
import '../components/booking_code_section.dart';
import '../components/booking_order_detail_section.dart';
import '../components/booking_payment_detail.dart';

class BookingSummaryArguments {
  bool isConfirmation;
  int? bookingId;

  BookingSummaryArguments({
    this.isConfirmation = true,
    this.bookingId,
  });
}

class BookingSummaryScreen extends StatefulWidget {
  @override
  State<BookingSummaryScreen> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState
    extends AppState<BookingSummaryScreen, BookingSummaryViewModel> {
  @override
  BookingSummaryViewModel initViewModel(BookingSummaryViewModel viewModel) {
    BookingSummaryArguments arguments = Get.arguments;
    viewModel.setArguments(arguments);

    viewModel.init();

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, BookingSummaryViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: 'Summary',
            onBackPressed: () {
              navigator?.pop();
            },
          ),
          if (viewModel.loading.isFalse)
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    child: TimelineStepperWidget(
                      viewModel.timelineStepperList,
                    ),
                    margin: const EdgeInsets.only(top: 8),
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: BookingOrderDetailSection(
                      bookingData: viewModel.bookingData!,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: BookingCodeSection(
                      bookingData: viewModel.bookingData!,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    color: Colors.white,
                    child: BookingServiceInfoSection(
                      viewModel.serviceInfoList,
                      (type) {
                        switch (type) {
                          case BookingServiceInfoItemType.POLICY:
                            Get.to(
                              () => TermAndCondScreen(),
                              transition: Transition.rightToLeft,
                              arguments: TermArguments(type),
                            );
                            break;
                          case BookingServiceInfoItemType.TERM_AND_COND:
                            Get.to(
                              () => TermAndCondScreen(),
                              transition: Transition.rightToLeft,
                              arguments: TermArguments(type),
                            );
                            break;
                          default:
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: BookingPaymentDetail(
                      contactInfoList: viewModel.contactInfoList,
                      itemBookingList: viewModel.itemBooking,
                      bookingData: viewModel.bookingData!,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: BookingSummarySection(
                      bookingData: viewModel.bookingData!,
                      total: viewModel.total.toString(),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: viewModel.arguments.isConfirmation
          ? AppButtonBar.withLeftIcon(
              title: 'Done',
              onClicked: () {},
              expanded: true,
              leadingWidget: Container(
                margin: const EdgeInsets.only(right: 16),
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: const Color(0xffFECC9E),
                      backgroundColor: const Color(0xffF9F9F9),
                      textStyle: const TextStyle(fontSize: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      side: const BorderSide(
                        width: 0.0,
                        color: Color(0xffFECC9E),
                      ),
                    ),
                    onPressed: () {
                      Get.to(BookingCancelOrderScreen(),
                              transition: Transition.rightToLeft)
                          ?.then((value) => {navigator?.pop()});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Cancel Order',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Kanit'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : AppButtonBar(title: 'Done', onClicked: () {}),
    );
  }
}
