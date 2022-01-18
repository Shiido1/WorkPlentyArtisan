import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyWidget extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;
  final GlobalKey<FormState>? globalFormKey;

  const BodyWidget(
      {required this.child,
      this.height = 16,
      this.width = 16,
      Key? key,
      this.globalFormKey})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: globalFormKey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height.h, horizontal: width.w),
                  child: child)),
        ),
      ),
    );
  }
}
