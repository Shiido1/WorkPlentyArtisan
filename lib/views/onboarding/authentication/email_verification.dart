import 'dart:async';

import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailVerificationScreen extends StatefulWidget {
  EmailVerificationScreen({Key? key}) : super(key: key);

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
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            TextView(
              text:
                  'Hi John, check your mail. We’ve sent you the PIN at johndoe@workplenty.com',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 84.h),
            Form(
              key: formKey,
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                obscureText: false,
                obscuringCharacter: '*',

                blinkWhenObscuring: true,
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
                  selectedColor: Pallets.primary100,
                  selectedFillColor: Colors.transparent,
                  activeColor: Pallets.primary100,
                  activeFillColor: Colors.transparent,
                  inactiveFillColor: Colors.transparent,
                  inactiveColor: Pallets.primary100,
                ),
                cursorColor: Colors.black,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                boxShadows: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onCompleted: (v) {
                  print("Completed");
                },
                // onTap: () {
                //   print("Pressed");
                // },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
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
            SizedBox(height: 18.h),
            ButtonWidget(
                buttonText: 'Verify now',
                onPressed: () => WorkPlenty.showSuccessDialog(
                    context, _loadingKey,
                    image: AppImages.smiling,
                    title: 'Check your Mail',
                    message:
                        'We have sent a password recovery instruction to your mail',
                    btnText: 'Open Email App')),
            SizedBox(height: 43.h),
            Wrap(alignment: WrapAlignment.center, children: [
              TextView(
                  text: 'Didn’t recieve any code? ',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
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
