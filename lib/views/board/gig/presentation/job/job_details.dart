import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:artisan/views/board/gig/presentation/stateManagers/bloc/gig_bloc.dart';
import 'package:artisan/views/board/gig/presentation/stateManagers/provider/gig_provider.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/button_widget.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/skills_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'job_details_copy.dart';

final _bloc = GigBloc(inject());

class JobDetails extends StatelessWidget {
  const JobDetails({Key? key}) : super(key: key);
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
        body: BlocListener<GigBloc, GigState>(
          bloc: _bloc,
          listener: (context, state) {},
          child: Consumer<GigProvider>(
            builder: (context, gigProvider, child) {
              return Stack(
                children: [
                  Scrollbar(
                    isAlwaysShown: true,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ReviewBgCard(
                            TextView(
                              text: gigProvider.datum?.title ?? '',
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
                              text: gigProvider.datum?.description ?? '',
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
                                        text: Utils.currency(
                                            gigProvider.datum?.totalBudget ??
                                                0),
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left,
                                      ),
                                    ]),
                                    SizedBox(height: 15.h),
                                    Row(children: [
                                      SvgPicture.asset(AppImages.bids),
                                      SizedBox(width: 5.h),
                                      TextView(
                                        text: 'Bids',
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
                                        text: gigProvider.datum?.timeline ?? '',
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left,
                                      ),
                                    ]),
                                    SizedBox(height: 15.h),
                                    Row(children: [
                                      SvgPicture.asset(AppImages.star),
                                      SizedBox(width: 5.h),
                                      TextView(
                                        text: '',
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
                              children: gigProvider.datum!.skills!
                                  .map((skill) => SkillsWidget(skill))
                                  .toList(),
                            ),
                            borderRadiusGeometry: BorderRadius.zero,
                            vertical: 23),
                        SizedBox(height: 23.h),
                        ReviewBgCard(
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                _titleAndValueWidget(
                                    'Interviewing', '0 Interviews'),
                                SizedBox(height: 16.h),
                                _titleAndValueWidget(
                                    'Date Created', '21/09/2021'),
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
                                    CircularImage(
                                      path: gigProvider.datum?.user?.avatar,
                                      radius: 20.r,
                                    ),
                                    SizedBox(width: 8.w),
                                    Expanded(
                                        child: TextView(
                                            text:
                                                '${gigProvider.datum?.user?.firstName ?? ''} ${gigProvider.datum?.user?.lastName ?? ''}',
                                            fontWeight: FontWeight.w700,
                                            textAlign: TextAlign.left)),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                _titleAndValueWidget(
                                    'Location', 'Abuja, Nigeria'),
                                SizedBox(height: 16.h),
                                _titleAndValueWidget('Job Posted', '221'),
                                SizedBox(height: 16.h),
                                _titleAndValueWidget('Rating', '4.8',
                                    iconData: Icons.star),
                                SizedBox(
                                    height:
                                        Utils.getDeviceHeight(context) * .2),
                              ],
                            ),
                            borderRadiusGeometry: BorderRadius.zero,
                            vertical: 17),
                      ],
                    ),
                  ),
                  BtnWidget(
                    showSkip: false,
                    iconWidget: SvgPicture.asset(
                      AppImages.bookmark,
                      color: Pallets.primary100,
                    ),
                    btnText: 'Submit Job Bid',
                    callback: () =>
                        PageRouter.gotoWidget(JobDetailsCopy(), context),
                    goBack: () {
                      WorkPlenty.success('Saved successfully!');
                      _bloc.add(SaveGigEvent(
                          GigEntity(id: '${gigProvider.datum?.id}')));
                    },
                  )
                ],
              );
            },
          ),
        ));
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
