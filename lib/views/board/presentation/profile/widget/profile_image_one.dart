import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/notification/notification_screen.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileImageCardOne extends StatelessWidget {
  const ProfileImageCardOne({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w, bottom: 16.w),
      decoration: new BoxDecoration(
          color: Pallets.primary100,
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new AssetImage(AppImages.union),
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageLoader(path: AppImages.whiteLogo, height: 24.h, width: 24.w),
              TextView(
                  text: 'Profile',
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Pallets.white,
                  textAlign: TextAlign.center),
              ImageLoader(
                path: AppImages.bell,
                onTap: () =>
                    PageRouter.gotoWidget(NotificationScreen(), context),
              )
            ],
          ),
          SizedBox(height: 55.h),
          CircleAvatar(radius: 60.r),
          SizedBox(height: 16.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextView(
                  text: 'Daniel James',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Pallets.white,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Pallets.white)),
                child: TextView(
                    text: 'Artisan',
                    fontWeight: FontWeight.w400,
                    color: Pallets.white,
                    fontSize: 8,
                    textAlign: TextAlign.center),
              )
            ],
          ),
          SizedBox(height: 18.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppImages.map),
              SizedBox(width: 4.w),
              TextView(
                  text: 'Abuja, Nigeria',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Pallets.grey100,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left),
            ],
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
