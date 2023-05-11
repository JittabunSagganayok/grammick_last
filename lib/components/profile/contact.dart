import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState
    extends AppState<ContactUsScreen, ContactUsViewModel> {
  TextEditingController textController = TextEditingController();

  @override
  ContactUsViewModel initViewModel(ContactUsViewModel viewModel) {
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, ContactUsViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          backgroundColor: blackColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          shape: appbarBorder,
          leading: Container(
            margin: EdgeInsets.only(left: 5),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset('assets/images/goBack.png'),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Contact Us',
            style: titleWhiteAppbar,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(left: 36, right: 36),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 33, bottom: 14),
              alignment: Alignment.topLeft,
              child: Text(
                "Add Detail Report to Contact Support",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Kanit'),
              ),
            ),
            Container(
              child: TextFormField(
                controller: textController,
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(
                  counterText: '',
                  // hintText: 'Message..',
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Kanit'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Color(0xFFBBBBBB))),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Color(0xFFBBBBBB)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 1,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: yellowColor,
                  textStyle: TextStyle(fontSize: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  side: BorderSide(
                    width: 0.0,
                    color: yellowColor,
                  ),
                ),
                onPressed: () async {
                  await viewModel.sendFeedback(
                    textController.text.toString(),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                      color: Color(0xFF363636),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit'),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ContactUsViewModel extends GetxController {
  Dio dio;

  ContactUsViewModel(this.dio);

  Future sendFeedback(
    String message,
  ) async {
    await dio.post('contact-us', data: {
      "message": message,
    });
  }
}
