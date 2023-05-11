import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/components/selectTime.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLocation.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/models/address/my_address_response.dart';

class WeRideAddressList extends StatefulWidget {
  List<AddressResponse> addressList;
  Function(DateTime?)? chooseDateTime;

  WeRideAddressList(this.addressList, this.chooseDateTime);

  @override
  State<WeRideAddressList> createState() => _WeRideAddressListState();
}

class _WeRideAddressListState extends State<WeRideAddressList> {
  DateTime? bookingAdvance;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: maxHeightContain,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 15, color: Colors.grey[300]!, spreadRadius: 8)
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 20, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Where would you like to go?',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontFamily: 'Kanit'),
            ),
            SizedBox(
              height: 16,
            ),
            SelectTimeWidget(
              chooseDateTime: (time) {
                bookingAdvance = time;
                widget.chooseDateTime?.call(time);
              },
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.to(SearchLocationScreen(
                  bookingAdvance: bookingAdvance,
                  searchLocationBy: SearchLocationBy.RIDE,
                ));
              },
              child: Container(
                  height: 43,
                  margin: EdgeInsets.only(right: 20, bottom: 24),
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      )),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/loca.png',
                          fit: BoxFit.fill,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: const Text.rich(
                          TextSpan(
                              text: "Search for a destination",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Kanit')),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ),
                    ],
                  )),
            ),
            Container(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var i = 0; i < widget.addressList.length; i++)
                            InkWell(
                              onTap: () {
                                final address = widget.addressList[i];
                                Get.to(SearchLocationScreen(
                                  address: address,
                                  bookingAdvance: bookingAdvance,
                                  searchLocationBy: SearchLocationBy.RIDE,
                                ));
                              },
                              child: Container(
                                // constraints: maxHeightContain,
                                margin: EdgeInsets.only(right: 9),
                                height: 50,
                                width: 123,
                                decoration: BoxDecoration(
                                    color: Color(0xFF121212),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    )),
                                child: Container(
                                  margin: EdgeInsets.only(left: 9, right: 7),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Image.asset(
                                          'assets/images/home1.png',
                                          fit: BoxFit.fill,
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 13,
                                      ),
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Text.rich(
                                                  TextSpan(
                                                    text: widget
                                                        .addressList[i].name,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Kanit'),
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                child: Text.rich(
                                                  TextSpan(
                                                    text: widget
                                                        .addressList[i].address,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF6A6A6A),
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Kanit'),
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ])))
          ],
        ),
      ),
    );
  }
}
