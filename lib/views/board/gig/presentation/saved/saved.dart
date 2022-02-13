import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/gig/presentation/widget/custom_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tabs/freelance.dart';
import 'tabs/service.dart';

class Saved extends StatelessWidget {
  final Widget? widget;
  const Saved({this.widget, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: getCustomAppBar(context, 'Saved',
            bottom: TabBar(
              tabs: [
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextView(
                      text: 'Freelance',
                      color: Pallets.white,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextView(
                      text: 'Home Service',
                      color: Pallets.white,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextView(
                      text: 'Live Consultancy',
                      color: Pallets.white,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    )),
              ],
            )),
        body: TabBarView(
          children: [FreelanceTab(), ServiceTab(), ServiceTab()],
        ),
      ),
    );
  }
}
