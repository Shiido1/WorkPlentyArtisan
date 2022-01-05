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

  const BtnWidget(
      {Key? key, this.callback, this.goBack, this.btnText, this.skip})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        alignment: Alignment.center,
        color: Theme.of(context).scaffoldBackgroundColor,
        margin: EdgeInsets.only(top: Utils.getDeviceHeight(context) * .7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: TextView(
                text: 'Skip',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                textAlign: TextAlign.right,
                onTap: skip,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: goBack,
                    child: Container(
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: Pallets.primary100)),
                      child: Icon(Icons.keyboard_arrow_left),
                    ),
                  ),
                ),
                SizedBox(width: 11.w),
                Expanded(
                    flex: 6,
                    child: ButtonWidget(
                        buttonText: btnText ?? '', onPressed: callback)),
              ],
            ),
          ],
        ));
  }
}
