import 'package:artisan/views/board/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tabs/live.dart';
import 'tabs/home.dart';

class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getCustomAppBar(context, 'Requests',
            showLeading: true,
            showMenu: false,
            bottom: TabBar(
              tabs: [
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('Live Consultancy')),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('Home Service')),
              ],
            )),
        body: TabBarView(
          children: [
            LiveTab(),
            HomeTab(),
          ],
        ),
      ),
    );
  }
}
