import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/image_decoration.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          centerTitle: true, textColor: Pallets.white, title: 'Statistics'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            ReviewBgCard(Container()),
            SizedBox(height: 24.h),
            TextView(
              text: 'My Earning',
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w700,
              maxLines: 1,
            ),
            SizedBox(height: 16.h),
            ImageBgCard(Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Personal Balance',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: 'NGN 241,000',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                      text: 'Personal Earning',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: 'NGN 67,000',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextView(
                      text: 'Monthly Balance',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: 'NGN 93,000',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                      text: 'Avg. Monthly',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: 'NGN 83,000',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                  ],
                )),
              ],
            )),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                    child: TextView(
                  text: 'My Earning',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  maxLines: 1,
                )),
                Row(
                  children: [
                    TextView(
                      text: 'Sort: ',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      maxLines: 1,
                    ),
                    TextView(
                        text: 'All',
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                        color: Pallets.grey),
                    Icon(Icons.keyboard_arrow_down, color: Pallets.grey)
                  ],
                )
              ],
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: Pallets.grey)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _row('Job Success Rating', '4.5', star: true),
                  SizedBox(height: 8.h),
                  _row('Job Completed', '103'),
                  SizedBox(height: 8.h),
                  _row('Current Active Job', '2'),
                  SizedBox(height: 8.h),
                  _row('Number of Job Bids', '231'),
                  SizedBox(height: 8.h),
                  _row('Number of Live Consultancy', '76'),
                  SizedBox(height: 8.h),
                  _row('Number of Home Service', '76'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _row(String left, String right, {bool star = false}) {
    return Row(
      children: [
        Expanded(
          child: TextView(
            text: left,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w700,
            maxLines: 1,
          ),
        ),
        Visibility(visible: star, child: Icon(Icons.star, color: Pallets.gold)),
        SizedBox(width: 5.w),
        TextView(
          text: right,
          textAlign: TextAlign.right,
          fontWeight: FontWeight.w700,
          maxLines: 1,
        ),
      ],
    );
  }
}
