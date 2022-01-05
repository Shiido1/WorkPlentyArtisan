import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/onboarding/authentication/get_started_screen.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'email_verification.dart';
import 'forgot_password.dart';

class WelcomeBackScreen extends StatefulWidget {
  WelcomeBackScreen({Key? key}) : super(key: key);

  @override
  _WelcomeBackScreenState createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: BodyWidget(
        child: ListView(
          children: [
            TextView(
              text: 'Welcome Back',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            TextView(
              text: 'Signin to your account.',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 30.h),
            EditFormField(label: 'Email Address'),
            SizedBox(height: 18.h),
            EditFormField(
              label: 'Password',
              obscureText: true,
              suffixIcon: Icons.visibility_outlined,
            ),
            SizedBox(height: 12.h),
            TextView(
                text: 'Forget Password ?',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                onTap: () =>
                    PageRouter.gotoWidget(ForgotPasswordScreen(), context),
                textAlign: TextAlign.right),
            SizedBox(height: 19.h),
            ButtonWidget(buttonText: 'Sign in', onPressed: () {}),
            SizedBox(height: 57.h),
            Row(
              children: [
                Expanded(flex: 3, child: Divider()),
                Expanded(
                    child: TextView(
                  text: 'OR',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                )),
                Expanded(flex: 3, child: Divider()),
              ],
            ),
            SizedBox(height: 18.h),
            ButtonWidget(
                buttonText: 'Continue with Google',
                buttonStyle: true,
                color: Pallets.primary150,
                primary: Pallets.skyBlue,
                borderColor: Pallets.skyBlue,
                icon: AppImages.google,
                onPressed: () {}),
            SizedBox(height: 18.h),
            ButtonWidget(
                buttonText: 'Continue with Meta',
                buttonStyle: true,
                color: Pallets.primary150,
                primary: Pallets.skyBlue,
                borderColor: Pallets.skyBlue,
                icon: AppImages.meta,
                onPressed: () =>
                    PageRouter.gotoWidget(EmailVerificationScreen(), context)),
            SizedBox(height: 16.h),
            Wrap(alignment: WrapAlignment.center, children: [
              TextView(
                  text: 'Not on WorkPlenty? ',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              TextView(
                text: 'Sign up',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                onTap: () => PageRouter.gotoWidget(GetStartedScreen(), context),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
