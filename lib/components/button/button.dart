import 'package:flutter/material.dart';
import 'package:we_link/components/alert/addAddressSuccess.dart';
import 'package:we_link/constant/colosrConstants.dart';

class button extends StatefulWidget {
  button({Key? key}) : super(key: key);

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
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
          onPressed: () => addAddressSuccess(context),
          child: Text(
            'Confirm',
            style: TextStyle(
                color: Color(0xFF363636),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Kanit'),
          ),
        ),
      ),
    );
  }
}
