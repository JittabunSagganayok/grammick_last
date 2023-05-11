import 'package:flutter/material.dart';

import '../../constant/colosrConstants.dart';

class AppButtonBar extends StatelessWidget {
  String title;
  String? icon;
  Function onClicked;
  Color? textColor, backgroundColor;

  Widget? leadingWidget;
  bool expanded = false;

  AppButtonBar({
    required this.title,
    required this.onClicked,
    this.icon,
    this.textColor = const Color(0xFF363636),
    this.backgroundColor = yellowColor,
  });

  AppButtonBar.withLeftIcon(
      {required this.title,
      required this.onClicked,
      required this.leadingWidget,
      this.icon,
      this.textColor = const Color(0xFF363636),
      this.backgroundColor = yellowColor,
      this.expanded = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 15, color: Colors.grey[300]!, spreadRadius: 8)
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            children: [
              expanded ? Expanded(
                  child: leadingWidget ??
                      SizedBox(
                        width: 0,
                      ))
                  : leadingWidget ??
                  SizedBox(
                    width: 0,
                  ),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: backgroundColor ?? yellowColor,
                      textStyle: TextStyle(fontSize: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      side: BorderSide(
                        width: 0.0,
                        color: yellowColor,
                      ),
                    ),
                    onPressed: () {
                      onClicked();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null) ...[
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Image.asset(
                              'assets/images/phone1.png',
                              fit: BoxFit.fill,
                              color: Color(0xFF363636),
                              height: 13,
                              width: 13,
                            ),
                          ),
                        ],
                        Text(
                          title,
                          style: TextStyle(
                              color: textColor ?? Color(0xFF363636),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
