import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_views.dart';

class SkillsWidget extends StatelessWidget {
  final String value;
  const SkillsWidget(this.value, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Pallets.grey.withOpacity(.2)),
      child: TextView(
          text: value,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center),
    );
  }
}
