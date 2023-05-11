import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/booking/ui/table/booking_table_screen.dart';
import 'package:we_link/feature/order/ui/choose_your_order_viewmodel.dart';
import 'package:we_link/feature/restaurant/ui/menu_info_screen.dart';
import 'package:we_link/shared/button/app_button_bar.dart';

import '../../../components/alert/asking_alert.dart';
import '../../../constant/colosrConstants.dart';
import '../../restaurant/ui/components/restaurant_item_add_more_menu_widget.dart';
import '../../restaurant/ui/restaurant_main_viewmodel.dart';
import '../../restaurant/ui/zone/restaurant_zone_screen.dart';

class ChooseYourOrderArguments {
  num? merchantId;
  bool fromBookingPage;

  ChooseYourOrderArguments({
    this.merchantId,
    this.fromBookingPage = false,
  });
}

class ChooseYourOrderScreen extends StatefulWidget {
  @override
  State<ChooseYourOrderScreen> createState() => _ChooseYourOrderScreenState();
}

class _ChooseYourOrderScreenState
    extends AppState<ChooseYourOrderScreen, ChooseYourOrderViewModel> {
  @override
  ChooseYourOrderViewModel initViewModel(ChooseYourOrderViewModel viewModel) {
    if (Get.arguments is ChooseYourOrderArguments) {
      viewModel.setArguments(Get.arguments);
    }

    viewModel.init();

    return viewModel;
  }

  @override
  Widget onCreateView(
    BuildContext context,
    ChooseYourOrderViewModel viewModel,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 32),
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
                  margin: const EdgeInsets.only(top: 24),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    'Food item of your choice',
                    style: GoogleFonts.kanit(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Obx(() {
                return ListView.separated(
                  itemCount: viewModel.itemInCart.length,
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var itemMenu = viewModel.itemInCart[index];

                    return RestaurantItemAddMoreMenuWidget(
                      added: true,
                      id: itemMenu.id,
                      image: itemMenu.image,
                      name: itemMenu.name,
                      description: itemMenu.description,
                      price: itemMenu.price,
                      quantity: itemMenu.quantity!,
                      onClick: () {
                        Get.to(
                          () => MenuInfoScreen(),
                          transition: Transition.downToUp,
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 16,
                    color: dividerColor,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: viewModel.fromBookingPage
          ? const SizedBox()
          : AppButtonBar(
              title: viewModel.getSumPriceText(),
              onClicked: () {
                if (viewModel.itemInCartData?.itemData == null ||
                    viewModel.itemInCartData!.itemData!.isEmpty) {
                  askingAlert(
                    context,
                    title: 'คุณยังไม่เลือกเมนู',
                    message: 'กรุณาเลือกเมนู',
                  );
                  return;
                }
                Get.to(
                  () => RestaurantZoneScreen(),
                  arguments: RestaurantZoneArgument(viewModel.merchantId!),
                  transition: Transition.downToUp,
                );
                // Get.to(
                //   () => BookingTableScreen(),
                //   transition: Transition.downToUp,
                // );
              },
            ),
    );
  }
}
