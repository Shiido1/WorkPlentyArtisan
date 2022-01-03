import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_views.dart';

class CustomTab extends StatelessWidget {
  final bool? selected;
  final String? text;
  final Function()? onTap;

  const CustomTab({Key? key, this.selected, this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: selected!
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(8.r), color: Pallets.white)
            : null,
        child: TextView(
          text: text ?? '',
          fontWeight: FontWeight.w500,
          color: Pallets.grey700,
          fontSize: 12,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    ));
  }
}
