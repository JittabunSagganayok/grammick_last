import 'package:flutter/material.dart';
import 'package:we_link/components/alert/chatAuto/bodyChatAuto.dart';
import 'package:we_link/constant/stylesConstants.dart';

void chatAutoAlert(
  BuildContext context,
  Function(String) onSelectAutoMessage,
) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        constraints: maxHeightContain,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        child: Container(
            margin: EdgeInsets.fromLTRB(20, 15, 20, 40), child: bodyChatAuto(onSelectAutoMessage)),
      );
    },
  );
}
