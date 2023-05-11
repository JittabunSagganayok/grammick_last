import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/search/ui/recent/recent_search_viewmodel.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';

import '../../../../shared/textfield/we_textfield_border_widget.dart';
import '../../../base/base_we_state.dart';

class RecentSearchScreen extends StatefulWidget {
  @override
  State<RecentSearchScreen> createState() => _RecentSearchScreenState();
}

class _RecentSearchScreenState
    extends AppState<RecentSearchScreen, RecentSearchViewModel> {
  @override
  RecentSearchViewModel initViewModel(RecentSearchViewModel viewModel) {
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, RecentSearchViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: '',
            onBackPressed: () {
              navigator?.pop();
            },
            widgetTitle: WeTextFieldBorderWidget(
              hintLabel: 'Search',
              borderColor: Colors.white,
              textColor: Color(0xffCECECE),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff303030),
              ),
              onTextChanged: (text) {},
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return ListTile(
                  visualDensity: VisualDensity.compact,
                  title: Text('Bagkapi',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right_outlined,
                    ),
                  ),
                );
              },
              itemCount: 3,
            )
          ]))
        ],
      ),
    );
  }
}
