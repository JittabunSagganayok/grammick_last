import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class AppRating extends StatelessWidget {
  double rating;
  bool ignoreGestures;
  Function(double)? callback;
  double itemSize;

  AppRating({
    required this.rating,
    this.callback,
    this.itemSize = 12,
    this.ignoreGestures = false,
  });

  AppRating.ignoreGestures({
    required this.rating,
    this.callback,
    this.itemSize = 12,
    this.ignoreGestures = true,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemSize: itemSize,
      ratingWidget: RatingWidget(
        full: SvgPicture.asset('assets/ic_rating_full.svg'),
        half: SvgPicture.asset('assets/ic_rating_full.svg'),
        empty: SvgPicture.asset('assets/ic_rating_outline.svg'),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 1),
      ignoreGestures: ignoreGestures,
      onRatingUpdate: (rating) {
        callback?.call(rating);
      },
    );
  }
}
