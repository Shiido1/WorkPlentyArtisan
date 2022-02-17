import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/time_helper.dart';
import 'package:artisan/views/onboarding/data/model/work_history_response/datum.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExperienceWidget extends StatelessWidget {
  final Datum? history;
  const ExperienceWidget(this.history, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18.h),
                    TextView(
                      text:
                          '${history?.position ?? ''} | ${history?.company ?? ''}',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8.h),
                    TextView(
                      text:
                          '${TimeUtil.getMonthAndYear(history?.startedOn ?? '')} - ${_isStillThere(history?.currentlyHere) ? 'Present' : '${TimeUtil.getMonthAndYear(history?.endedOn ?? '')}'}',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              ImageLoader(path: AppImages.edit),
              ImageLoader(path: AppImages.close),
            ]),
            SizedBox(height: 18.h),
            Divider(),
          ],
        )
      ],
    );
  }

  bool _isStillThere(int? d) {
    if (d == 1) return true;
    return false;
  }
}
