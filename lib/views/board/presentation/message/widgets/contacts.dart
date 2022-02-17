import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/presentation/message/model/dummy_data.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../chats.dart';

class ChatContactsWidget extends StatelessWidget {
  final ChatModel chat;
  const ChatContactsWidget(
    this.chat, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => PageRouter.gotoWidget(ChatsScreen(), context),
      child: Container(
        margin: EdgeInsets.only(bottom: 23.h),
        padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: chat.name == "Ash Stokes"
                ? Color(0xffE6F3FF)
                : Colors.transparent),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Pallets.primary100,
                ),
                Positioned(
                  left: 40.w,
                  top: 35.h,
                  child: Container(
                    height: 12.h,
                    width: 12.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Pallets.green200,
                        border: Border.all(color: Pallets.white, width: 2)),
                  ),
                ),
              ],
            ),
            SizedBox(width: 13.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      text: chat.name ?? '',
                      fontWeight: FontWeight.w700,
                      maxLines: 1,
                      fontSize: 14,
                      color: Pallets.primary150,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left),
                  SizedBox(height: 9.h),
                  TextView(
                      text: chat.message ?? '',
                      fontWeight: FontWeight.w400,
                      maxLines: 1,
                      color: Pallets.primary150,
                      fontSize: 12,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left),
                ],
              ),
            ),
            SizedBox(width: 13.w),
            Visibility(
              visible: chat.thereIsMessage!,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextView(
                      text: chat.time ?? '',
                      fontWeight: FontWeight.w400,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right),
                  SizedBox(height: 9.h),
                  CircleAvatar(
                    radius: 10.r,
                    backgroundColor: Pallets.primary100,
                    child: TextView(
                        text: '5',
                        fontWeight: FontWeight.w700,
                        maxLines: 1,
                        fontSize: 9,
                        color: Pallets.white,
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
