import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/job/job_details.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/skills_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> _skills = [
      'UI',
      'UX',
      'Web Design',
      'Figma',
      'User Research',
      'Style Guide'
    ];
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => PageRouter.gotoWidget(JobDetails(), context),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 11.h),
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
                          text: 'UI Redesign for Web Application',
                          maxLines: 1,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 7.h),
                        TextView(
                          text: 'Posted 17 minutes ago',
                          maxLines: 1,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 7.h),
                        TextView(
                          text:
                              '''The task is to design a modern web app for a cargo portal application. Our current design features need a more modern look and better user experience, screen listing''',
                          maxLines: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                          textOverflow: TextOverflow.ellipsis,
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
                    _buildWidget(AppImages.credit_card, '₦150000'),
                    SizedBox(width: 20.w),
                    _buildWidget(AppImages.hour_glass, '4 Weeks'),
                    SizedBox(width: 20.w),
                    _buildWidget(AppImages.bids, '16 Bids'),
                    SizedBox(width: 20.w),
                    _buildWidget(AppImages.star, '4.0'),
                  ],
                ),
              ),
              SizedBox(height: 7.h),
              SizedBox(height: 7.h),
              Wrap(
                spacing: 5,
                runSpacing: 10,
                children:
                    _skills.map((element) => SkillsWidget(element)).toList(),
              ),
            ],
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
            textAlign: TextAlign.left,
          ),
        )
      ],
    ));
  }
}
