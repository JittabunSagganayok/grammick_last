import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';

import '../../../shared/booking/item_service_book_again_widget.dart';
import 'my_favourite_viewmodel.dart';

class MyFavouriteScreen extends StatefulWidget {
  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState
    extends AppState<MyFavouriteScreen, MyFavouriteViewModel> {
  @override
  Widget onCreateView(BuildContext context, MyFavouriteViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          WeAppBar(
            title: 'My Favorite',
            onBackPressed: () {
              navigator?.pop();
            },
          ),
          SliverFillRemaining(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              itemBuilder: (context, index) {
                return ItemServiceBookAgainWidget(
                  showBadge: false,
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 16,
                color: Colors.transparent,
              ),
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }

  @override
  MyFavouriteViewModel initViewModel(
    MyFavouriteViewModel viewModel,
  ) {
    return viewModel;
  }
}
