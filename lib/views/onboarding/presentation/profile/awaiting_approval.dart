import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/strings.dart';
import 'package:artisan/views/onboarding/presentation/authentication/login/welcom_back.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/stacked_container.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AwaitingApproval extends StatelessWidget {
  const AwaitingApproval({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leadingWidth: 70,
          leadingWidget: IconButton(
              onPressed: () =>
                  PageRouter.gotoWidget(WelcomeBackScreen(), context),
              icon: Icon(Icons.close, color: Pallets.primary100)),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 16.w),
              child: ImageLoader(
                path: AppImages.logo,
                height: 24.h,
                width: 24.w,
              ),
            )
          ],
          centerTitle: true,
          title: 'Awaiting Approval'),
      body: BodyWidget(
        height: 0,
        width: 0,
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                StackedContainer(AppImages.timer),
                SizedBox(height: 16.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Awaiting Verification - 24 hours',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 16.h),
                      TextView(
                        text: AppString.waitingTime,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Pallets.mildGrey,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
