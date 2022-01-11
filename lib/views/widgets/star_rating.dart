import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int? starCount;
  final double? rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  StarRating(
      {this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating!) {
      icon = new Icon(
        Icons.star_border,
        color: Pallets.grey,
        size: 14.w,
      );
    } else if (index > rating! - 1 && index < rating!) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Pallets.gold,
        size: 14.w,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Pallets.gold,
        size: 14.w,
      );
    }
    return new InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisSize: MainAxisSize.min,
        children: new List.generate(
            starCount!, (index) => buildStar(context, index)));
  }
}
