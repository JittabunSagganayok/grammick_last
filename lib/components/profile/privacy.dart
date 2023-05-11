import 'package:flutter/material.dart';
import 'package:we_link/constant/stylesConstants.dart';

class privacy extends StatelessWidget {
  const privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Privacy Policy',
                style: titleHowUse,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'Donec sagittis',
                style: howuseText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit nunc non ultrices feugiat. Venenatis amet facilisis vestibulum lorem. Donec sagittis, a orci eu fermentum eu dictum eget. Facilisis pellentesque.',
                style: subtitleHowUse,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'Venenatis amet',
                style: howuseText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                'Venenatis amet facilisis vestibulum lorem. Donec sagittis, a orci eu fermentum eu dictum eget. Facilisis pellentesque.',
                style: subtitleHowUse,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'Est ipsum cras.',
                style: howuseText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Urna sagittis, tellus elementum, amet auctor urna. Dignissim mauris ut nisi, lorem pulvinar sed ultrices consectetur massa. ',
                style: subtitleHowUse,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 10),
              child: Text.rich(TextSpan(
                  text:
                      "- Tincidunt aliquet integer egestas porta volutpat lobortis. \n",
                  style: subtitleHowUse,
                  children: [
                    TextSpan(
                      text:
                          "- Orci nisl, sed sed porttitor quis sodales. Id amet, venenatis eu adipiscing eu pellentesque volutpat blandit posuere. \n",
                      style: subtitleHowUse,
                    ),
                    TextSpan(
                      text:
                          "- Mi amet dictum interdum massa id laoreet. Pharetra.",
                      style: subtitleHowUse,
                    )
                  ])),
            ),
          ],
        ),
      )),
    );
  }
}
