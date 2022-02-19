import 'package:artisan/views/board/presentation/profile/presentation/request/domain/entity/request_entity.dart';
import 'package:artisan/views/board/presentation/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'stateManagers/provider/request_provider.dart';
import 'tabs/home.dart';
import 'tabs/live.dart';

class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<RequestProvider>(context, listen: false)
        .fetchAllRequests(entity: RequestEntity());
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
