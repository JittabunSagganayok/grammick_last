import 'package:flutter/material.dart';
import 'package:we_link/components/activity/activityBody.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class schedule extends StatefulWidget {
  @override
  State<schedule> createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
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
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            centerTitle: true,
            title: Text(
              'My Schedule',
              style: titleWhiteAppbar,
            ),
          ),
        ),
        body: activityBody([], 0));
  }
}
