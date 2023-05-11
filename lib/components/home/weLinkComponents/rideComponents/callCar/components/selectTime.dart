import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:we_link/constant/stylesConstants.dart';

class SelectTimeWidget extends StatefulWidget {
  Function(DateTime?)? chooseDateTime;

  SelectTimeWidget({
    this.chooseDateTime,
  });

  @override
  State<SelectTimeWidget> createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  var select = 1;

  DateTime? currentDateTime = DateTime.now();
  DateTime? selectDateTime;

  void changeStatus(BuildContext context) {
    showModalBottomSheet<void>(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          constraints: maxHeightContain,
          decoration: selectTimeDecoration,
          padding: EdgeInsets.only(bottom: 35, top: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0, bottom: 10),
                        child: SizedBox(
                          height: 250,
                          child: CupertinoDatePicker(
                              initialDateTime: currentDateTime,
                              minimumDate: currentDateTime,
                              onDateTimeChanged: (val) {
                                setState(() {
                                  selectDateTime = val;
                                });
                              }),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            child: Text('Schedule', style: selectTimeTitle),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17, right: 17),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            widget?.chooseDateTime?.call(null);
                          },
                          child: Container(
                            height: 47,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: selectNow,
                            child: Center(
                              child: Text(
                                'Now',
                                style: selectTimeText,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            widget.chooseDateTime?.call(selectDateTime);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 47,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: slectSchedule,
                            child: Center(
                              child: Text(
                                'Schedule',
                                style: selectTimeText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 24,
            width: 56,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: select == 1 ? Color(0xFF3CCC53) : Colors.white,
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide(
                  width: 0.0,
                  color: select == 1 ? Color(0xFF3CCC53) : Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  select = 1;
                  selectDateTime = null;
                });
              },
              child: Text(
                'Now',
                style: TextStyle(
                    color: select == 1 ? Colors.white : Color(0xFF9C8110),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit'),
              ),
            ),
          ),
          Container(
            height: 24,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: select == 2 ? Color(0xFF3CCC53) : Colors.white,
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide(
                  width: 0.0,
                  color: select == 2 ? Color(0xFF3CCC53) : Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  select = 2;
                  changeStatus(context);
                });
              },
              child: Text(
                select == 1 && selectDateTime == null
                    ? 'Later'
                    : selectDateTime != null
                        ? DateFormat('dd/MM/yyyy HH:mm').format(selectDateTime!)
                        : 'Later',
                style: TextStyle(
                    color: select == 2 ? Colors.white : Color(0xFF9C8110),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
