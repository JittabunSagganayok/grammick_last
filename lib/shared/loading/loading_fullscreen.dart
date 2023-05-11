import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colosrConstants.dart';

class LoadingFullscreen extends StatelessWidget {
  Color? backgroundColor;

  LoadingFullscreen({
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      body: Builder(builder: (context) {
        return SizedBox(
            width: Get.width,
            height: Get.height,
            child: const Center(
              child: CircularProgressIndicator(
                color: yellowColor,
              ),
            ));
      }),
    );
  }
}
