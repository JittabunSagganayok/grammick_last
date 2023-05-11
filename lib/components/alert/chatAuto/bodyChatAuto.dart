import 'package:flutter/material.dart';

class bodyChatAuto extends StatefulWidget {
  Function(String) onSelectAutoMessage;

  bodyChatAuto(this.onSelectAutoMessage);

  @override
  State<bodyChatAuto> createState() => _bodyChatAutoState(onSelectAutoMessage);
}

class _bodyChatAutoState extends State<bodyChatAuto> {
  Function(String) onSelectAutoMessage;
  var indexSelects = 0;
  var datalist = [
    {"title": "OK,Sir"},
    {"title": "Hello, I’m Driver for you"},
    {"title": "I’m arrived"},
    {"title": "Sorry, The traffic jam"},
    {"title": "My Car is Blue / sf9827"},
  ];

  _bodyChatAutoState(this.onSelectAutoMessage);

   void clickSelects(i) {
    setState(() {
      indexSelects = i;
      onSelectAutoMessage?.call(datalist[i]['title'].toString());
      Navigator.of(context).pop();
    });

    print(indexSelects);
    print(i);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18, bottom: 45, right: 70),
      width: MediaQuery.of(context).size.width * 1,
      padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i != datalist.length; i++) 
            GestureDetector(
              onTap: () => clickSelects(i),
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 13, 15, 13),
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: indexSelects == i ? Color(0xFFF8F8F8) : Colors.white,
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(7),
                  // )
                ),
                child: Text(
                  '${datalist[i]['title']}',
                  style: TextStyle(
                      color: Color(0xFF040404),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
