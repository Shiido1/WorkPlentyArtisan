import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/button_widget.dart';
import 'package:artisan/views/widgets/bottom_sheet.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/chat_session.dart';

class EditorTab extends StatelessWidget {
  const EditorTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AppImages.stopwatch),
                        SizedBox(width: 5.w),
                        TextView(
                          text: 'Time',
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    TextView(
                      text: '00:00',
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.right,
                      color: Pallets.mildGrey100,
                    )
                  ],
                ),
                SizedBox(height: 34.h),
                Container(
                  height: 550.h,
                  width: Utils.getDeviceWidth(context),
                  color: Pallets.black,
                ),
              ],
            ),
          ),
          BtnWidget(
            iconWidget: GestureDetector(
                onTap: () => _showModal(context),
                child: SvgPicture.asset(AppImages.chat)),
            showSkip: false,
            btnText: 'Start Session',
            callback: () => null,
            goBack: () => null,
          )
        ],
      ),
    );
  }

  _showModal(BuildContext context) {
    BottomSheets.showSheet(context, child: ChatSession());
  }
}
