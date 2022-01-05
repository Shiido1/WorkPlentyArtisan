import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'text_views.dart';

Future<void> dialog(
  BuildContext context, {
  String? title,
  String? message,
  Function()? yesTap,
  Function()? noTap,
  String? noText,
  String? yesText,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppImages.logo),
            SizedBox(height: 20.h),
            TextView(
              text: title ?? '',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.h),
            TextView(
              text: message ?? '',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: yesTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                width: Utils.getDeviceWidth(context),
                decoration: BoxDecoration(
                  color: Pallets.blue,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TextView(
                  text: yesText ?? '',
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  textAlign: TextAlign.center,
                  color: Pallets.white,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: noTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                width: Utils.getDeviceWidth(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: const Color(0xffD0D5DD))),
                child: TextView(
                  text: noText ?? '',
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  textAlign: TextAlign.center,
                  color: Pallets.grey700,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
