import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ClickOne extends StatelessWidget {
  final Function()? onTap;
  final String? image;
  final String? text;
  final Widget? widget;

  final bool? trailing;
  final MainAxisAlignment? mainAxisAlignment;
  const ClickOne(
      {this.onTap,
      this.image,
      this.text,
      this.widget,
      this.mainAxisAlignment,
      this.trailing = false,
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
        child: Row(
          children: [
            SvgPicture.asset(image ?? ''),
            SizedBox(width: 8.w),
            Expanded(
              child: TextView(
                  text: text ?? '',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left),
            ),
            if (trailing!) Icon(Icons.keyboard_arrow_right),
            if (widget != null) widget!,
          ],
        ),
      ),
    );
  }
}
