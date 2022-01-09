import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/profile/widget/clicks_two.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreDrawerWidget extends StatelessWidget {
  const ExploreDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          ReviewBgCard(
            Padding(
              padding: EdgeInsets.symmetric(vertical: 23.h),
              child: Row(
                children: [
                  Expanded(
                      child: TextView(
                    text: 'Filter',
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.left,
                  )),
                  Expanded(
                      child: TextView(
                    text: 'Clear',
                    color: Pallets.grey,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.right,
                  ))
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Job Type',
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    TextView(
                      text: 'Freelance',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    TextView(
                      text: 'Live Consultancy',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    TextView(
                      text: 'Home Service',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 23.h),
          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Experience',
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: false,
                            onChanged: (bool? value) {}),
                        Expanded(
                          child: TextView(
                            text: 'Entry',
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: false,
                                onChanged: (bool? value) {}),
                            Expanded(
                              child: TextView(
                                text: 'Intermediate',
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: false,
                            onChanged: (bool? value) {}),
                        Expanded(
                          child: TextView(
                            text: 'Mid-level',
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: false,
                                onChanged: (bool? value) {}),
                            Expanded(
                              child: TextView(
                                text: 'Expert',
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 23.h),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextView(
                  text: 'Skills',
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8.h),
                Wrap(
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
              ],
            ),
          ),
          SizedBox(height: 23.h),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextView(
                  text: 'Price Range',
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Expanded(child: EditFormField(hint: 'NGN Min')),
                    SizedBox(width: 32.w),
                    Expanded(child: EditFormField(hint: 'NGN Max')),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
