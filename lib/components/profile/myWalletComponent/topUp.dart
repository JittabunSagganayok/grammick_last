import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/button/buttonBackground.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class TopUpController extends GetxController {
  final _amount = 0.0.obs;

  double get amount => _amount.value;

  set amount(double value) {
    amountTextEdit.text = value.toStringAsFixed(2);
    _amount.value = value;
  }

  final _validAmount = true.obs;

  get isValidAmount => _validAmount.value;

  set amountText(String text) {
    var value = double.tryParse(text) ?? 0;
    _validAmount.value = value > 0;
    _amount.value = value;
  }

  final amountTextEdit = TextEditingController();

  get topUpData => {'amount': _amount.value};
}

class TopUpScreen extends StatefulWidget {
  bool isContinueOrder = false;

  TopUpScreen({
    this.isContinueOrder = false,
  });

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
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

  final controller = Get.put(TopUpController());

  @override
  void initState() {
    controller.amount =
        double.tryParse(checkSelects[0]['price'] ?? '100') ?? 100.0;
    super.initState();
  }

  void clickSelects(i) {
    setState(() {
      indexCoins = i;
    });

    controller.amount = double.tryParse(checkSelects[i]['price'] ?? '0') ?? 0.0;

    print(indexCoins);
    print(i);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          // backgroundColor: Colors.white,
          backgroundColor: appBackgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              backgroundColor: blackColor,
              automaticallyImplyLeading: false,
              elevation: 0,
              shape: appbarBorder,
              leading: Container(
                margin: const EdgeInsets.only(left: 5),
                child: IconButton(
                  onPressed: () {
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
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  height: 17,
                  width: MediaQuery.of(context).size.width * 1,
                  color: appBackgroundColor,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    child: SingleChildScrollView(
                        child: Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Choose Top up',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Kanit',
                                color: Color(0xFF132150)),
                          ),
                          const SizedBox(
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
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 7,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.13),
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
                            ],
                          ),
                          const SizedBox(height: 30),
                          const Divider(
                            color: Color(0xFFEEEEEE),
                            thickness: 1,
                          ),
                          const SizedBox(height: 21),
                          const Text(
                            "Amount",
                            style: TextStyle(
                                color: Color(0xFF132150),
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Kanit'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
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
                                  margin: const EdgeInsets.only(left: 23),
                                  child: const Text(
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
                                    margin: const EdgeInsets.only(right: 23),
                                    child: TextField(
                                      onChanged: (value) {
                                        controller.amountText = value;
                                      },
                                      controller: controller.amountTextEdit,
                                      textAlign: TextAlign.right,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                        signed: true,
                                        decimal: true,
                                      ),
                                      style: fieldTopUpText,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        //hintText: '100.0',
                                        hintStyle: fieldTopUpText,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
                Obx(() => buttonBackground(
                      data: controller.topUpData,
                      enable: controller.isValidAmount,
                      isContinueOrder: widget.isContinueOrder,
                    ))
              ],
            ),
          )),
    );
  }
}
