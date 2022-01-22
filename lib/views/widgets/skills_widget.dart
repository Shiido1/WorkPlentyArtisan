import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_views.dart';

class SkillsWidget extends StatelessWidget {
  final String value;
  const SkillsWidget(this.value, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Color.fromRGBO(16, 55, 92, 0.1),
      ),
      child: TextView(
          text: value,
          fontWeight: FontWeight.w400,
          fontSize: 10,
          letterSpacing: -0.33,
          textAlign: TextAlign.center),
    );
  }
}
