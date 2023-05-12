import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/home/weLinkToGo.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/we_service/route/we_service_route.dart';

import '../../../feature/assistant/ui/we_assistant_screen.dart';
import '../../../marketplace/pages/Condition.dart';

class HomeMenuSection extends StatelessWidget {
  const HomeMenuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WeLinkToGoScreen(valueSelectedIndex: 0)),
                );
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/menu1.png',
                      fit: BoxFit.contain,
                      height: 45,
                      width: 45,
                    ),
                  ),
                  Text(
                    'WeRide',
                    style: menuTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.to(WeAssistantScreen());
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/menu2.png',
                      fit: BoxFit.contain,
                      height: 45,
                      width: 45,
                    ),
                  ),
                  Text(
                    'WeAssistant',
                    style: menuTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WeLinkToGoScreen(
                            currentTabSelected: 2,
                          )),
                );
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/menu3.png',
                      fit: BoxFit.contain,
                      height: 45,
                      width: 45,
                    ),
                  ),
                  Text(
                    'WeRent',
                    style: menuTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/menu5.png',
                      fit: BoxFit.contain,
                      height: 45,
                      width: 45,
                    ),
                  ),
                  Text(
                    'WeService',
                    style: menuTextStyle,
                  ),
                ],
              ),
              onTap: () {
                navigator?.pushNamed(WeServiceRoute.weServiceScreen);
              },
            ),
          ),
          Expanded(
            child: InkWell(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/menu6.png',
                      fit: BoxFit.contain,
                      height: 45,
                      width: 45,
                    ),
                  ),
                  Text(
                    'MarketPlace',
                    style: menuTextStyle, 
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConditionScreen(
                            title: 'Condition',
                          )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
