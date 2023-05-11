import 'package:flutter/material.dart';
import 'package:we_link/components/profile/myWalletComponent/paymentWallet.dart';
import 'package:we_link/constant/colosrConstants.dart';

class buttonBackground extends StatelessWidget {
  buttonBackground({
    this.data,
    this.enable = true,
    this.isContinueOrder = false,
  });

  final Map? data;
  final bool enable;
  bool isContinueOrder = false;

  @override
  Widget build(BuildContext context) {
    var bgColor = enable ? yellowColor : Colors.grey;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 15, color: Colors.white, spreadRadius: 8)
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
            onPressed: () async{
              var result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentWallet(
                          amount: data?['amount'] ?? 0.0,
                          isContinueOrder: isContinueOrder,
                        )),
              );

              if (result!=null) {
                Navigator.of(context).pop(true);
              }

            },
            child: const Text(
              'Confirm',
              style: TextStyle(
                  color: Color(0xFF363636),
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
