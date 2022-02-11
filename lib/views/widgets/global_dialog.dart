import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_views.dart';

Future<void> globalDialog(
    {required String? question,
    @required BuildContext? context,
    required List<String> list,
    bool showRadioButton = true,
    bool showDisclaimer = false,
    required Function(dynamic value)? picked}) async {
  await showDialog(
      context: context!,
      builder: (context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 16,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextView(
                      text: question!,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center),
                  SizedBox(height: 9.h),
                  const Divider(),
                  SizedBox(height: 9.h),
                  ...list
                      .map(
                        (value) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                picked!(value);
                                PageRouter.goBack(context);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      child: TextView(
                                    text: value,
                                    fontSize: 16.sp,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w400,
                                  )),
                                  if (showRadioButton)
                                    const Icon(Icons.radio_button_off_outlined)
                                ],
                              ),
                            ),
                            SizedBox(height: 9.h),
                            const Divider(),
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          )));
}
