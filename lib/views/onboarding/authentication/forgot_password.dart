import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'reset_password.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: BodyWidget(
        child: ListView(
          children: [
            TextView(
              text: 'Forget Password',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            TextView(
              text:
                  'Type in your email address below and we will send you instructions on how to reset your password.',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 30.h),
            EditFormField(label: 'Email Address'),
            SizedBox(height: 18.h),
            ButtonWidget(
                buttonText: 'Send Instructions',
                onPressed: () =>
                    PageRouter.gotoWidget(ResetPasswordScreen(), context)),
            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }
}
