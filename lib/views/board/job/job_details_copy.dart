import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/onboarding/profile/widget/button_widget.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class JobDetailsCopy extends StatelessWidget {
  const JobDetailsCopy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
      body: BodyWidget(
          child: Stack(
        children: [
          ListView(
            children: [
              TextView(
                text: 'UI Redesign for Web Application',
                textOverflow: TextOverflow.ellipsis,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
              SizedBox(height: 16.h),
              TextView(
                text:
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu diam duis vitae cursus libero nec. Vitae vestibulum convallis blandit euismod vitae et quisque lacus magna. Ut sit diam sed pellentesque posuere. Dignissim integer posuere vehicula amet eget purus. Nisl massa sed lacus, semper sit amet sed. Arcu phasellus mattis enim sit sed. Et nullam sit ac lectus gravida ornare ut. Sem auctor viverra netus morbi.\n\nArcu phasellus mattis enim sit sed. Et nullam sit ac lectus gravida ornare ut. Sem auctor viverra netus morbi.''',
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 43.h),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        ImageLoader(path: AppImages.credit_card),
                        TextView(
                          text: '₦150,000',
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                        ),
                      ]),
                      Row(children: [
                        ImageLoader(path: AppImages.bids),
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
                        ImageLoader(path: AppImages.hour_glass),
                        TextView(
                          text: '4 Weeks',
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                        ),
                      ]),
                      Row(children: [
                        ImageLoader(path: AppImages.star),
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
              SizedBox(height: 50.h),
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
                          onPressed: () => null)),
                  SizedBox(width: 18.w),
                  Expanded(
                      child: ButtonWidget(
                          radius: 10,
                          buttonStyle: true,
                          color: Pallets.grey,
                          borderColor: Pallets.grey,
                          primary: Colors.transparent,
                          buttonText: 'Project Completion',
                          onPressed: () => null)),
                ],
              ),
              SizedBox(height: 48.h),
              Row(children: [
                ImageLoader(path: AppImages.hour_glass),
                TextView(
                  text: 'Milestone',
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                ),
              ]),
              SizedBox(height: 16.h),
              EditFormField(label: 'Milestone description'),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(child: EditFormField(label: 'Due Date')),
                  SizedBox(width: 7.w),
                  Expanded(child: EditFormField(label: 'Amount (NGN)')),
                ],
              ),
              SizedBox(height: 48.h),
              Row(children: [
                ImageLoader(path: AppImages.hour_glass),
                TextView(
                  text: 'Details',
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                ),
              ]),
              SizedBox(height: 16.h),
              EditFormField(height: 117.h, label: 'Type here...'),
              SizedBox(height: 48.h),
              Row(children: [
                ImageLoader(path: AppImages.attach),
                TextView(
                  text: 'Attachment:',
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                ),
              ]),
              SizedBox(height: 16.h),
              ButtonWidget(
                  radius: 10,
                  buttonStyle: true,
                  color: Pallets.grey,
                  primary: Colors.transparent,
                  buttonText: 'Add Attachment',
                  onPressed: () => null)
            ],
          ),
          BtnWidget(
            height: 100,
            showSkip: false,
            iconWidget: SvgPicture.asset(
              AppImages.bookmark,
              color: Pallets.primary100,
            ),
            btnText: 'Bid The Bid',
            callback: () => null,
            goBack: () => null,
          )
        ],
      )),
    );
  }
}
