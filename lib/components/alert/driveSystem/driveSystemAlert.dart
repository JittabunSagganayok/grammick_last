import 'package:flutter/material.dart';
import 'package:we_link/components/alert/driveSystem/driveSystemData.dart';

void driveSystemAlert(
  BuildContext context,
  Function(String) driveSystem,
) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 225,
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
              child: driveSystemData(driveSystem),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                alignment: Alignment.center,
                child: Text('Cancel',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFD52E2F),
                        fontFamily: 'Kanit')),
              ),
            ),
          ],
        ),
      );
    },
  );
}
