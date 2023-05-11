import 'dart:ui';

import 'package:get/state_manager.dart';

class PaymentMethodViewModel extends GetxController {
  var paymentItem = <PaymentMethodItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    paymentItem.add(PaymentMethodItem(
        icon: 'assets/icon_wallet.svg',
        title: 'Wallet',
        type: PaymentMethodType.WALLET,
        price: '4,870'));
    paymentItem.add(PaymentMethodItem(
      icon: 'assets/icon_cash.svg',
      title: 'Cash',
      type: PaymentMethodType.CASH,
    ));
    paymentItem.add(PaymentMethodItem(
      icon: 'assets/icon_credit_card.svg',
      title: 'Credit / debit',
      type: PaymentMethodType.CREDIT_CARD,
    ));
  }

  void setPaymentMethodSelected(PaymentMethodItem item) {
    paymentItem.where((element) => element.checked).map((element) => element.checked = false).toList();
    paymentItem.where((element) => element.title == item.title).map((element) => element.checked = true).toList();
    paymentItem.refresh();
  }
}

class PaymentMethodItem extends GetxController {
  String icon;
  String title;
  String? price;
  bool checked;
  PaymentMethodType type;
  Color colorActive, colorDefault;

  PaymentMethodItem({
    required this.icon,
    required this.title,
    required this.type,
    this.colorDefault = const Color(0xffFFFFFF),
    this.colorActive = const Color(0xffFDCD03),
    this.checked = false,
    this.price,
  });
}

enum PaymentMethodType { WALLET, CASH, CREDIT_CARD }
