import 'dart:async';

import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/presentation/profile/profile_setup.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String? email;

  EmailVerificationScreen(this.email, {Key? key}) : super(key: key);

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _loadingKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: BodyWidget(
        child: ListView(
          children: [
            TextView(
              text: 'Verification',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              letterSpacing: -0.33,
            ),
            SizedBox(height: 4.h),
            TextView(
              text:
                  'Hi John, check your mail. We’ve sent you the PIN at ${widget.email}',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.33,
            ),
            SizedBox(height: 84.h),
            Form(
              key: formKey,
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 3) {
                    return "";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 58,
                    fieldWidth: 58,
                    borderWidth: 1,
                    selectedColor: Pallets.primary100,
                    selectedFillColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    activeFillColor: Theme.of(context).scaffoldBackgroundColor,
                    inactiveFillColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    activeColor: Pallets.primary100,
                    inactiveColor: Pallets.primary100),
                cursorColor: Colors.black,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() => currentText = value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                hasError ? "*Please fill up all the cells properly" : "",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 40.h),
            ButtonWidget(
                buttonText: 'Verify now',
                onPressed: () => WorkPlenty.showSuccessDialog(
                    context, _loadingKey,
                    image: AppImages.successfullyVerified,
                    title: 'Verification Complete',
                    message:
                        'You’ve successfully verified your account. Find Artisans & Clients now!',
                    btnText: 'Continue',
                    next: () =>
                        PageRouter.gotoWidget(SetUpProfile(), context))),
            SizedBox(height: 43.h),
            Wrap(alignment: WrapAlignment.center, children: [
              TextView(
                text: 'Didn’t recieve any code? ',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              TextView(
                  text: 'Resend Code',
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ]),
            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }
}
