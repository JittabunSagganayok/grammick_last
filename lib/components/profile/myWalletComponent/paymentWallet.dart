import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/profile/myWalletComponent/payment_webview.dart';
import 'package:we_link/components/profile/myWalletComponent/qr_payment.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../../di/app_module.dart';
import '../../../models/wallet/check_payment_status_response.dart';
import '../../../models/wallet/payment_link_response.dart';
import '../../../models/wallet/payment_qr_response.dart';
import '../../alert/weWallet/receivedSuccess.dart';
import '../myWallet.dart';

class PaymentWallet extends StatefulWidget {
  PaymentWallet({
    Key? key,
    this.amount = 0,
    this.isContinueOrder = false,
  }) : super(key: key);

  final double amount;
  bool isContinueOrder = false;

  @override
  State<PaymentWallet> createState() => _PaymentWalletState();
}

class _PaymentWalletState extends State<PaymentWallet> {
  var indexSelects = 0;
  var dataPayment = [
    {"image": "assets/images/qr.png", "name": "Qr PromptPay"},
    {"image": "assets/images/credit.png", "name": "Credit / debit"},
  ];

  void clickSelects(i) {
    setState(() {
      indexSelects = i;
    });

    print(indexSelects);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('amount ${widget.amount}');
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
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
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      for (var i = 0; i < dataPayment.length; i++)
                        GestureDetector(
                          onTap: () => clickSelects(i),
                          child: Container(
                              margin: const EdgeInsets.only(top: 14),
                              height: 54,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                color: indexSelects == i
                                    ? yellowColor
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [payMentShadow],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 13, right: 12),
                                    child: Image.asset(
                                      '${dataPayment[i]['image']}',
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
                                            text: "${dataPayment[i]['name']}",
                                            style: payMentText,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        dataPayment[i]['name'] ==
                                                'Credit / debit'
                                            ? Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
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
                                                    margin:
                                                        const EdgeInsets.only(
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
                                  indexSelects == i
                                      ? Container(
                                          margin: const EdgeInsets.only(
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
              ButtonPayment(
                data: dataPayment[indexSelects],
                amount: widget.amount,
                isContinueOrder: widget.isContinueOrder,
              )
            ],
          ),
        ));
  }
}

class ButtonPayment extends StatelessWidget {
  ButtonPayment({
    Key? key,
    required this.data,
    required this.amount,
    this.isContinueOrder = false,
  }) : super(key: key);

  final Map data;
  final double amount;
  bool isContinueOrder = false;

  final controller = Get.put(PaymentWalletViewModel(appModule.get()));

  @override
  Widget build(BuildContext context) {
    controller.setAmount(amount);

    var bgColor = Colors.black;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 15, color: Colors.grey[300]!, spreadRadius: 8)
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * 1,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: bgColor,
              textStyle: const TextStyle(fontSize: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              side: const BorderSide(
                width: 0.0,
                color: yellowColor,
              ),
            ),
            onPressed: () async {
              var name = data['name'];
              if (name == "Qr PromptPay") {
                //Get.to(QRCodePayment(amount: amount));
                Get.dialog(LoadingFullscreen(
                  backgroundColor: Colors.black45,
                ));

                await controller.getQrPayment();

                navigator?.pop();

                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QrPaymentScreen(
                            qrCode: controller.paymentQr ?? "",
                            isContinueOrder: isContinueOrder,
                          )),
                );

                if (result!=null) {
                  Navigator.of(context).pop(true);
                }

              } else if (name == "Credit / debit") {
                Get.dialog(LoadingFullscreen(
                  backgroundColor: Colors.black45,
                ));

                await controller.getLinkPayment();

                navigator?.pop();

                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentWebView(
                            url: controller.paymentLink ?? "",
                            onFinish: () {
                              Navigator.of(context).pop(true);
                            },
                          )),
                );

                if (result != null) {
                  receivedSuccess(context, () {
                    if (isContinueOrder) {
                      Navigator.of(context).pop(true);
                    } else {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  myWallet()),
                          ModalRoute.withName('/'));
                    }
                  });
                }
              }
            },
            child: const Text(
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
    );
  }
}

class PaymentWalletViewModel extends GetxController {
  Dio dio;

  num? amount;

  PaymentWalletViewModel(this.dio);

  String? paymentLink;
  String? paymentQr;

  void setAmount(num? amount) {
    this.amount = amount;
  }

  Future getQrPayment() async {
    var response = await dio.post('activities/payment/qr-code', data: {
      'amount': amount,
    });
    var data = PaymentQrResponse.fromJson(response.data);
    paymentQr = data.result?.qrPayment ?? "";
    paymentTransactionId = data.result?.paymentTransectionId ?? "";
  }

  Future getLinkPayment() async {
    var response = await dio.post('activities/payment/link', data: {
      'amount': amount,
    });
    var data = PaymentLinkResponse.fromJson(response.data);
    paymentLink = data.result?.redirectUrl ?? "";
    paymentTransactionId = data.result?.paymentTransectionId ?? "";
  }

  void checkPaymentIsSuccess({
    required Function() success,
  }) async {
    var response =
        await dio.get('activities/payment/$paymentTransactionId/status');
    var data = CheckPaymentStatusResponse.fromJson(response.data);
    if (data.result?.status.toString().toLowerCase() == 'success') {
      await dio.post('wallets/top-up', data: {
        'payment_transection_id': paymentTransactionId,
      });

      success.call();
    }
  }
}
