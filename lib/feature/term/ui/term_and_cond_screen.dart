import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/term/ui/term_and_cond_viewmodel.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';

import '../../booking/ui/components/booking_service_info_section.dart';

class TermArguments {
  BookingServiceInfoItemType type;

  TermArguments(this.type);
}

class TermAndCondScreen extends StatefulWidget {
  @override
  State<TermAndCondScreen> createState() => _TermAndCondScreenState();
}

class _TermAndCondScreenState
    extends AppState<TermAndCondScreen, TermAndCondViewModel> {
  @override
  TermAndCondViewModel initViewModel(TermAndCondViewModel viewModel) {
    TermArguments arguments = Get.arguments;
    viewModel.type = arguments.type;
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, TermAndCondViewModel viewModel) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: viewModel.type == BookingServiceInfoItemType.POLICY
                ? 'Restaurant Policy'
                : 'Terms & Conditions',
            onBackPressed: () {
              navigator?.pop();
            },
          )
        ],
      ),
    );
  }
}
