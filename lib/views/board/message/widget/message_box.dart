import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: double.infinity,
        color: Pallets.primary100,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {},
              mini: true,
              child: Icon(
                Icons.add,
                color: Pallets.primary100,
                size: 24,
              ),
              backgroundColor: Pallets.white,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Type a message here",
                    hintStyle: TextStyle(color: Pallets.grey),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(width: 15.w),
            SvgPicture.asset(AppImages.chat_emoji),
            SizedBox(width: 13.w),
            FloatingActionButton(
              onPressed: () {},
              mini: true,
              child: SvgPicture.asset(AppImages.send),
              backgroundColor: Color(0xff5B91B8),
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
