import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/presentation/message/widgets/message_box.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatSession extends StatelessWidget {
  const ChatSession({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getDeviceHeight(context) * .7,
      child: Scaffold(
        appBar: defaultAppBar2(
          context,
          showLeading: false,
          flexibleSpace: SafeArea(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Pallets.amber400,
                    maxRadius: 20.r,
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    width: Utils.getDeviceWidth(context) * .2,
                    child: TextView(
                        text: 'Aaron Dallas',
                        fontWeight: FontWeight.w700,
                        maxLines: 1,
                        color: Pallets.white,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Stack(
          children: [
            MessageBox(),
          ],
        )),
      ),
    );
  }
}
