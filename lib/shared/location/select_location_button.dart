
import 'package:flutter/material.dart';

import '../../constant/stylesConstants.dart';

enum OnClickSelectLocationType{
  CURRENT_LOCATION,MAP
}

class SelectLocationButton extends StatelessWidget {

  Function(OnClickSelectLocationType) onClicked;

  SelectLocationButton(this.onClicked, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width * 1,
              child: OutlinedButton(
                style: currentLoButton,
                onPressed: () {
                  onClicked.call(OnClickSelectLocationType.CURRENT_LOCATION);
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
                  onClicked?.call(OnClickSelectLocationType.MAP);
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
