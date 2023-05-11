import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/booking/ui/checkin/booking_checkin_screen.dart';
import 'package:we_link/feature/booking/ui/components/booking_confirmation_contact_info_widget.dart';
import 'package:we_link/feature/booking/ui/components/booking_confirmation_detail_widget.dart';
import 'package:we_link/feature/booking/ui/components/booking_confirmation_payment_method_widget.dart';
import 'package:we_link/feature/booking/ui/confirmation/booking_confirmation_viewmodel.dart';
import 'package:we_link/feature/booking/ui/summary/booking_summary_screen.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/button/app_button_bar.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../../../constant/colosrConstants.dart';
import '../components/booking_confirmation_summary_widget.dart';
import '../components/header_calendar_booking_widget.dart';

class BookingConfirmationScreen extends StatefulWidget {
  @override
  _BookingConfirmationScreenState createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState
    extends AppState<BookingConfirmationScreen, BookingConfirmationViewModel> {
  @override
  Widget onCreateView(
      BuildContext context, BookingConfirmationViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: 'Booking',
            onBackPressed: () {
              navigator?.pop();
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: InkWell(
                  onTap: () async {
                    BookingDateArgument arguments = await Get.to(
                      BookingCheckInScreen(),
                      transition: Transition.downToUp,
                    );
                  },
                  child: HeaderCalendarBookingWidget(
                    startDate: DateFormat('dd MMM').format(DateTime.now()),
                    endDate: DateFormat('dd MMM').format(DateTime.now()),
                    showHeader: false,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Text(
                  'Detail',
                  style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff212B32)),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.symmetric(vertical: 16),
                child: BookingConfirmationDetailWidget(),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: BookingConfirmationContactInfoWidget(),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: BookingConfirmationPaymentMethodWidget(),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: BookingConfirmationSummaryWidget(),
              ),
            ]),
          )
        ],
      ),
      bottomNavigationBar: AppButtonBar(
        title: 'Reserve (20,823 ฿)',
        backgroundColor: Color(0xff212B32),
        textColor: Colors.white,
        onClicked: () async {
          Get.dialog(LoadingFullscreen(
            backgroundColor: Colors.black45,
          ));

          await Future.delayed(Duration(seconds: 3)).then((value) {
            navigator?.pop();
          });
          await Get.to(
            BookingSummaryScreen(),
            arguments: BookingSummaryArguments(
              isConfirmation: true,
              //! bookingId:
            ),
            transition: Transition.rightToLeft,
          );
        },
      ),
    );
  }

  @override
  BookingConfirmationViewModel initViewModel(
    BookingConfirmationViewModel viewModel,
  ) =>
      viewModel;
}
