import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/text/app_text_border.dart';

import 'booking_cancel_order_viewmodel.dart';

class BookingCancelOrderScreen extends StatefulWidget {
  @override
  State<BookingCancelOrderScreen> createState() =>
      _BookingCancelOrderScreenState();
}

class _BookingCancelOrderScreenState
    extends AppState<BookingCancelOrderScreen, BookingCancelOrderViewModel> {
  @override
  Widget onCreateView(
      BuildContext context, BookingCancelOrderViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
              title: 'Cancel',
              onBackPressed: () {
                navigator?.pop();
              }),
          SliverFillRemaining(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Description to cancel',
                        style: GoogleFonts.kanit(fontSize: 13,fontWeight: FontWeight.w300,),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        minLines: 5,
                        maxLines: 5,
                        style: GoogleFonts.kanit(
                          textStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xffBBBBBB))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xffBBBBBB)))),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: AppTextBorder(
                              title: 'I have a problem',
                              borderColor: Color(0xffF3F3F3),
                              backgroundColor: Color(0xffF3F3F3),
                              fontColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 48,
                        margin: EdgeInsets.only(top: 32),
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: yellowColor,
                            side: BorderSide(width: 1, color: yellowColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          onPressed: () {
                            navigator?.pop();
                          },
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  BookingCancelOrderViewModel initViewModel(
    BookingCancelOrderViewModel viewModel,
  ) {
    return viewModel;
  }
}
