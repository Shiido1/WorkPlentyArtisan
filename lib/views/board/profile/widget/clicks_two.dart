import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ClickTwo extends StatelessWidget {
  final Function()? onTap;
  final String? image;
  final String? text;
  final Widget? widget;
  final MainAxisAlignment? mainAxisAlignment;
  const ClickTwo(
      {this.onTap,
      this.image,
      this.text,
      this.widget,
      this.mainAxisAlignment,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              children: [
                TextView(
                    text: text ?? '',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left),
                SizedBox(width: 8.w),
                image != null
                    ? SvgPicture.asset(image!)
                    : TextView(
                        text: 'See all',
                        textAlign: TextAlign.right,
                        fontWeight: FontWeight.w700),
              ],
            ),
            SizedBox(height: 5.h),
            widget ?? Container()
          ],
        ),
      ),
    );
    ;
  }
}
