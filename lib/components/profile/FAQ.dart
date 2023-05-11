import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/profile/FAQ/howUse.dart';
import 'package:we_link/components/profile/contact.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/models/other/app_faq_response.dart';
import 'package:we_link/views/content/web_content_screen.dart';

class FAQScreen extends StatelessWidget {
  List<Faq> faq = [];

  FAQScreen(this.faq);

  @override
  Widget build(BuildContext context) {
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
            'FAQ',
            style: titleWhiteAppbar,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 34,
                ),
                for (var index = 0; index < faq.length; index++)
                  GestureDetector(
                    onTap: () {
                      final item = faq[index];
                      Get.to(WebContentScreen(),arguments: WebContentParams(title: item.title, textHtml: item.description));
                    },
                    child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 1,
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: menuProfileDecoration,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Text.rich(
                                      TextSpan(
                                          text: faq[index].title ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Kanit')),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    Container(
                                        child: Text.rich(
                                      TextSpan(
                                          text: faq[index].description ?? "",
                                          style: TextStyle(
                                              color: Color(0xFF747474),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Kanit')),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 12),
                              child: Image.asset(
                                'assets/images/next.png',
                                fit: BoxFit.fill,
                                height: 22,
                                width: 22,
                              ),
                            ),
                          ],
                        )),
                  ),
              ],
            )),
      ),
    );
  }
}
