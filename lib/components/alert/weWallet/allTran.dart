import 'package:flutter/material.dart';
import 'allTranData.dart';

void allTran(BuildContext context) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45),
          ),
        ),
        child: Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 1,
              ),
              Expanded(
                child: allTranData(),
              ),
            ],
          ),
      );
    },
  );
}
