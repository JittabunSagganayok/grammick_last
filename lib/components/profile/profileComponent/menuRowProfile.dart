import 'package:flutter/material.dart';
import 'package:we_link/components/profile/myWallet.dart';
import 'package:we_link/constant/stylesConstants.dart';

import '../../../models/profile/user_profile_response.dart';

class menuRowProfile extends StatelessWidget {
  Profile profile;
  double balance = 0.0;

  menuRowProfile(this.profile, this.balance);

  @override
  Widget build(BuildContext context) {
    int schedleScreen = 1;
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 50,
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF564FF0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: const Text(
                              'Schedule',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Kanit',
                                  color: Color(0xFFCCCED2)),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 12, right: 10, top: 2),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 2),
                                  child: Image.asset(
                                    'assets/images/Schedule.png',
                                    fit: BoxFit.fill,
                                    height: 13,
                                    width: 13,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      alignment: Alignment.topRight,
                                      child: Text.rich(TextSpan(
                                        text: "0 List",
                                        style: menuRowProfileText,
                                      ))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*
                    Positioned(
                      right: 0,
                      top: 5,
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 1,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFB6756),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 15,
                          minHeight: 15,
                        ),
                        child: const Center(
                          child: Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                     */
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => myWallet()),
                );
              },
              child: Container(
                width: 120,
                height: 50,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      child: const Text(
                        'Wallet',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Kanit',
                            color: Color(0xFF9FA7C5)),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 12, right: 10, top: 2),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 2),
                            child: Image.asset(
                              'assets/images/wallet.png',
                              fit: BoxFit.fill,
                              height: 11,
                              width: 14,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.topRight,
                                child: Text.rich(
                                    TextSpan(
                                      text: '${balance}฿',
                                      style: menuRowProfileText,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => myWallet()),
                // );
              },
              child: Container(
                width: 120,
                height: 50,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF40C255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      child: const Text(
                        'Points',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Kanit',
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 12, right: 10, top: 2),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 2),
                            child: Image.asset(
                              'assets/images/c.png',
                              fit: BoxFit.fill,
                              color: Colors.white,
                              height: 14,
                              width: 14,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.topRight,
                                child: Text.rich(
                                  TextSpan(
                                    text:
                                        "${profile.customer?.points ?? 0} Pts.",
                                    style: menuRowProfileText,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
