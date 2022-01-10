import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/custom_switch.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ConnectedAccounts extends StatefulWidget {
  ConnectedAccounts({Key? key}) : super(key: key);

  @override
  _ConnectedAccountsState createState() => _ConnectedAccountsState();
}

class _ConnectedAccountsState extends State<ConnectedAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: defaultAppBar2(context,
          title: 'Connected Accounts',
          centerTitle: true,
          textColor: Pallets.white),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImages.google),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextView(
                          text: 'Google',
                          fontWeight: FontWeight.w700,
                          textOverflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left),
                      TextView(
                          text: 'helloworkplenty@gmail.com',
                          fontWeight: FontWeight.w400,
                          textOverflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left),
                      SizedBox(height: 8.h),
                      TextView(
                          text: 'This account is used to sign in ',
                          fontWeight: FontWeight.normal,
                          textOverflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                CustomSwitch(onChanged: (value) {}, value: true)
              ],
            )
          ],
        ),
      ),
    );
  }
}
