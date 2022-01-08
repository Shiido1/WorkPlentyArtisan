import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/helper/helper_handler.dart';
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
      this.height = 140,
      this.iconWidget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          color: Theme.of(context).scaffoldBackgroundColor,
          height: height?.h,
          child: Center(
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
                      child: iconWidget ??
                          GestureDetector(
                            onTap: goBack,
                            child: Container(
                              padding: EdgeInsets.all(14.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border:
                                      Border.all(color: Pallets.primary100)),
                              child: Icon(Icons.keyboard_arrow_left),
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
          )),
    );
  }
}
