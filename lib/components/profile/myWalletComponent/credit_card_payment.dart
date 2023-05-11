import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/colosrConstants.dart';
import '../../../constant/stylesConstants.dart';



class CreditCardPayment extends StatelessWidget {
  final double amount;
  const CreditCardPayment({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'Credit / debit',
            style: titleWhiteAppbar,
          ),
        ),
      ),
      body: const Center(child: Text('Credit / debit')),
    );
  }
}