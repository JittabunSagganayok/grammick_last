import 'package:flutter/material.dart';
import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:we_link/marketplace/pages/marketplace.dart';
import 'package:we_link/marketplace/widgets/header.dart';

class ConditionScreen extends StatefulWidget {
  ConditionScreen({super.key, required this.title});

  String title;

  @override
  State<ConditionScreen> createState() => _ConditionScreenState();
}

class _ConditionScreenState extends State<ConditionScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double fontfem = fem * 0.85;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Headernoicon(fem: fem, ffem: ffem, title: widget.title),
                Container(
                  padding:
                      EdgeInsets.fromLTRB(18 * fem, 10 * fem, 3 * fem, 0 * fem),
                  width: 375 * fem,
                  height: 732 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            // welinkmarketplaceBup (84:38)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 5 * fem),
                            child: Text(
                              'เงื่อนไขการเข้าใช้งาน Welink Market place',
                              style: SafeGoogleFont(
                                'Kanit',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.3125 * ffem / fem,
                                letterSpacing: 0.16 * fem,
                                color: Color(0xff010d29),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // loremipsumissimplydummytextoft (84:37)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 13 * fem, 0 * fem),
                        constraints: BoxConstraints(
                          maxWidth: 335 * fem,
                        ),
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          style: SafeGoogleFont(
                            'Kanit',
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            height: 1.7692307692 * ffem / fem,
                            letterSpacing: 0.13 * fem,
                            color: Color(0xff393939),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 732 * fem,
                  padding: EdgeInsets.fromLTRB(21 * fem, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Modular.to.pushReplacementNamed('/home');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MarketHomeScreen()),
                          );
                        },
                        child: Container(
                          width: 333 * fem,
                          height: 43 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff191919),
                            borderRadius: BorderRadius.circular(25 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Accept',
                              textAlign: TextAlign.right,
                              style: SafeGoogleFont(
                                'Kanit',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.495 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
