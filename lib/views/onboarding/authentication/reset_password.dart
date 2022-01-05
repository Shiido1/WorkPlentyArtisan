import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _loadingKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: BodyWidget(
        child: ListView(
          children: [
            TextView(
              text: 'Reset Password',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            TextView(
              text:
                  'Your new password must be different from previous used password',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 30.h),
            EditFormField(
              label: 'Password',
              obscureText: true,
              suffixIcon: Icons.visibility_outlined,
            ),
            SizedBox(height: 18.h),
            EditFormField(
              label: 'Confirm Password',
              obscureText: true,
              suffixIcon: Icons.visibility_outlined,
            ),
            SizedBox(height: 18.h),
            ButtonWidget(
                buttonText: 'Reset password',
                onPressed: () => WorkPlenty.showSuccessDialog(
                    context, _loadingKey,
                    image: AppImages.smiling,
                    title: 'Check your Mail',
                    message:
                        'We have sent a password recovery instruction to your mail',
                    btnText: 'Open Email App')),
            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }
}
