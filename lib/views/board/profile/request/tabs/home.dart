import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/bottom_sheet.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/star_rating.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ListView(
        children: [
          ...[1]
              .map((_) => Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    child: ReviewBgCard(Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Pallets.primary100,
                        ),
                        SizedBox(width: 8.h),
                        Expanded(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text:
                                  'Daniel James request a live consultancy session',
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.left,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(AppImages.free_session),
                                      SizedBox(width: 4.w),
                                      SizedBox(
                                        width:
                                            Utils.getDeviceWidth(context) * .4,
                                        child: TextView(
                                          text: 'Free Session',
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                          textOverflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    StarRating(starCount: 5, rating: 4.5),
                                    SizedBox(width: 4.w),
                                    TextView(
                                      text: '4.5',
                                      fontWeight: FontWeight.w400,
                                      textAlign: TextAlign.right,
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(AppImages.tag),
                                    SizedBox(width: 4.w),
                                    SizedBox(
                                      width: Utils.getDeviceWidth(context) * .4,
                                      child: TextView(
                                        text: 'Software Installation',
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(AppImages.map),
                                      SizedBox(width: 4.w),
                                      TextView(
                                        text: 'Lekki, Nigeria',
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.right,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(AppImages.calendar),
                                      SizedBox(width: 4.w),
                                      TextView(
                                        text: '24/04/2021 - 4PM',
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 18.h),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      border: Border.all(
                                          color: Pallets.primary100)),
                                  child: TextView(
                                    text: 'Decline',
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                                Spacer(),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () => _showModal(context),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        color: Pallets.primary100),
                                    child: TextView(
                                      text: 'Accept',
                                      fontWeight: FontWeight.w500,
                                      color: Pallets.white,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ))
                              ],
                            )
                          ],
                        ))
                      ],
                    )),
                  ))
              .toList()
        ],
      ),
    );
  }

  _showModal(BuildContext context) {
    BottomSheets.showSheet(context,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 42.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppImages.flat),
              SizedBox(height: 30.h),
              TextView(
                text: 'Daniel James is  waiting for home service at 4PM',
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              ButtonWidget(
                  buttonText: 'Location Routes',
                  onPressed: () {
                    PageRouter.goBack(context);
                  })
            ],
          ),
        ));
  }
}
