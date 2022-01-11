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
          decoration: BoxDecoration(
              color: Color(0xffCDE6FE).withOpacity(.4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              )),
        ),
        Container(
          height: 370.h,
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
          child: Image.asset(
            image!,
            height: 360.h,
            fit: BoxFit.cover,
            width: Utils.getDeviceWidth(context),
          ),
        ),
      ],
    );
  }
}
