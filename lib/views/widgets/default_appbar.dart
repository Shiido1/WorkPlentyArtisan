import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'text_views.dart';

AppBar defaultAppBar(BuildContext context,
    {String title = '',
    VoidCallback? onTap,
    bool showLeading = true,
    bool showMoreMenu = false,
    bool centerTitle = false,
    double? elevation = 0,
    double? leadingWidth = 90,
    Widget? leadingWidget,
    Color? backgroundColor,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    Widget? titleWidgte,
    bool? showClearButton = true,
    String image = ''}) {
  return AppBar(
    automaticallyImplyLeading: showLeading,
    elevation: elevation,
    centerTitle: centerTitle,
    bottom: bottom,
    leadingWidth: leadingWidth?.w,
    leading: Builder(
      builder: (BuildContext context) {
        return Container(
          width: 60.w,
          child: GestureDetector(
            onTap: () => PageRouter.goBack(context),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: SvgPicture.asset(
                    'assets/svgs/backbtn.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(width: 10.w),
                TextView(text: 'Back', color: Pallets.primary150, fontSize: 16)
              ],
            ),
          ),
        );
      },
    ),
    backgroundColor: Pallets.white,
    iconTheme: IconThemeData(color: Pallets.grey900),
    title: titleWidgte ??
        TextView(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Pallets.grey900,
            textAlign: TextAlign.center),
    actions: actions,
  );
}

AppBar defaultAppBar2(BuildContext context,
    {String title = '',
    VoidCallback? onTap,
    bool showLeading = true,
    bool showMoreMenu = false,
    bool centerTitle = false,
    double? elevation,
    double? leadingWidth = 70,
    Widget? leadingWidget,
    Color? backgroundColor,
    Color? textColor,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    Widget? titleWidgte,
    bool? showClearButton = true,
    Widget? flexibleSpace,
    String image = ''}) {
  return AppBar(
    automaticallyImplyLeading: showLeading,
    elevation: elevation,
    centerTitle: centerTitle,
    bottom: bottom,
    flexibleSpace: flexibleSpace,
    leadingWidth: leadingWidth?.w,
    leading: leadingWidget,
    backgroundColor: backgroundColor,
    iconTheme: IconThemeData(color: Pallets.grey900),
    title: titleWidgte ??
        TextView(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: textColor ?? Theme.of(context).colorScheme.primary,
            textAlign: TextAlign.center),
    actions: actions,
  );
}
