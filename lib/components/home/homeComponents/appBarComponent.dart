import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/home/search.dart';
import 'package:we_link/components/home/searchAddress.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/address/my_address_response.dart';

import '../../profile/myWallet.dart';

enum AppBarType { HOME, PROFILE }

class AppBarComponent extends StatefulWidget {
  final double? currentBalance;
  final AppBarType? appBarProfile;
  final AddressResponse? address;

  AppBarComponent(
    this.appBarProfile,
    this.currentBalance,
    this.address,
  );

  @override
  State<AppBarComponent> createState() => _AppBarComponentState();
}

class _AppBarComponentState extends AppState<AppBarComponent, AppBarViewModel> {
  @override
  AppBarViewModel initViewModel(AppBarViewModel viewModel) {
    viewModel.setAddress(widget.address!);
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, AppBarViewModel viewModel) {
    return Obx(() {
      if (viewModel.address.value.id == null) {
        return SizedBox(height: 0,);
      }  else{
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  var result = await Get.to(SelectAddressScreen());
                  if (result != null) {
                    viewModel.setAddress(result);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            'assets/images/lo.png',
                            fit: BoxFit.fill,
                            height: 12,
                            width: 12,
                          ),
                        ),
                        Expanded(
                          child: Obx(() => Text.rich(
                            TextSpan(
                              text: viewModel.address.value.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Kanit'),
                            ),
                          )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: Image.asset(
                            'assets/images/arrowdown.png',
                            fit: BoxFit.fill,
                            height: 6,
                            width: 11,
                          ),
                        ),
                        widget.appBarProfile == AppBarType.PROFILE
                            ? const Spacer()
                            : Container()
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15, top: 2),
                      child: Obx(() => Text.rich(
                        TextSpan(
                          text: viewModel.address.value.address,
                          style: TextStyle(
                              color: Color(0xFF9FA7C5),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Kanit'),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            if (widget.appBarProfile == AppBarType.HOME) ...[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => myWallet()),
                  );
                },
                child: Container(
                  width: 120,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3E3E3E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: const Text(
                          'Wallet',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Kanit',
                              color: Color(0xFF9FA7C5)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12, right: 10, top: 2),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 2),
                              child: Image.asset(
                                'assets/images/wallet.png',
                                fit: BoxFit.fill,
                                height: 11,
                                width: 14,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text.rich(TextSpan(
                                    text: '${widget.currentBalance ?? 0}฿',
                                    style: const TextStyle(
                                        color: yellowColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Kanit'),
                                  ))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            GestureDetector(
              onTap: () {
                Get.to(HomeSearchScreen());
              },
              child: Container(
                margin: const EdgeInsets.only(
                  left: 15,
                ),
                child: Image.asset(
                  'assets/images/search.png',
                  fit: BoxFit.fill,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}

class AppBarViewModel extends GetxController {
  var address = AddressResponse().obs;

  void setAddress(AddressResponse address) {
    this.address.value = address;
  }
}
