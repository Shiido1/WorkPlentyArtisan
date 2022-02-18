import 'package:artisan/views/board/presentation/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tabs/bid.dart';
import 'tabs/interview.dart';

class Bids extends StatelessWidget {
  const Bids({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getCustomAppBar(context, 'Bid',
            showLeading: true,
            bottom: TabBar(
              tabs: [
                Container(
                    margin: EdgeInsets.only(bottom: 10.h), child: Text('Bid')),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('Interview')),
              ],
            )),
        body: TabBarView(
          children: [
            BidTab(),
            Container()
            // InterviewTab(),
          ],
        ),
      ),
    );
  }
}
