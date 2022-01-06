import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/widget/card_widget.dart';
import 'package:artisan/views/notification/notification_screen.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          backgroundColor: Pallets.primary100,
          leadingWidth: 70,
          leadingWidget:
              ImageLoader(path: AppImages.whiteLogo, height: 24.h, width: 24.w),
          centerTitle: true,
          title: 'Dashboard',
          textColor: Pallets.white,
          actions: [
            Container(
                margin: EdgeInsets.only(right: 16.w),
                child: ImageLoader(
                  path: AppImages.bell,
                  onTap: () =>
                      PageRouter.gotoWidget(NotificationScreen(), context),
                ))
          ]),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextView(
                      text: '4500 Jobs Found',
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    TextView(
                        text: 'Sort:',
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600),
                    SizedBox(width: 5.w),
                    TextView(
                        text: 'Recent',
                        maxLines: 1,
                        color: Pallets.grey,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.h),
            ...[1, 2, 2, 2, 2, 2, 3].map((_) => CardWidget()).toList()
          ],
        ),
      ),
    );
  }
}
