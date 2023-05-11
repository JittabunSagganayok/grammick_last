import 'package:flutter/material.dart';
import 'package:we_link/models/driver/all_vehicle_type_reponse.dart';

class SelectCarScreen extends StatefulWidget {
  List<Vehicle> carList;
  Function(int) onSelected;

  SelectCarScreen(
    this.carList, {
    Key? key,
    this.RentPackage,
    required this.onSelected,
  }) : super(key: key);
  final String? RentPackage;

  @override
  State<SelectCarScreen> createState() => _SelectCarScreenState();
}

class _SelectCarScreenState extends State<SelectCarScreen> {
  @override
  void initState() {
    super.initState();
    indexSelects =
        widget.carList.indexWhere((element) => element.selected == true);
  }

  var indexSelects = -1;

  void clickSelects(i) {
    setState(() {
      if (indexSelects == i) {
        indexSelects = -1;
        widget.onSelected.call(indexSelects);
      } else {
        indexSelects = i;
        widget.onSelected.call(i);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            for (var i = 0; i < widget.carList.length; i++)
              GestureDetector(
                onTap: () => clickSelects(i),
                child: Stack(
                  children: [
                    Container(
                      // constraints: maxHeightContain,
                      margin: EdgeInsets.only(right: 10, top: 15),
                      // height: 50,
                      width: 120,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.all(12),
                              child: Image.network(
                                widget.carList[i].picture ?? "",
                                fit: BoxFit.fill,
                                height: 44,
                                width: 77,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text.rich(
                              TextSpan(
                                text: widget.carList[i].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Kanit'),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          widget.RentPackage == 'RentPackage'
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                )
                              : Container(
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 12),
                                  child: Text.rich(
                                    TextSpan(
                                      text: widget.carList[i].cost.toString(),
                                      style: TextStyle(
                                          color: Color(0xFF40C255),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Kanit'),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 8,
                      child: indexSelects == i
                          ? Container(
                              child: CircleAvatar(
                                radius: 10,
                                backgroundImage: AssetImage(
                                  'assets/images/selectcar.jpg',
                                ),
                              ),
                            )
                          : Container(),
                    )
                  ],
                ),
              )
          ]),
        ));
  }
}
