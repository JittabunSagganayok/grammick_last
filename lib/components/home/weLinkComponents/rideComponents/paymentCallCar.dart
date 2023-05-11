import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/payment/payment_option_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

class PaymentMethodScreen extends StatefulWidget {
  final String? paymentSelected;

  PaymentMethodScreen({
    this.paymentSelected,
  });

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends AppState<PaymentMethodScreen, PaymentMethodViewModel> {

  void clickSelects(i) {
    setState(() {
      viewModel.indexSelects = i;
    });
  }

  @override
  PaymentMethodViewModel initViewModel(PaymentMethodViewModel viewModel) {
    viewModel.getPaymentOption(widget.paymentSelected ?? "");
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, PaymentMethodViewModel viewModel) {
    return Obx(() {
      if (viewModel.options.isEmpty == true) {
        return LoadingFullscreen();
      } else {
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: AppBar(
                backgroundColor: blackColor,
                automaticallyImplyLeading: false,
                elevation: 0,
                shape: appbarBorder,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('assets/images/close1.png'),
                ),
                centerTitle: true,
                title: Text(
                  'Payment method',
                  style: titleWhiteAppbar,
                ),
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                        child: Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          for (var i = 0; i < viewModel.dataPayment.length; i++)
                            GestureDetector(
                              onTap: () => clickSelects(i),
                              child: Container(
                                  margin: EdgeInsets.only(top: 14),
                                  height: 54,
                                  width: MediaQuery.of(context).size.width * 1,
                                  decoration: BoxDecoration(
                                    color: viewModel.indexSelects == i
                                        ? yellowColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: [payMentShadow],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 13, right: 12),
                                        child: Image.asset(
                                          '${viewModel.dataPayment[i]['image']}',
                                          fit: BoxFit.fill,
                                          height: 32,
                                          width: 32,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                                child: Text.rich(
                                              TextSpan(
                                                  text:
                                                      "${viewModel.dataPayment[i]['name']}",
                                                  style: payMentText,
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          viewModel.dataPayment[
                                                                          i][
                                                                      'name'] ==
                                                                  'Wallet'
                                                              ? "  0 THB"
                                                              : '',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF189B58),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: 'Kanit'),
                                                    )
                                                  ]),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                            viewModel.dataPayment[i]['name'] ==
                                                    'Credit / debit'
                                                ? Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          left: 9,
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/visa-logo.png',
                                                          fit: BoxFit.fill,
                                                          height: 12,
                                                          width: 32,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 9, right: 17),
                                                        child: Image.asset(
                                                          'assets/images/master.png',
                                                          fit: BoxFit.fill,
                                                          height: 11,
                                                          width: 19,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                      viewModel.indexSelects == i
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left: 9, right: 17),
                                              child: Image.asset(
                                                'assets/images/success.png',
                                                fit: BoxFit.fill,
                                                height: 18,
                                                width: 18,
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  )),
                            ),
                        ],
                      ),
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            color: Colors.grey[300]!,
                            spreadRadius: 8)
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 30),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.black,
                            textStyle: TextStyle(fontSize: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            side: BorderSide(
                              width: 0.0,
                              color: yellowColor,
                            ),
                          ),
                          onPressed: () {
                            navigator?.pop(
                                viewModel.dataPayment[viewModel.indexSelects]);
                          },
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      }
    });
  }
}

class PaymentMethodViewModel extends GetxController {
  Dio dio;

  var options = <String>[].obs;

  var indexSelects = -1;

  var dataPayment = [
    {"image": "assets/images/money.png", "name": "เงินสด"},
    {"image": "assets/images/wallet1.png", "name": "Wallet"},
    {"image": "assets/images/credit.png", "name": "Credit / debit"},
  ];

  PaymentMethodViewModel(this.dio);

  Future getPaymentOption(String paymentSelected) async {
    var response = await dio.get('activities/payment-option');
    PaymentOptionResponse data = PaymentOptionResponse.fromJson(response.data);
    options.value = data.result ?? [];

    dataPayment[0]['name'] = options[0];
    dataPayment[1]['name'] = options[1];
    dataPayment[2]['name'] = options[2];

    var index = -1;
    for (var element in dataPayment) {
      index++;
      if (element['name'] == paymentSelected) {
        indexSelects = index;
      }
    }
  }
}
