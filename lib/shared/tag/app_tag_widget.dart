import 'package:flutter/material.dart';
import 'package:we_link/shared/text/app_text_border.dart';

class AppTagWidget extends StatelessWidget {
  AppTagItem item;

  AppTagWidget({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextBorder(
      title: item.title,
      borderColor: item.checked ? Color(0xffFF881A) : Color(0xffFBFBFB),
      backgroundColor: item.checked ? Color(0xffFF881A) : Color(0xffFBFBFB),
      fontColor: item.checked ? Colors.white : Color(0xff999999),
    );
  }
}

class AppTagItem {
  String title;
  bool checked;
  int id;

  AppTagItem(this.title, this.checked, this.id);
}
