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
          height: 460.h,
          margin: EdgeInsets.symmetric(horizontal: 34.w),
          decoration: BoxDecoration(
              color: Color(0xffCDE6FE).withOpacity(.4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              )),
        ),
        Container(
          height: 450.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              color: Color(0xffCDE6FE),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              )),
        ),
        Container(
          height: 440.h,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(.3),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            image: new DecorationImage(
                fit: BoxFit.fill, image: new AssetImage(image!)),
          ),
        ),
      ],
    );
  }
}
