import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:we_link/feature/base/base_we_state.dart';

import '../../constant/colosrConstants.dart';
import '../../constant/stylesConstants.dart';

class WebContentParams {
  String? title;
  String? textHtml;
  bool? showAcceptButton;

  WebContentParams({
    required this.title,
    required this.textHtml,
    this.showAcceptButton = false,
  });
}

class WebContentScreen extends StatefulWidget {
  @override
  _WebContentScreenState createState() => _WebContentScreenState();
}

class _WebContentScreenState
    extends AppState<WebContentScreen, WebContentViewModel> {
  @override
  WebContentViewModel initViewModel(WebContentViewModel viewModel) {
    viewModel.setArgument(Get.arguments as WebContentParams);
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, WebContentViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/images/goBack1.png'),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                viewModel.title.value,
                style: titleHowUse,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Html(
                data: viewModel.html.value,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Obx((){
        if (viewModel.showAcceptButton.isFalse) {
          return SizedBox(height: 0,);
        }
        return SafeArea(
          child: SizedBox(
            height: 80,
            child: Container(
              height: 56,
              padding: EdgeInsets.all(16),
              width: Get.width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: yellowColor,
                  textStyle: TextStyle(fontSize: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  side: BorderSide(
                    width: 0.0,
                    color: yellowColor,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context,true);
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      color: Color(0xFF363636),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit'),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class WebContentViewModel extends GetxController {
  var title = ''.obs;
  var html = ''.obs;
  var showAcceptButton = false.obs;

  WebContentViewModel();

  void setArgument(WebContentParams arguments) {
    title.value = arguments.title ?? "";
    html.value = arguments.textHtml ?? "";
    showAcceptButton.value = arguments.showAcceptButton == true;
  }
}
