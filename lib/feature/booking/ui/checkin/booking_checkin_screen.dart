import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/booking/ui/checkin/booking_checkin_viewmodel.dart';
import 'package:we_link/shared/button/app_button_bar.dart';

import '../components/header_calendar_booking_widget.dart';

class BookingType {
  bool allowSelectMultiple;

  BookingType({
    this.allowSelectMultiple = true,
  });
}

class BookingDateArgument {
  DateTime startDate;
  DateTime endDate;

  BookingDateArgument(this.startDate, this.endDate);
}

class BookingCheckInScreen extends StatefulWidget {
  @override
  State<BookingCheckInScreen> createState() => _BookingCheckInScreenState();
}

class _BookingCheckInScreenState
    extends AppState<BookingCheckInScreen, BookingCheckInViewModel> {
  @override
  Widget onCreateView(BuildContext context, BookingCheckInViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  navigator?.pop();
                },
                icon: SvgPicture.asset(
                  'assets/icon_close_sheet.svg',
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: HeaderCalendarBookingWidget(
                  showHeader: true,
                  startDate: viewModel.getFormatDate(viewModel.startDate),
                  endDate: viewModel.getFormatDate(viewModel.startDate),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                ),
                child: SfDateRangePicker(
                  minDate: DateTime.now(),
                  headerStyle: DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center,
                    textStyle: GoogleFonts.kanit(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    backgroundColor: Color(0xffD9F6FF),
                  ),
                  backgroundColor: Colors.white,
                  selectionMode: viewModel.allowSelectMultiple
                      ? DateRangePickerSelectionMode.range
                      : DateRangePickerSelectionMode.single,
                  startRangeSelectionColor: Color(0xffFF4B40),
                  endRangeSelectionColor: Color(0xffFF4B40),
                  rangeSelectionColor: Color(0xff3DFFB9B5),
                  showNavigationArrow: false,
                  showActionButtons: false,
                  onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                    if (args.value is PickerDateRange) {
                      viewModel.setStartDate(args.value.startDate);
                      viewModel.setEndDate(args.value.endDate);
                    } else if (args.value is DateTime) {
                      viewModel.setStartDate(args.value);
                      viewModel.setEndDate(args.value);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => AppButtonBar(
            title: '(${viewModel.totalDays.value} Days) Confirm',
            textColor: Colors.white,
            onClicked: () {
              var arguments = BookingDateArgument(
                viewModel.startDate,
                viewModel.endDate,
              );
              navigator?.pop(arguments);
            },
            backgroundColor: Color(0xff564FF0),
          )),
    );
  }

  @override
  BookingCheckInViewModel initViewModel(BookingCheckInViewModel viewModel) {
    if (Get.arguments != null) {
      BookingType type = Get.arguments;
      viewModel.allowSelectMultiple = type.allowSelectMultiple;
    }
    return viewModel;
  }
}
