import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/gig/presentation/message/model/dummy_chats.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SenderSide extends StatelessWidget {
  final Chats chats;
  const SenderSide(this.chats, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      width: Utils.getDeviceWidth(context) * .3,
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                margin: EdgeInsets.only(left: 60.w),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(112, 124, 151, 0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    border:
                        Border.all(color: Color.fromRGBO(112, 124, 151, 0.25)),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    )),
                child: TextView(
                  text: chats.message ?? '',
                  color: Pallets.mildGrey200,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(width: 8.51.w),
              SvgPicture.asset(AppImages.allDone)
            ],
          ),
        ],
      ),
    );
  }
}
