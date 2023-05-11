import 'package:flutter/material.dart';
import 'package:we_link/components/home/searchAddress.dart';
import 'package:we_link/constant/stylesConstants.dart';

void deletePlaceAlert(BuildContext context) {
  showDialog<Widget>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: Container(
          margin: EdgeInsets.all(50),
          constraints: maxHeightContain,
          decoration: alertBoxDecoration,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Delete Place ?',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF2F2F2F),
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 13,
                    ),
                    child: Text(
                      'Are you sure you want to delete?',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7E7E7E),
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      'your current address',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7E7E7E),
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SelectAddressScreen()),
                          ModalRoute.withName('/'));
                    },
                    child: Container(
                      height: 48,
                      width: 197,
                      margin: EdgeInsets.only(top: 20, bottom: 15),
                      decoration: BoxDecoration(
                          color: Color(0xFF40C255),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          border: Border.all(
                            color: Color(0xFFEFEFEF),
                            width: 0,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(253, 184, 36, 0.24),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 4),
                            )
                          ]),
                      child: Center(
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit'),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 48,
                      width: 197,
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                          border: Border.all(
                            color: Color(0xFFF1F1F1),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(202, 202, 202, 0.33),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 4),
                            )
                          ]),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Color(0xFF363636),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      });
}

Future displayConfirmationToCancelOrder(BuildContext context) async{
  return await showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          constraints: maxHeightContain,
          decoration: requestDriverDecoration,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 24, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('Are you sure you want to cancel?',
                        style: priceTotalText?.copyWith(
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    height: 16,
                    color: Color(0xffE6E6E6),
                    indent: 16,
                    endIndent: 16,
                  ),
                  Text('Conditions',
                      style: TextStyle(
                          color: Color(0xff9E9E9E),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Kanit')),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum Lorem Ipsum is simply dummy text ',
                      style: TextStyle(
                          color: Color(0xff545454),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Kanit')),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Text('30฿',
                        style: priceTotalText?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Color(0xffFF855E))),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 1,
                    child: OutlinedButton(
                      style: yellowButtonStyle,
                      onPressed: () {
                        Navigator.pop(context,true);
                      },
                      child: Text(
                        'Confirm',
                        style: selectsCarTextButton,
                      ),
                    ),
                  ),
                  SizedBox(height: 21),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
