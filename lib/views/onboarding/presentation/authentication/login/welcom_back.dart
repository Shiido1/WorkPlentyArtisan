import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/domain/entity/login_entity.dart';
import 'package:artisan/views/onboarding/presentation/authentication/register/get_started_screen.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../email_verification.dart';
import '../forgot_password.dart';
import 'bloc/login_bloc.dart';

class WelcomeBackScreen extends StatefulWidget {
  WelcomeBackScreen({Key? key}) : super(key: key);

  @override
  _WelcomeBackScreenState createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  final _bloc = LoginBloc(inject());
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  bool _togglePassword = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: BodyWidget(
        child: Form(
          key: _formKey,
          child: BlocListener<LoginBloc, LoginState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is LoginLoading) {
                WorkPlenty.showLoading(context, _loadingKey);
              }
              if (state is LoginSuccess) {
                WorkPlenty.hideLoading(_loadingKey);
                logger.d(state.response.toJson());
              }
              if (state is LoginFailed) {
                WorkPlenty.hideLoading(_loadingKey);
                WorkPlenty.error(state.message ?? '');
              }
            },
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
                EditFormField(
                  label: 'Email Address',
                  controller: _emailController,
                  validator: Validators.validateEmail(),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Password',
                  obscureText: _togglePassword,
                  controller: _passwordController,
                  validator: Validators.validatePlainPassword(),
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: _togglePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  onPasswordToggle: () =>
                      setState(() => _togglePassword = !_togglePassword),
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
                ButtonWidget(
                    buttonText: 'Sign in', onPressed: () => _proceed()),
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
                    onPressed: () => PageRouter.gotoWidget(
                        EmailVerificationScreen(), context)),
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
                    onTap: () =>
                        PageRouter.gotoWidget(GetStartedScreen(), context),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _proceed() {
    if (_formKey.currentState!.validate()) {
      _bloc.add(LoginingEvent(
          entity: LoginEntity(
              email: _emailController.text,
              password: _passwordController.text)));
    }
  }
}
