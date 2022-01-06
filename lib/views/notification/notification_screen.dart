import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          leadingWidget: IconButton(
              color: Pallets.white, onPressed: () {}, icon: Icon(Icons.clear)),
          centerTitle: true,
          title: 'Notification',
          textColor: Pallets.white),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            ...[1, 2, 2, 2, 2, 4, 1, 2, 2, 2, 2, 4]
                .map(
                  (notification) => CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.w, vertical: 11.h),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5.r),
                          border:
                              Border.all(color: Pallets.grey.withOpacity(.2))),
                      child: TextView(
                        text:
                            'NGN 5000, Pending earning from Live Consultancy with Daniel James',
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        fontWeight: FontWeight.w400,
                        color: Pallets.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
