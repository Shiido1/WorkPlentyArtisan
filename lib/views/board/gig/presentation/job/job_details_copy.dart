import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/routes/routes.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/button_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

final _loadingKey = GlobalKey<FormState>();

class JobDetailsCopy extends StatelessWidget {
  const JobDetailsCopy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: [
                      ImageLoader(path: AppImages.wallet),
                      TextView(
                        text: 'Payment Type',
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.left,
                      ),
                    ]),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                            child: ButtonWidget(
                                radius: 10,
                                buttonText: 'Milestone',
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                fontSize: 12,
                                onPressed: () => null)),
                        SizedBox(width: 18.w),
                        Expanded(
                            child: ButtonWidget(
                                radius: 10,
                                buttonStyle: true,
                                color: Pallets.grey,
                                borderColor: Pallets.grey,
                                primary: Colors.transparent,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                fontSize: 12,
                                buttonText: 'Project Completion',
                                onPressed: () => null)),
                      ],
                    ),
                  ],
                ),
                borderRadiusGeometry: BorderRadius.zero,
                vertical: 17,
              ),
              SizedBox(height: 10.h),
              ReviewBgCard(
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      ImageLoader(path: AppImages.hour_glass),
                      TextView(
                        text: 'Milestone',
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.left,
                      ),
                    ]),
                    SizedBox(height: 10.h),
                    EditFormField(label: 'Milestone description'),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(child: EditFormField(label: 'Due Date')),
                        SizedBox(width: 7.w),
                        Expanded(child: EditFormField(label: 'Amount (NGN)')),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        TextView(
                          text: 'Add Milestone',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          textAlign: TextAlign.left,
                        ),
                        Icon(Icons.add, color: Pallets.primary100)
                      ],
                    )
                  ],
                ),
                borderRadiusGeometry: BorderRadius.zero,
                vertical: 17,
              ),
              SizedBox(height: 10.h),
              ReviewBgCard(
                Row(children: [
                  TextView(
                    text: 'Workplenty Fee',
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: TextView(
                      text: '10% of NGN100,000 = NGN90,000',
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ]),
                borderRadiusGeometry: BorderRadius.zero,
                vertical: 17,
              ),
              SizedBox(height: 10.h),
              ReviewBgCard(
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      ImageLoader(path: AppImages.details),
                      TextView(
                        text: 'Details',
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.left,
                      ),
                    ]),
                    SizedBox(height: 10.h),
                    EditFormField(height: 117.h, label: 'Type here...'),
                  ],
                ),
                borderRadiusGeometry: BorderRadius.zero,
                vertical: 17,
              ),
              SizedBox(height: 10.h),
              ReviewBgCard(
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      ImageLoader(path: AppImages.attach),
                      TextView(
                        text: 'Attachment:',
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.left,
                      ),
                    ]),
                    SizedBox(height: 10.h),
                    ButtonWidget(
                        radius: 10,
                        buttonStyle: true,
                        color: Pallets.grey,
                        fontWeight: FontWeight.w400,
                        primary: Colors.transparent,
                        buttonText: 'Add Attachment',
                        onPressed: () => null),
                    SizedBox(height: Utils.getDeviceHeight(context) * .2),
                  ],
                ),
                borderRadiusGeometry: BorderRadius.zero,
                vertical: 17,
              ),
            ],
          ),
          BtnWidget(
            showSkip: false,
            iconWidget: SvgPicture.asset(
              AppImages.bookmark,
              color: Pallets.primary100,
            ),
            btnText: 'Bid The Bid',
            callback: () => WorkPlenty.showSuccessDialog(context, _loadingKey,
                image: AppImages.blowWhistle,
                title: 'Job Bid Submitted',
                message: 'You’ve successfully submitted your job bid',
                btnText: 'Go Home',
                next: () => PageRouter.gotoNamed(Routes.board, context,
                    clearStack: true)),
            goBack: () => null,
          )
        ],
      ),
    );
  }
}
