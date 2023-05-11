import 'package:flutter/material.dart';
import 'package:we_link/components/signin/addAddress.dart';
import 'package:we_link/components/signin/map.dart';
import 'package:we_link/constant/stylesConstants.dart';

class twoButton extends StatelessWidget {
  const twoButton({
    Key? key,
    this.rideScreen,
    this.searchAddress,
    this.driveYourCar,
    this.onClickCurrentLocation,
    this.onClickChooseFromMap,
  }) : super(key: key);
  final String? rideScreen;
  final String? searchAddress;
  final int? driveYourCar;
  final Function? onClickCurrentLocation;
  final Function? onClickChooseFromMap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  rideScreen == 'rideScreen' || driveYourCar == 1
                      ? onClickCurrentLocation?.call()
                      : searchAddress == 'searchAddress'
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChooseLocationByMapScreen()),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddNewAddressScreen()),
                            );
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/images/Current.png',
                        fit: BoxFit.fill,
                        height: 15,
                        width: 12,
                      ),
                    ),
                    Expanded(
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
                  rideScreen == 'rideScreen' || driveYourCar == 1
                      ? onClickChooseFromMap?.call()
                      : searchAddress == 'searchAddress'
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddNewAddressScreen(
                                      keyword: searchAddress)),
                            )
                          : Navigator.push(
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
    );
  }
}
