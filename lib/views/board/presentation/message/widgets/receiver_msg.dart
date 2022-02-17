import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/presentation/message/model/dummy_chats.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiverSide extends StatelessWidget {
  final Chats chats;
  const ReceiverSide(this.chats, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: chats.time ?? '',
            color: Pallets.grey,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.only(right: 60.w),
            decoration: BoxDecoration(
                color: Pallets.primary100,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                )),
            child: TextView(
              text: chats.message ?? '',
              color: Pallets.white,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
