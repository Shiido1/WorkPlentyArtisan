import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroImageWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subTitle;

  const IntroImageWidget({
    Key? key,
    this.image,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          ImageLoader(
            path: image!,
            width: ScreenUtil().setWidth(206),
            height: ScreenUtil().setHeight(418),
          ),
          SizedBox(height: 17.h),
          TextView(
            text: title!,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          TextView(
            text: subTitle!,
            textAlign: TextAlign.center,
            fontSize: 14.sp,
            color: Pallets.grey500,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}
