import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/views/board/message/widgets/chat_menu.dart';
import 'package:artisan/views/board/message/widgets/receiver_msg.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'model/dummy_chats.dart';
import 'model/open_chat_window.dart';
import 'widgets/message_box.dart';
import 'widgets/sender_msg.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar2(context,
          showLeading: false,
          flexibleSpace: OpenChatWindow(),
          actions: [
            ChatOption(menuOptions: (options) {}),
          ]),
      body: Stack(
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.clock),
                  SizedBox(width: 4.w),
                  TextView(
                      text: 'Yesterday',
                      fontWeight: FontWeight.w400,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center),
                ],
              ),
              SizedBox(height: 16.h),
              ...Chats.getMessage()
                  .map((chat) =>
                      chat.isMe! ? SenderSide(chat) : ReceiverSide(chat))
                  .toList(),
              SizedBox(height: Utils.getDeviceHeight(context) * .3)
            ],
          ),
          MessageBox()
        ],
      ),
    );
  }
}
