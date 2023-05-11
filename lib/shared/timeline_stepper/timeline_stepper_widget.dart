import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/colosrConstants.dart';

class TimelineStepperWidget extends StatelessWidget {
  var steppers = <TimelineStepperItem>[];

  TimelineStepperWidget(this.steppers);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: steppers
              .map((item) => Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (steppers.first != item) ...[
                          Expanded(
                            child: Container(
                              height: 1,
                              margin: EdgeInsets.only(top: 8),
                              color: stepperActiveColor,
                            ),
                          ),
                        ] else ...[
                          SizedBox(
                            width: 24,
                          ),
                        ],
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: stepperActiveColor,
                              ),
                              width: 12,
                              height: 12,
                              child: Icon(
                                Icons.check,
                                size: 8,
                                color: item.active == true
                                    ? Colors.transparent
                                    : Colors.white,
                              ),
                            ),
                            Text(
                              item.title,
                              style: GoogleFonts.kanit(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: item.active == true
                                    ? stepperActiveColor
                                    : Colors.black,
                              ),
                            ),
                            Text(
                              item.subtitle,
                              style: GoogleFonts.kanit(
                                fontSize: 9,
                                fontWeight: FontWeight.w300,
                                color: Color(
                                  0xff626262,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (steppers.last != item) ...[
                          Expanded(
                            child: Container(
                              height: 1,
                              margin: EdgeInsets.only(top: 8),
                              color: stepperActiveColor,
                            ),
                          ),
                        ] else ...[
                          SizedBox(
                            width: 24,
                          ),
                        ],
                      ],
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class TimelineStepperItem {
  String title;
  String subtitle;
  bool active;

  TimelineStepperItem({
    required this.title,
    required this.subtitle,
    required this.active,
  });
}
