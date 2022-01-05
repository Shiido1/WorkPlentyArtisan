import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyWidget extends StatelessWidget {
  final Widget? child;
  const BodyWidget({required this.child, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: child)),
      ),
    );
  }
}
