import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:we_link/components/profile/myWalletComponent/scanPayment.dart';
import 'package:we_link/components/profile/myWalletComponent/topUp.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/views/main_screen.dart';

import '../../di/app_module.dart';
import '../../models/wallet/my_wallet_response.dart';
import '../../models/wallet/wallets_response.dart';

class WalletViewModel extends GetxController {
  Dio dio;

  WalletViewModel(this.dio);

  final _balance = 0.0.obs;
  double get balance => _balance.value;
  String get balanceText => _balance.value.toStringAsFixed(2);

  final  _transactions = [].obs;
  List<dynamic> get transactions => _transactions;

  var transactionDate = DateTime.now().obs;

  void createTransaction(List<Transaction> resultTransactions) {
    _transactions.clear();
    for (var transaction in resultTransactions) {
      _transactions.add({
            "title": transaction.paymentMethod,
            "subtitle": "TID : ${transaction.transactionId}",
            "price": "${transaction.amount} ฿",
            "date": DateFormat('dd/MM/yyyy hh:mm aaa').format(transaction.createdDt.add(const Duration(hours: 7))),
            "image": "assets/images/money.png",
            "status": transaction.type == 'TOP_UP',
          }
      );
    }
  }


  getWallet()  async {
    try {
      dio.post('wallets');
    } finally {
      var responses = await Future.wait([
        dio.get('wallets/balance'),
        dio.get('wallets',queryParameters: {
          "date": transactionDate.value.toIso8601String(),
        }),
      ]);

      var myWalletResponse = MyWalletResponse.fromJson(responses[0].data);
      _balance.value = myWalletResponse.result ?? 0.0;
      debugPrint('balance: $balance');

      var walletsResponse  = WalletsResponse.fromMap(responses[1].data);
      createTransaction(walletsResponse.result.transactions);
    }
  }
}

class myWallet extends StatelessWidget {
  myWallet({Key? key, this.scan,this.currentBalance,}) : super(key: key);
  final String? scan;
  final int? currentBalance;
  final controller = Get.put(WalletViewModel(appModule.get()));

  @override
  Widget build(BuildContext context) {

    controller.getWallet();

    return Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          backgroundColor: blackColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: Container(
            margin: const EdgeInsets.only(left: 5),
            child: IconButton(
              onPressed: () {
                scan == 'scan' ? 
                Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => MainScreen(valueSelectedIndex: 3)),
                )
               :
                Navigator.pop(context);
              },
              icon: Image.asset('assets/images/goBack.png'),
            ),
          ),
          centerTitle: true,
          title: Text(
            'My Wallet',
            style: titleWhiteAppbar,
          ),
        ),
        body: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 150,
                // constraints: maxHeightContain,
                child: Stack(children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            const Text(
                              'Total Balance',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Kanit',
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Obx(() => Text(
                              '${controller.balanceText} ฿',
                              style: const TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Kanit',
                                  color: Color(0xFF373429)),
                            ),)
                          ],
                        ),
                      )),
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ])),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(TopUpScreen());
                    },
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1,
                        margin: const EdgeInsets.only(left: 20, right: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xFFCEFFCD),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 7,
                                  color: Color.fromRGBO(0, 0, 0, 0.13),
                                  spreadRadius: 2)
                            ],
                            border: Border.all(
                              color: const Color(0xFF83D79B),
                              width: 1,
                            )),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 13, right: 10),
                              child: Image.asset(
                                'assets/images/wallet1.png',
                                fit: BoxFit.fill,
                                height: 32,
                                width: 32,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  child: const Text.rich(
                                TextSpan(
                                  text: "Top up",
                                  style: TextStyle(
                                      color: Color(0xFF189B58),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Kanit'),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ),
                            // Spacer(),
                            Container(
                                margin: const EdgeInsets.only(left: 5, right: 22),
                                child: const Icon(Icons.arrow_forward_ios_rounded,
                                    size: 13)),
                          ],
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async{

                      await Permission.camera.request();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScanPaymentScreen()),
                      );
                    },
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1,
                        margin: const EdgeInsets.only(left: 5, right: 20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 7,
                                color: Color.fromRGBO(0, 0, 0, 0.13),
                                spreadRadius: 2)
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 13, right: 10),
                              child: Image.asset(
                                'assets/images/scan.png',
                                fit: BoxFit.fill,
                                height: 32,
                                width: 32,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  child: const Text.rich(
                                TextSpan(
                                  text: "Pay",
                                  style: TextStyle(
                                      color: Color(0xFF323232),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Kanit'),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ),
                            const Spacer(),
                            Container(
                                margin: const EdgeInsets.only(left: 10, right: 22),
                                child: const Icon(Icons.arrow_forward_ios_rounded,
                                    size: 13)),
                          ],
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              constraints: maxHeightContain,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: Column(children: [
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 30,
                        width: 115,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            border: Border.all(
                              color: yellowColor,
                              width: 1,
                            )),
                        child: const Center(
                          child: Text(
                            "Transactions",
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Kanit'),
                          ),
                        )),
                    GestureDetector(
                      onTap: () async {
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: controller.transactionDate.value,
                              firstDate: DateTime(1922, 1),
                              lastDate: DateTime.now());

                          if (picked != null) {
                            controller.transactionDate.value = picked;
                            controller.getWallet();
                          }
                        },
                      child: Container(
                        height: 30,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.symmetric(horizontal:4),
                        decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(
                                color: const Color(0xFFEBEBEB),
                                width: 1,
                              )),
                        child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx((){
                                  var formatDate = DateFormat('dd/MM/yyyy').format(controller.transactionDate.value);
                                  return  Text(
                                    "วันที่ $formatDate",
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: Color(0xFF212B32),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Kant'),
                                  );
                                }),
                                const SizedBox(width: 4,),
                                Image.asset(
                                  'assets/images/Schedule.png',
                                  fit: BoxFit.fill,
                                  color: yellowColor,
                                  height: 13,
                                  width: 12,
                                ),
                              ],
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 21),
                const Divider(
                  color: Color(0xFFF2F2F2),
                  thickness: 1,
                ),
              ]),
            ),
            Expanded(
              child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 21),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Obx(()=> Column(
                        children: [
                          for (var i = 0; i < controller.transactions.length; i++)
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin:
                                      const EdgeInsets.only(left: 13, right: 10),
                                      child: Image.asset(
                                        '${ controller.transactions[i]['image']}',
                                        fit: BoxFit.fill,
                                        // color: yellowColor,
                                        height: 34,
                                        width: 34,
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "${ controller.transactions[i]['title']}",
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: 'Kanit'),
                                                ),
                                                // Spacer(),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.topRight,
                                                    child: Text(
                                                      controller.transactions[i]['status'] as bool
                                                          ? "${ controller.transactions[i]['price']}"
                                                          : "-" +
                                                          "${ controller.transactions[i]['price']}",
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          color:  controller.transactions[i]['status'] as bool
                                                              ? const Color(0xFF41C221)
                                                              : const Color(0xFFFF5B5B),
                                                          fontSize: 13,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontFamily: 'Kanit'),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${ controller.transactions[i]['subtitle']}",
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      color: Color(0xFFAEAEAE),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: 'Kanit'),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.topRight,
                                                    child: Text(
                                                      "${ controller.transactions[i]['date']}",
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                          color: Color(0xFFAEAEAE),
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.w400,
                                                          fontFamily: 'Kanit'),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                                const SizedBox(height: 14),
                                const Divider(
                                  color: Color(0xFFEEEEEE),
                                  thickness: 1,
                                ),
                                const SizedBox(height: 14),
                              ],
                            ),
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ))
          ],
        ));
  }
}
