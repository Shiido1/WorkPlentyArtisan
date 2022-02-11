import 'dart:async';

import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/routes/routes.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/domain/entity/auth_entity.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'bloc/authbloc_bloc.dart';

class EmailVerificationScreen extends StatefulWidget {
  final Map? map;

  EmailVerificationScreen(this.map, {Key? key}) : super(key: key);

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
  final _bloc = AuthblocBloc(inject());

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
        child: BlocListener<AuthblocBloc, AuthblocState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is AuthblocLoading) {
              WorkPlenty.showLoading(context, _loadingKey, '');
            }
            if (state is AuthblocSuccess) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.showSuccessDialog(context, _loadingKey,
                  image: AppImages.successfullyVerified,
                  title: 'Verification Complete',
                  message:
                      'You’ve successfully verified your account. Find Artisans & Clients now!',
                  btnText: 'Continue', next: () {
                PageRouter.gotoNamed(Routes.profileSetup, context,
                    clearStack: true, args: widget.map?['name']);
              });
            }
            if (state is AuthblocOTPResendSuccess) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.success(state.response?.msg ?? 'OTP Resent');
            }
            if (state is AuthblocFailed) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.error(state.message);
            }
          },
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
                    'Hi ${widget.map?['name']}, check your mail. We’ve sent you the PIN at ${widget.map?['email']}',
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
                    if (v!.length < 6) {
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
                      activeFillColor:
                          Theme.of(context).scaffoldBackgroundColor,
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              ButtonWidget(
                  buttonText: 'Verify now', onPressed: () => _proceed()),
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
                  fontWeight: FontWeight.w700,
                  onTap: () {
                    _bloc.add(ResendOTPEvent());
                  },
                ),
              ]),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      ),
    );
  }

  void _proceed() {
    if (currentText.length != 6) {
      errorController!.add(ErrorAnimationType.shake);
      hasError = true;
    } else {
      hasError = false;
      _bloc.add(VerifyPinEvent(AuthEntity(pin: currentText)));
    }
    setState(() {});
  }
}
