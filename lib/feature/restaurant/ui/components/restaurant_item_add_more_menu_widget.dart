import 'package:badges/badges.dart' as badges;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantItemAddMoreMenuWidget extends StatelessWidget {
  Function onClick;
  bool added;
  Color backgroundColor;
  // MenuData menu;
  int? id;
  String? image;
  String? name;
  String? description;
  String? price;
  int quantity;

  RestaurantItemAddMoreMenuWidget({
    this.added = false,
    this.backgroundColor = Colors.white,
    required this.onClick,
    // required this.menu,
    this.id,
    this.image,
    this.name,
    this.description,
    this.price,
    this.quantity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              onClick.call();
            },
            child: badges.Badge(
              showBadge: false,
              child: image != null
                  ? ExtendedImage.network(
                      image!,
                      width: 90,
                      borderRadius: BorderRadius.circular(8),
                    )
                  : Container(),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: name ?? '-',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Kanit',
                          ),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${price ?? '-'} ฿',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        description ?? '-',
                        style: GoogleFonts.kanit(
                          color: const Color(0xff7A7A7A),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Text(
                      price ?? '-',
                      style: GoogleFonts.kanit(
                        color: const Color(0xffD52E2F),
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Builder(builder: (context) {
                    if (added) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffF3F3F3),
                              ),
                              width: 24,
                              height: 24,
                              alignment: Alignment.center,
                              child: const Icon(Icons.remove),
                            ),
                            onTap: () {},
                          ),
                          SizedBox(
                            width: 32,
                            child: Text(
                              '$quantity',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.kanit(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffCEFFCD),
                              ),
                              width: 24,
                              height: 24,
                              alignment: Alignment.center,
                              child: const Icon(Icons.add),
                            ),
                            onTap: () {},
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffCEFFCD),
                              ),
                              width: 24,
                              height: 24,
                              alignment: Alignment.center,
                              child: const Icon(Icons.add),
                            ),
                            onTap: () {},
                          ),
                        ],
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
