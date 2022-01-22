import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewBgCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final double? horizontal;
  final double? vertical;

  const ReviewBgCard(this.child,
      {Key? key,
      this.padding,
      this.borderRadiusGeometry,
      this.horizontal = 18,
      this.vertical = 10})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
              horizontal: horizontal!.w, vertical: vertical!.h),
      decoration: BoxDecoration(
        borderRadius: borderRadiusGeometry ?? BorderRadius.circular(12.r),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
