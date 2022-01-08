import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VideoAudioTab extends StatelessWidget {
  const VideoAudioTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppImages.meeting),
                  SizedBox(height: 16.h),
                  TextView(
                    text: 'Redirecting to zoom....',
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(
                  icon: AppImages.video,
                  row: true,
                  buttonText: 'Join with Zoom',
                  onPressed: () => null),
            )
          ],
        ),
      ),
    );
  }
}
