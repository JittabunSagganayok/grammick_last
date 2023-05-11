import 'package:flutter/material.dart';
import 'package:we_link/models/introduction/introduction_response.dart';

class slideItems extends StatelessWidget {
  IntroductionList introductionList;

  slideItems(this.introductionList);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 65,
        ),
        Container(
          width: 287,
          height: 238,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(introductionList.picture ?? ""),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: 55,
        ),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Text(
            introductionList.title ?? "",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                fontFamily: 'Kanit',
                color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Text(
            introductionList.description ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                fontFamily: 'Kanit',
                color: Color(0xFFADADAD)),
          ),
        ),
      ],
    );
  }
}
