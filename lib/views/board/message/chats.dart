import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/message/widget/receiver_msg.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/message_box.dart';
import 'widget/sender_msg.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          showLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundColor: Pallets.amber400,
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextView(
                            text: 'Gover Ward',
                            fontWeight: FontWeight.w700,
                            maxLines: 1,
                            color: Pallets.white,
                            textOverflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left),
                        Text(
                          "Online",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            _popMenu(),
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

  _popMenu() {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert),
        color: Pallets.primary100,
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Start a paid session",
                    style: TextStyle(color: Pallets.white)),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Request a freelance job",
                    style: TextStyle(color: Pallets.white)),
                value: 2,
              ),
              PopupMenuItem(
                child: Text("Request home service",
                    style: TextStyle(color: Pallets.white)),
                value: 3,
              ),
              PopupMenuItem(
                child: Text("Archive chat",
                    style: TextStyle(color: Pallets.white)),
                value: 4,
              ),
              PopupMenuItem(
                child:
                    Text("Block user", style: TextStyle(color: Pallets.white)),
                value: 5,
              ),
              PopupMenuItem(
                child:
                    Text("Report user", style: TextStyle(color: Pallets.white)),
                value: 6,
              )
            ]);
  }
}

class Chats {
  final String? time;
  final bool? isMe;
  final String? message;

  Chats({this.time, this.isMe, this.message});

  static List<Chats> getMessage() {
    List<Chats> _chats = [];
    Chats _c = Chats(
        time: '12:36',
        isMe: false,
        message:
            'Hello! Finally found the time to write. I need your help with creating interactive animations for my mobile application.');
    _chats.add(_c);
    _c = Chats(time: '12:36', isMe: false, message: 'Can I send yor files?');
    _chats.add(_c);
    _c = Chats(time: '14:03', isMe: true, message: 'Hey! Okay, send out.');
    _chats.add(_c);
    _c = Chats(
        time: '12:36',
        isMe: false,
        message:
            'Hello! Finally found the time to write. I need your help with creating interactive animations for my mobile application.');
    _chats.add(_c);
    _c = Chats(time: '12:36', isMe: false, message: 'Can I send yor files?');
    _chats.add(_c);
    _c = Chats(time: '14:03', isMe: true, message: 'Hey! Okay, send out.');
    _chats.add(_c);
    _c = Chats(
        time: '12:36',
        isMe: false,
        message:
            'Hello! Finally found the time to write. I need your help with creating interactive animations for my mobile application.');
    _chats.add(_c);
    _c = Chats(time: '12:36', isMe: false, message: 'Can I send yor files?');
    _chats.add(_c);
    _c = Chats(time: '14:03', isMe: true, message: 'Hey! Okay, send out.');
    _chats.add(_c);
    return _chats;
  }
}
