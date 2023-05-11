import 'package:flutter/material.dart';

class genderData extends StatefulWidget {
  genderData({Key? key}) : super(key: key);

  @override
  State<genderData> createState() => _genderDataState();
}

class _genderDataState extends State<genderData> {
  final _controller = ScrollController();
  var _genderData = [
    {'title': '	Male'},
    {'title': 'Female'},
    {'title': 'Other'},
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
        itemCount: _genderData.length,
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
                  child: Text('${_genderData[i]['title']}',
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
