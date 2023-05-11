import 'dart:async';

import 'package:flutter/material.dart';
import 'package:we_link/components/home/weAssistantComponents/driverToGo/driverToGo.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/carPending.dart';
import 'package:we_link/constant/colosrConstants.dart';

class callWeLink extends StatefulWidget {
  callWeLink({Key? key, this.OrderDetail}) : super(key: key);
  final String? OrderDetail;

  @override
  State<callWeLink> createState() => _callWeLinkState();
}

class _callWeLinkState extends State<callWeLink> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => driverToGo(OrderDetail: widget.OrderDetail)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                      child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      children: [
                        Center(
                            child: Image.network(
                          'https://media.giphy.com/media/17mNCcKU1mJlrbXodo/giphy.gif',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        )),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            'Search car. Please wait...',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Kanit'),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFFEC2829),
                        child: Icon(
                          Icons.clear_rounded,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Kanit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
