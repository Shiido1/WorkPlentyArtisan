import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_views.dart';

class LeftRightWidget extends StatelessWidget {
  final String? leftText;
  final String? rightText;
  final Widget? rightWidget;

  const LeftRightWidget(
      {Key? key, this.leftText, this.rightText, this.rightWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextView(
                text: leftText ?? '',
                fontWeight: FontWeight.w400,
                color: Pallets.grey500,
                fontSize: 14,
                textAlign: TextAlign.left,
                maxLines: 2),
          ),
          rightWidget ??
              Expanded(
                  child: TextView(
                      text: rightText ?? '',
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey700,
                      fontSize: 14,
                      textAlign: TextAlign.right,
                      maxLines: 2))
        ],
      ),
    );
  }
}
