import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/components/profile/myWallet.dart';
import 'package:we_link/components/profile/myWalletComponent/receipt.dart';
import 'package:we_link/components/profile/myWalletComponent/topUp.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/wallet/payment_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../../models/error/error_response.dart';
import '../../../models/wallet/receipt_detail_response.dart';

class TransferScreen extends StatefulWidget {
  String? qrCode = '';
  String? totalAmount = '';

  TransferScreen({
    this.qrCode,
    this.totalAmount,
  });

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends AppState<TransferScreen, TransferViewModel> {
  TextEditingController inputAmountTextController = TextEditingController();

  var indexCoins = 0;
  var checkSelects = [
    {
      "price": "100",
    },
    {
      "price": "200",
    },
    {
      "price": "300",
    },
    {
      "price": "500",
    },
  ];

  void clickSelects(index) {
    setState(() {
      indexCoins = index;
      viewModel.amount = checkSelects[index]['price'].toString();
      inputAmountTextController.text = viewModel.amount;
    });
  }

  @override
  TransferViewModel initViewModel(TransferViewModel viewModel) {
    viewModel.qrCode = widget.qrCode ?? "";

    if (widget.totalAmount?.isNotEmpty == true) {
      viewModel.amount = widget.totalAmount ?? "";
      inputAmountTextController.text = widget.totalAmount ?? "";
    }

    viewModel.getReceiptDetail();

    viewModel.paymentError.listen((message) async{
      if (message.isNotEmpty) {
        await Get.defaultDialog(
          title: 'Error',
          content: Text(
            message,
            textAlign: TextAlign.center,
          ),
        );

        if (message == 'Insufficient balance') {
         await Get.to(TopUpScreen(isContinueOrder: true,));
        }
      }
    });

    viewModel.paymentSuccess.listen((success) async {
      if (success) {
        var result = await Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(
              builder: (context) => ReceiptDetailScreen(
                    viewModel.qrCode,
                    viewModel.paymentData.value,
                  )),
        );

        if (result != null) {
          Navigator.of(Get.context!).pop(true);
        }
      }
    });

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, TransferViewModel viewModel) {
    return Obx(() {
      if (viewModel.loading.value == true) {
        return LoadingFullscreen();
      } else {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: AppBar(
                backgroundColor: blackColor,
                automaticallyImplyLeading: false,
                elevation: 0,
                shape: appbarBorder,
                leading: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => myWallet(scan: 'scan')),
                      );
                      // Navigator.pop(context);
                    },
                    icon: Image.asset('assets/images/goBack.png'),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  'Transfer',
                  style: titleWhiteAppbar,
                ),
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                          child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 20, top: 25),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 15),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: 10,
                                      ),
                                      child: Obx(() => CircleAvatar(
                                            radius: 26,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: NetworkImage(
                                                viewModel
                                                        .receiptDetailResponse
                                                        .value
                                                        ?.result
                                                        ?.user
                                                        ?.picture ??
                                                    ""),
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Builder(builder: (context) {
                                            var user = viewModel.receiptDetailResponse.value.result?.user;
                                            var name = user?.name ?? "";
                                            var lastname = user?.lastname ?? "";
                                            return Text(
                                              '$name $lastname',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontFamily: 'Kanit'),
                                            );
                                          }),
                                        ),
                                        Container(
                                          child: Text(
                                            'Recipient',
                                            style: TextStyle(
                                                color: Color(0xFF555555),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Kanit'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Image.asset(
                                      'assets/images/transfer.png',
                                      fit: BoxFit.contain,
                                      height: 20,
                                      width: 24,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xFFEEEEEE),
                              thickness: 1,
                            ),
                            SizedBox(height: 21),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: Color(0xFF132150),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Kanit'),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              width: MediaQuery.of(context).size.width * 1,
                              height: 56,
                              decoration: BoxDecoration(
                                color: appBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(left: 23),
                                    child: Text(
                                      "฿",
                                      style: TextStyle(
                                          color: Color(0xFFFF5906),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Kanit'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 23),
                                      child: TextField(
                                        textAlign: TextAlign.right,
                                        controller: inputAmountTextController,
                                        readOnly: widget.totalAmount?.isNotEmpty == true,
                                        onChanged: (text) {
                                          viewModel.amount = text;
                                        },
                                        keyboardType: TextInputType.number,
                                        style: fieldTopUpText,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '0.',
                                          hintStyle: fieldTopUpText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (widget.totalAmount?.isNotEmpty == true) {
                                  return SizedBox(height: 0,);
                                }
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        for (var i = 0; i != checkSelects.length; i++)
                                          GestureDetector(
                                            onTap: () => clickSelects(i),
                                            child: Container(
                                              height: 35,
                                              width: 74,
                                              decoration: BoxDecoration(
                                                  color: indexCoins == i
                                                      ? yellowColor
                                                      : Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 7,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.13),
                                                        spreadRadius: 2)
                                                  ],
                                                  border: Border.all(
                                                    color: indexCoins == i
                                                        ? yellowColor
                                                        : Colors.white,
                                                    width: 1,
                                                  )),
                                              child: Center(
                                                child: Text(
                                                  '${checkSelects[i]['price']}',
                                                  style: TextStyle(
                                                      color: indexCoins == i
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'Kanit'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        SizedBox(height: 30),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            color: Colors.white,
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
                            if (viewModel.amount.isNotEmpty == true) {
                              viewModel.payment();
                            } else {
                              Get.defaultDialog(
                                title: 'ขออภัย',
                                content: Text(
                                  'คุณยังไม่ไดใส่ยอดเงิน',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
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
                  )
                ],
              ),
            ));
      }
    });
  }
}

class TransferViewModel extends GetxController {
  Dio dio;

  TransferViewModel(this.dio);

  String qrCode = '';
  String amount = '';

  var paymentSuccess = false.obs;
  var paymentError = ''.obs;
  var paymentData = Payment().obs;

  Future payment() async {
    paymentSuccess.value = false;
    paymentError.value = '';

    try {
      var response = await dio.post('wallets/pay', data: {
        'amount': num.tryParse(amount.replaceAll(',', '0')) ?? 0,
        'code': qrCode
      });

      var data = PaymentResponse.fromJson(response.data);
      paymentData.value = data.result!;

      paymentSuccess.value = true;
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      paymentError.value = errorResponse.message ?? "";
    }
  }

  var loading = false.obs;
  var receiptDetailResponse = ReceiptDetailResponse().obs;

  Future getReceiptDetail() async {
    loading.value = true;
    var response = await dio.get('wallets/recipient', queryParameters: {
      'code': qrCode,
    });

    receiptDetailResponse.value = ReceiptDetailResponse.fromJson(response.data);
    loading.value = false;
  }
}
