import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackedContainer extends StatelessWidget {
  final String? image;
  const StackedContainer(this.image, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 379.h,
          width: Utils.getDeviceWidth(context),
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          decoration: BoxDecoration(
              color: Color(0xffCDE6FE).withOpacity(.4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              )),
        ),
        Container(
          height: 370.h,
          width: Utils.getDeviceWidth(context),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
              color: Color(0xffCDE6FE),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              )),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
          ),
          child: ImageLoader(
            height: 360.h,
            width: Utils.getDeviceWidth(context),
            path: image,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
