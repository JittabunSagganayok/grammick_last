import 'package:flutter/material.dart';

class allTranData extends StatefulWidget {
  allTranData({Key? key}) : super(key: key);

  @override
  State<allTranData> createState() => _allTranDataState();
}

class _allTranDataState extends State<allTranData> {
   final _controller = ScrollController();
  var _allTranData = [
    {'title': 'All Transaction'},
    {'title': 'Top up'},
    {'title': 'Withdraw'},
    {'title': 'Received'},
  ];

  var indexSelect = 0;

  clickSelects(index) async {
    setState(() {
      indexSelect = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _controller,
        itemCount: _allTranData.length,
        itemBuilder: (context, i) {
          return Column(children: [
            GestureDetector(
              onTap: () => clickSelects(i),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 1,
                color: indexSelect == i ? Color(0xFFF8F8F8) : Colors.white,
                child: Container(
                  alignment: Alignment.center,
                  child: Text('${_allTranData[i]['title']}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF333333),
                          fontFamily: 'Kanit')),
                ),
              ),
            ),
          ]);
        });
  }
}
