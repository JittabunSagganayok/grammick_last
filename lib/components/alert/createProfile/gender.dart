import 'package:flutter/material.dart';
import 'package:we_link/components/alert/createProfile/genderData.dart';

Future gender(BuildContext context) async{
  await showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 250,
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
              child: genderData(),
            ),
          ],
        ),
      );
    },
  );
}
