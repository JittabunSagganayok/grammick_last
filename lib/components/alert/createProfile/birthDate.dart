import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:we_link/components/alert/createProfile/calendar.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

Future birthDate(BuildContext context) async{
  
  await showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        constraints: maxHeightContain,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              calendar(),
              Container(
                margin: EdgeInsets.only(left: 40, right: 40, bottom: 37),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 1,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.white,
                            textStyle: TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            side: BorderSide(
                                  width: 0.0,
                                  color: Colors.white,
                                ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50,),
                    Expanded(
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 1,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: blackColor,
                            textStyle: TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
