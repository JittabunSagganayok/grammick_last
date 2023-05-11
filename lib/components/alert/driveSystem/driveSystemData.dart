import 'package:flutter/material.dart';

class driveSystemData extends StatefulWidget {
  Function(String) driveSystem;

  driveSystemData(this.driveSystem);

  @override
  State<driveSystemData> createState() => _driveSystemDataState();
}

class _driveSystemDataState extends State<driveSystemData> {
  final _controller = ScrollController();
  var _driveSystem = [
    {'title': 'Auto'},
    {'title': 'Manual'},
  ];

  var indexSelect = 0;

  clickSelects(int index) async {
    setState(() {
      indexSelect = index;
      widget.driveSystem?.call(_driveSystem[index].values.first);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _controller,
        itemCount: _driveSystem.length,
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
                  child: Text('${_driveSystem[i]['title']}',
                      style: const TextStyle(
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
