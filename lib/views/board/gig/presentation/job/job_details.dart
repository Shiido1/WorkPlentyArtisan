import 'package:artisan/core/entity/skills/skill.dart';
import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/button_widget.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/skills_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'job_details_copy.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({Key? key}) : super(key: key);
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
    return Scaffold(
      appBar: defaultAppBar2(
        context,
        title: 'Job Details',
        textColor: Pallets.white,
        centerTitle: true,
        leadingWidget: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => PageRouter.goBack(context),
            icon: Icon(Icons.arrow_back),
            color: Pallets.white),
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              ReviewBgCard(
                  TextView(
                    text: 'UI Redesign for Web Application',
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                  borderRadiusGeometry: BorderRadius.zero,
                  vertical: 37),
              SizedBox(height: 10.h),
              ReviewBgCard(
                  TextView(
                    text:
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu diam duis vitae cursus libero nec. Vitae vestibulum convallis blandit euismod vitae et quisque lacus magna. Ut sit diam sed pellentesque posuere. Dignissim integer posuere vehicula amet eget purus. Nisl massa sed lacus, semper sit amet sed. Arcu phasellus mattis enim sit sed. Et nullam sit ac lectus gravida ornare ut. Sem auctor viverra netus morbi.\n\nArcu phasellus mattis enim sit sed. Et nullam sit ac lectus gravida ornare ut. Sem auctor viverra netus morbi.''',
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                  ),
                  borderRadiusGeometry: BorderRadius.zero,
                  vertical: 8),
              SizedBox(height: 10.h),
              ReviewBgCard(
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Row(children: [
                            SvgPicture.asset(AppImages.credit_card),
                            SizedBox(width: 5.h),
                            TextView(
                              text: '₦150,000',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                            ),
                          ]),
                          SizedBox(height: 15.h),
                          Row(children: [
                            SvgPicture.asset(AppImages.bids),
                            SizedBox(width: 5.h),
                            TextView(
                              text: '16 Bids',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                            ),
                          ])
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Row(children: [
                            SvgPicture.asset(AppImages.hour_glass),
                            SizedBox(width: 5.h),
                            TextView(
                              text: '4 Weeks',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                            ),
                          ]),
                          SizedBox(height: 15.h),
                          Row(children: [
                            SvgPicture.asset(AppImages.star),
                            SizedBox(width: 5.h),
                            TextView(
                              text: '4.0',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                            ),
                          ])
                        ],
                      )),
                    ],
                  ),
                  borderRadiusGeometry: BorderRadius.zero,
                  vertical: 25.33),
              SizedBox(height: 10.h),
              ReviewBgCard(
                  Wrap(
                    spacing: 5,
                    runSpacing: 10,
                    children: _skills
                        .map((element) => SkillsWidget(Skill()))
                        .toList(),
                  ),
                  borderRadiusGeometry: BorderRadius.zero,
                  vertical: 23),
              SizedBox(height: 23.h),
              ReviewBgCard(
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SvgPicture.asset(AppImages.attach),
                    SizedBox(width: 4.w),
                    TextView(
                      text: 'Attachment:',
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: TextView(
                        text: 'ui design project document.pdf',
                        fontWeight: FontWeight.w400,
                        color: Pallets.grey,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ]),
                  borderRadiusGeometry: BorderRadius.zero,
                  vertical: 17),
              SizedBox(height: 10.h),
              ReviewBgCard(
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppImages.wallet),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: TextView(
                                text: 'Job Activity',
                                fontWeight: FontWeight.w700,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ]),
                      SizedBox(height: 23.h),
                      _titleAndValueWidget('Bid', '0 Bids'),
                      SizedBox(height: 16.h),
                      _titleAndValueWidget('Interviewing', '0 Interviews'),
                      SizedBox(height: 16.h),
                      _titleAndValueWidget('Date Created', '21/09/2021'),
                    ],
                  ),
                  borderRadiusGeometry: BorderRadius.zero,
                  vertical: 17),
              SizedBox(height: 10.h),
              ReviewBgCard(
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'About Client',
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: Pallets.primary100,
                              radius: 20.r),
                          SizedBox(width: 8.w),
                          Expanded(
                              child: TextView(
                                  text: 'Daniel James',
                                  fontWeight: FontWeight.w700,
                                  textAlign: TextAlign.left)),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      _titleAndValueWidget('Location', 'Abuja, Nigeria'),
                      SizedBox(height: 16.h),
                      _titleAndValueWidget('Job Posted', '221'),
                      SizedBox(height: 16.h),
                      _titleAndValueWidget('Rating', '4.8',
                          iconData: Icons.star),
                      SizedBox(height: Utils.getDeviceHeight(context) * .2),
                    ],
                  ),
                  borderRadiusGeometry: BorderRadius.zero,
                  vertical: 17),
            ],
          ),
          BtnWidget(
            showSkip: false,
            iconWidget: SvgPicture.asset(
              AppImages.bookmark,
              color: Pallets.primary100,
            ),
            btnText: 'Submit Job Bid',
            callback: () => PageRouter.gotoWidget(JobDetailsCopy(), context),
            goBack: () => null,
          )
        ],
      ),
    );
  }

  Row _titleAndValueWidget(String title, String value, {IconData? iconData}) {
    return Row(children: [
      Expanded(
        child: TextView(
          text: title,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.left,
          fontSize: 12,
          color: Pallets.mildGrey,
        ),
      ),
      Spacer(),
      iconData != null
          ? Icon(iconData, color: Pallets.primary100)
          : Container(),
      TextView(
        text: value,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.right,
        fontSize: 12,
        color: Pallets.mildGrey,
      ),
    ]);
  }
}
