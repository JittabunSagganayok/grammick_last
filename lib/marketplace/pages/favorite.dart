import 'package:flutter/material.dart';

import 'package:we_link/marketplace/data/data.dart';
import 'package:we_link/marketplace/widgets/header.dart';
import 'package:we_link/marketplace/widgets/imagecard.dart';

class FavScreen extends StatefulWidget {
  FavScreen({super.key});

  //String title;

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double h1 = ((250 * (imagescardList.length) / 2) + 4) * fem;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Headernoicon(fem: fem, ffem: ffem, title: "My Favorite"),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16, 20, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: h1,
                    child: Imagecardgen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
