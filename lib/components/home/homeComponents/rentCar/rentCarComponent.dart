import 'package:flutter/material.dart';
import 'package:we_link/models/vehicle_promotion/vehicle_promotion_list_response.dart';

class rentCarComponent extends StatefulWidget {
  bool isHomeScreen = false;
  Function(VehiclePromotion) onPackageSelected;
  Function() onRemovePackage;
  List<VehiclePromotion> vehiclePromotionList;

  rentCarComponent(
    this.vehiclePromotionList, {
    required this.onPackageSelected,
    required this.onRemovePackage,
    this.isHomeScreen = false,
  });

  @override
  State<rentCarComponent> createState() => _rentCarComponentState();
}

class _rentCarComponentState extends State<rentCarComponent> {
  var indexSelects = -1;

  void clickSelects(i) {
    if (widget.isHomeScreen == true) {
      if (indexSelects == i) {
        widget.onRemovePackage.call();
      } else {
        widget.onPackageSelected.call(widget.vehiclePromotionList[i]);
      }
      return;
    }

    setState(() {
      if (indexSelects == i) {
        indexSelects = -1;
        widget.onRemovePackage.call();
      } else {
        indexSelects = i;
        widget.onPackageSelected.call(widget.vehiclePromotionList[i]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        for (var i = 0; i < widget.vehiclePromotionList.length; i++)
          InkWell(
            onTap: () => clickSelects(i),
            child: Container(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 16, bottom: 5),
                    child: Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      width: 340,
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      decoration: BoxDecoration(
                          color: indexSelects == i
                              ? Color(0xFFFFF7E7)
                              : Color(0xFFEEEEF2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: indexSelects == i
                                ? Color(0xFFFDB824)
                                : Color(0xFFEEEEF2),
                            width: 1,
                          )),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.white,
                            child: Container(
                              margin: EdgeInsets.all(9),
                              child: Image.network(
                                widget.vehiclePromotionList[i].picture ?? "",
                                fit: BoxFit.fill,
                                height: 33,
                                width: 68,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFDCD03),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(7),
                                        )),
                                    child: Text(
                                      'Promotion',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Kanit'),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text.rich(
                                      TextSpan(
                                        text: widget.vehiclePromotionList[i]
                                                .title ??
                                            "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Kanit'),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            text:
                                                "${widget.vehiclePromotionList[i].price}" +
                                                    '  ',
                                            style: TextStyle(
                                                color: Color(0xFF40C255),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: 'Kanit'),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "${widget.vehiclePromotionList[i].promotionPrice}",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Color(0xFF434343),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Kanit'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 4,
                      right: 20,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFF564FF0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Saved',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Kanit'),
                              ),
                              Text(
                                "${((num.parse(widget.vehiclePromotionList[i].promotionPrice ?? '0') / (num.parse(widget.vehiclePromotionList[i].price ?? '0'))) * 100).toStringAsFixed(0)}%",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Kanit'),
                              ),
                            ]),
                      ))
                ],
              ),
            ),
          )
      ]),
    ));
  }
}
