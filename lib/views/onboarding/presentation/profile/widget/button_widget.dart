import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnWidget extends StatelessWidget {
  final Function()? callback;
  final Function()? goBack;
  final Function()? skip;
  final String? btnText;
  final bool? showSkip;
  final Widget? iconWidget;
  final double? height;

  const BtnWidget(
      {Key? key,
      this.callback,
      this.goBack,
      this.btnText,
      this.skip,
      this.showSkip = true,
      this.height,
      this.iconWidget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: showSkip!,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextView(
                    text: 'Skip',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    textAlign: TextAlign.right,
                    onTap: skip,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: goBack,
                      child: GestureDetector(
                        onTap: goBack,
                        child: Container(
                          height: 50.h,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: Pallets.primary100)),
                          child: iconWidget ?? Icon(Icons.keyboard_arrow_left),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 11.w),
                  Expanded(
                      flex: 6,
                      child: ButtonWidget(
                          color: Pallets.white,
                          buttonText: btnText ?? '',
                          onPressed: callback)),
                ],
              ),
            ],
          ),
        ));
  }
}
