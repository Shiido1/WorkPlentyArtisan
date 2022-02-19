import 'package:artisan/core/database/session_manager.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/routes/routes.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/views/board/presentation/payout/payout.dart';
import 'package:artisan/views/board/presentation/profile/presentation/stateManagers/provider/profile_provider.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'bids/presentation/bids.dart';
import 'edit_profile.dart';
import 'manage/manage.dart';
import 'request/presentation/requests.dart';
import 'statistics/statistics.dart';
import 'widget/clicks_one.dart';
import 'widget/profile_image_one.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false).getMyProfile();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImageCardOne(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      Expanded(
                        child: ClickOne(
                            image: AppImages.edit_profile,
                            text: 'Edit Profile',
                            onTap: () =>
                                PageRouter.gotoWidget(EditProfile(), context)),
                      ),
                      SizedBox(width: 44.w),
                      Expanded(
                        child: ClickOne(
                            image: AppImages.share, text: 'Share Profile'),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  TextView(
                      text: 'Quick Links',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.bid_two,
                      text: 'Bids',
                      trailing: true,
                      onTap: () => PageRouter.gotoWidget(Bids(), context)),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.request,
                      text: 'Requests',
                      trailing: true,
                      onTap: () => PageRouter.gotoWidget(Requests(), context)),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.statistics,
                      text: 'Statistics',
                      trailing: true,
                      onTap: () =>
                          PageRouter.gotoWidget(Statistics(), context)),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.payout,
                      text: 'Payout',
                      trailing: true,
                      onTap: () => PageRouter.gotoWidget(Payouts(), context)),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.manage,
                      text: 'Manage Account',
                      trailing: true,
                      onTap: () =>
                          PageRouter.gotoWidget(ManageProfile(), context)),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.logout,
                      text: 'Logout',
                      trailing: true,
                      onTap: () async {
                        await SessionManager.instance.logOut();
                        PageRouter.gotoNamed(Routes.intro, context,
                            clearStack: true);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
