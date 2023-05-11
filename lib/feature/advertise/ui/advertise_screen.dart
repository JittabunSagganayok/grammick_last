import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/text/app_text_border.dart';

import 'advertise_viewmodel.dart';

class AdvertiseScreen extends StatefulWidget {
  @override
  State<AdvertiseScreen> createState() => _AdvertiseScreenState();
}

class _AdvertiseScreenState
    extends AppState<AdvertiseScreen, AdvertiseViewModel> {
  @override
  Widget onCreateView(BuildContext context, AdvertiseViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: '',
            onBackPressed: () {
              navigator?.pop();
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ExtendedImage.network(
                  'https://images.unsplash.com/photo-1578916171728-46686eac8d58?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bWFya2V0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                  fit: BoxFit.fill,
                  height: 200,
                ),
                Padding(
                  padding: EdgeInsets.all(
                    16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deal Promotions',
                        style: GoogleFonts.kanit(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(
                            0xff121212,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        r'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        style: GoogleFonts.kanit(
                          fontSize: 13,
                          color: Color(0xff706F6F),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          AppTextBorder(
                              title: 'For you',
                              borderColor: Color(0xffFDB824),
                              backgroundColor: Color(0xffFDB824),
                              fontColor: Colors.white),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            'date : 20 / 02 / 2022',
                            style: GoogleFonts.kanit(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Color(
                                0xff9E9E9E,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 48,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: blackColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            onPressed: () {
              navigator?.pop();
            },
            child: Text(
              'Use it',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit'),
            ),
          ),
        ),
      ),
    );
  }

  @override
  AdvertiseViewModel initViewModel(AdvertiseViewModel viewModel) {
    return viewModel;
  }
}
