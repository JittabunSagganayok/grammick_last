import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/wallet/payment_response.dart';
import 'package:we_link/models/wallet/receipt_detail_response.dart';

class ReceiptDetailViewModel extends GetxController {
  Dio dio;

  String qrCode = '';

  var loading = false.obs;

  Payment? paymentData;

  ReceiptDetailViewModel(this.dio);

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

class ReceiptDetailScreen extends StatefulWidget {
  String qrCode;
  Payment payment;

  ReceiptDetailScreen(this.qrCode, this.payment);

  @override
  State<ReceiptDetailScreen> createState() => _ReceiptDetailScreenState();
}

class _ReceiptDetailScreenState
    extends AppState<ReceiptDetailScreen, ReceiptDetailViewModel> {
  @override
  ReceiptDetailViewModel initViewModel(ReceiptDetailViewModel viewModel) {
    viewModel.qrCode = widget.qrCode ?? "";
    viewModel.paymentData = widget.payment;
    viewModel.getReceiptDetail();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, ReceiptDetailViewModel viewModel) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            shape: appbarBorder,
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
                    margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: Image.asset(
                              'assets/images/success.png',
                              fit: BoxFit.contain,
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Thank you for transferring money.",
                            style: TextStyle(
                                color: Color(0xFF050505),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Kanit'),
                          ),
                        ),
                        SizedBox(height: 40),
                        Divider(
                          color: Color(0xFFEEEEEE),
                          thickness: 1,
                        ),
                        SizedBox(height: 19),
                        Text(
                          "Transfer to",
                          style: transferText,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 25, top: 19),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                child: Container(
                                  margin: EdgeInsets.only(
                                    right: 10,
                                  ),
                                  child: CircleAvatar(
                                    radius: 26,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(viewModel
                                            .receiptDetailResponse
                                            .value
                                            .result
                                            ?.user
                                            ?.picture ??
                                        ""),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        '${viewModel.receiptDetailResponse.value.result?.user?.name} ${viewModel.receiptDetailResponse.value.result?.user?.lastname}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontFamily: 'Kanit'),
                                      ),
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
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Transaction No.",
                                style: transferText,
                              ),
                            ),
                            Text(
                              viewModel.paymentData?.paymentTransectionId ?? "",
                              style: transferSubText,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Paid date",
                                style: transferText,
                              ),
                            ),
                            Builder(builder: (context) {
                              var date = viewModel.paymentData?.createdDt ?? "";
                              var dateFormat = DateFormat('yyyy/MM/dd HH:mm:ss')
                                  .format(DateTime.parse(date));

                              return Text(
                                dateFormat,
                                style: transferSubText,
                              );
                            }),
                          ],
                        ),
                        SizedBox(height: 30),
                        Divider(
                          color: Color(0xFFEEEEEE),
                          thickness: 1,
                        ),
                        SizedBox(height: 23),
                        Text(
                          "Detail",
                          style: transferText,
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Total",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Kanit'),
                              ),
                            ),
                            Text(
                              "${viewModel.paymentData?.amount ?? "0"} ฿",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Kanit'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ),
              ),
              Container(
                decoration: containerDecoration,
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 1,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: yellowColor,
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
                        Navigator.of(context).pop(true);
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                            color: Color(0xFF363636),
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
}
