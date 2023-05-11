import 'package:flutter/material.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

Future planToGo(BuildContext context) async {
  var controller = TextEditingController();

  return await showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          // margin: EdgeInsets.all(20),
          constraints: maxHeightContain,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 24, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/images/map1.png',
                          fit: BoxFit.fill,
                          height: 22,
                          width: 22,
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(top: 10),
                        child: Text('Which place you plan to go to ?',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 21),
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller,
                      maxLines: 5,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Which place you plan to go to ?',
                        fillColor: Color(0xFFEEEEEE),
                        filled: true,
                        hintStyle: TextStyle(
                            color: Color(0xFF8A8A8A),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'Kanit'),
                        enabledBorder: searchBoder,
                        focusedBorder: searchBoder,
                      ),
                    ),
                  ),
                  SizedBox(height: 21),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 1,
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
                        Navigator.pop(context,controller.text,);
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
                  SizedBox(height: 21),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
