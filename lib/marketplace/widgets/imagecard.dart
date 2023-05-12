import 'package:flutter/material.dart';
import 'package:we_link/marketplace/data/data.dart';
import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:we_link/marketplace/pages/detail.dart';

// import 'package:flutter_modular/flutter_modular.dart';

class Imagecardgen extends StatefulWidget {
  const Imagecardgen({super.key});

  @override
  State<Imagecardgen> createState() => _ImagecardgenState();
}

class _ImagecardgenState extends State<Imagecardgen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    final imageData = imagescardList;
    var imageDatax;
    // var _imagepath;
    // var _title;
    // var _price;

    return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180,
            childAspectRatio: 0.65,
            crossAxisSpacing: 15,
            mainAxisSpacing: 9),
        itemCount: imageData.length,
        itemBuilder: (BuildContext ctx, index) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 159 * fem,
                  height: 183 * fem,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        imageDatax = imageData[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    imageDatax: imageDatax,
                                  )),
                        );
                        // Modular.to.pushNamed(
                        //   '/detail',
                        //   arguments: imageDatax,
                        // );
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Image.asset(
                        imageData[index]['image_path'],
                        width: 159 * fem,
                        height: 183 * fem,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  imageData[index]['title'],
                  style: SafeGoogleFont(
                    'Kanit',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 1.495,
                    color: const Color(0xff000000),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  imageData[index]['price'],
                  style: SafeGoogleFont(
                    'Kanit',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.495,
                    color: const Color(0xfff9774e),
                  ),
                ),
                //Text(imageData[index]['id']),
              ]);
        });
  }
}
