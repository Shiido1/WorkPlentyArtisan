import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/datum.dart';
import 'package:artisan/views/board/job/job_details.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/skills_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  final Datum? gig;
  const CardWidget({this.gig, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => PageRouter.gotoWidget(JobDetails(), context),
      child: Container(
        margin: EdgeInsets.only(bottom: 30.h),
        child: Card(
          child: Padding(
            padding: EdgeInsets.only(
                top: 11.h, bottom: 23.h, left: 13.w, right: 13.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextView(
                            text: gig?.title ?? '',
                            maxLines: 1,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 7.h),
                          TextView(
                            text: 'Posted 17 minutes ago',
                            maxLines: 1,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 7.h),
                          TextView(
                            text: gig?.description ?? '',
                            maxLines: 3,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.left,
                            fontStyle: FontStyle.normal,
                            textOverflow: TextOverflow.ellipsis,
                            letterSpacing: -0.33,
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Pallets.primary100,
                      child: ImageLoader(path: AppImages.bookmark),
                    )
                  ],
                ),
                SizedBox(height: 7.h),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      _buildWidget(AppImages.credit_card,
                          '${Utils.currency(gig?.totalBudget ?? 0)}'),
                      SizedBox(width: 20.w),
                      _buildWidget(AppImages.hour_glass, gig?.timeline ?? ''),
                      SizedBox(width: 20.w),
                      _buildWidget(AppImages.bids, ' Bids'),
                      SizedBox(width: 20.w),
                      _buildWidget(AppImages.star, ''),
                    ],
                  ),
                ),
                SizedBox(height: 13.h),
                Wrap(
                  spacing: 5,
                  runSpacing: 10,
                  children:
                      gig!.skills!.map((skill) => SkillsWidget(skill)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildWidget(String image, String value) {
    return Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(image),
        SizedBox(width: 5.w),
        Expanded(
          child: TextView(
            text: value,
            maxLines: 1,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            textAlign: TextAlign.left,
            letterSpacing: -0.33,
          ),
        )
      ],
    ));
  }
}
