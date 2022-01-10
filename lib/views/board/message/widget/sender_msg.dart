import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../chats.dart';

class SenderSide extends StatelessWidget {
  final Chats chats;
  const SenderSide(this.chats, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextView(
            text: chats.time ?? '',
            color: Pallets.grey,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.only(left: 60.w),
            decoration: BoxDecoration(
                border: Border.all(color: Pallets.grey),
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                )),
            child: TextView(
              text: chats.message ?? '',
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
