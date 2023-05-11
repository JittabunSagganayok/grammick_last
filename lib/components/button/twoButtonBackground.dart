import 'package:flutter/material.dart';
import 'package:we_link/components/signin/addAddress.dart';
import 'package:we_link/components/signin/map.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';

class twoButtonBackground extends StatelessWidget {
  const twoButtonBackground({Key? key, this.searchAddress}) : super(key: key);
  final String? searchAddress;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 15, color: Colors.grey[300]!, spreadRadius: 8)
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 1,
                child: OutlinedButton(
                  style: currentLoButton,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddNewAddressScreen(keyword: searchAddress)),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/Current.png',
                          fit: BoxFit.fill,
                          height: 15,
                          width: 12,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Current location',
                          style: currentLoText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 1,
                child: OutlinedButton(
                  style: chooseMapButton,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseLocationByMapScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5, right: 10),
                        child: Image.asset(
                          'assets/images/map.png',
                          fit: BoxFit.fill,
                          height: 15,
                          width: 18,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Choose Maps',
                          style: chooseMapText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
