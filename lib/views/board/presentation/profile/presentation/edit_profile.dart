import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/review/review.dart';
import 'package:artisan/views/widgets/star_rating.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profileUpdate/bio_update.dart';
import 'widget/clicks_two.dart';
import 'widget/profile_image_two.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImageCardTwo(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                ClickTwo(
                    radius: 0,
                    padding:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 23.w),
                    image: AppImages.edit_circle,
                    text: 'Profile Bio',
                    widget: TextView(
                        textAlign: TextAlign.left,
                        color: Pallets.primary150,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        text:
                            '''Web Developer & Mobile Developer\nLorem ipsum dolor sit amet, consectetur adipiscing\nelit. Euismod eu eu erat nisl consectetur adipiscing.'''),
                    onTap: () => PageRouter.gotoWidget(UpdateBio(), context)),
                SizedBox(height: 30.h),
                ClickTwo(
                    radius: 0,
                    padding:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 23.w),
                    image: AppImages.edit_circle,
                    text: 'Skills',
                    widget: Wrap(
                        runAlignment: WrapAlignment.spaceBetween,
                        spacing: 10,
                        runSpacing: 10,
                        children: ["Vue Js", "MySQL"]
                            .map((e) => Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 23.w, vertical: 6.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Pallets.primary100,
                                  ),
                                  child: TextView(
                                      textAlign: TextAlign.left,
                                      text: e,
                                      color: Pallets.white),
                                ))
                            .toList()),
                    onTap: () {}),
                SizedBox(height: 30.h),
                ClickTwo(
                    radius: 0,
                    padding:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 23.w),
                    image: AppImages.edit_circle,
                    text: 'Education',
                    widget: TextView(
                        textAlign: TextAlign.left,
                        color: Pallets.primary150,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        text:
                            '''University of Ibadan\nIndustrial Mathematics | 2019 - Till Date'''),
                    onTap: () {}),
                SizedBox(height: 30.h),
                ClickTwo(
                    radius: 0,
                    padding:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 23.w),
                    image: AppImages.edit_circle,
                    text: 'Work History',
                    widget: TextView(
                        textAlign: TextAlign.left,
                        color: Pallets.primary150,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        text:
                            '''WorkPlenty\nSoftware Engineer | 2021 - Till Date'''),
                    onTap: () {}),
                SizedBox(height: 30.h),
                ClickTwo(
                    radius: 0,
                    padding:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 23.w),
                    image: AppImages.edit_circle,
                    text: 'Projects',
                    widget: Row(
                      children: [
                        Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Pallets.black),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: TextView(
                              textAlign: TextAlign.left,
                              color: Pallets.primary150,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              maxLines: 3,
                              textOverflow: TextOverflow.ellipsis,
                              text:
                                  '''WorkPlenty\nLorem ipsum dolor sit amet consectetur
adipiscing elit euismod eu eu erat..... more'''),
                        ),
                      ],
                    ),
                    onTap: () {}),
                SizedBox(height: 30.h),
                ClickTwo(
                    radius: 0,
                    padding:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 23.w),
                    image: AppImages.edit_circle,
                    text: 'Availability & Rate',
                    widget: TextView(
                        textAlign: TextAlign.left,
                        color: Pallets.primary150,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        text:
                            '''Home Service:  NGN3000/hr\nLive Consultancy:  NGN1500/5min'''),
                    onTap: () {}),
                SizedBox(height: 30.h),
                ClickTwo(
                    radius: 0,
                    padding:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 23.w),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    text: 'Ratings',
                    widget: TextView(
                        textAlign: TextAlign.left,
                        color: Pallets.primary150,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        text:
                            '''Average Rating:  4.7\nTotal Rating:  231\nJobs Completed:  190'''),
                    onTap: () {}),
                SizedBox(height: 30.h),
                ClickTwo(
                    radius: 0,
                    padding:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 23.w),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    text: 'Reviews',
                    widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            StarRating(rating: 4.0, color: Pallets.gold),
                            Expanded(
                              child: TextView(
                                textAlign: TextAlign.right,
                                text: '1 week ago',
                                color: Pallets.primary150,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5.h),
                        TextView(
                            textAlign: TextAlign.left,
                            color: Pallets.primary150,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            text:
                                '''John Doe\nLorem ipsum do whatever i want lol''')
                      ],
                    ),
                    onTap: () => PageRouter.gotoWidget(Review(), context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
