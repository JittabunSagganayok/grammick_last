import 'package:flutter/material.dart';
import 'package:we_link/constant/stylesConstants.dart';

class term extends StatelessWidget {
  const term({Key? key}) : super(key: key);

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
              margin: EdgeInsets.only(top: 15),
              child: Text(
                'Term & Condition',
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
                'Sasgittis',
                style: howuseText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                style: subtitleHowUse,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
