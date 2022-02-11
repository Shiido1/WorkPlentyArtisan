import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/routes/routes.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/domain/entity/auth_entity.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/authbloc_bloc.dart';
import 'forgot_password.dart';
import 'get_started_screen.dart';

class WelcomeBackScreen extends StatefulWidget {
  WelcomeBackScreen({Key? key}) : super(key: key);

  @override
  _WelcomeBackScreenState createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  bool _togglePassword = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isTypingPassword = false;
  final _bloc = AuthblocBloc(inject());

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
              PageRouter.gotoNamed(Routes.board, context);
            }
            if (state is AuthblocFailed) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.error(state.message);
            }
          },
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextView(
                  text: 'Welcome Back',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 4.h),
                TextView(
                  text: 'Signin to your account.',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
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
                  onChange: (password) {
                    password.isEmpty
                        ? _isTypingPassword = false
                        : _isTypingPassword = true;
                    setState(() {});
                  },
                  suffixIconColor:
                      _isTypingPassword ? Pallets.primary100 : Pallets.grey,
                  onPasswordToggle: () =>
                      setState(() => _togglePassword = !_togglePassword),
                ),
                SizedBox(height: 12.h),
                TextView(
                    text: 'Forgot Password ?',
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
                    onPressed: () => null),
                SizedBox(height: 16.h),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Wrap(alignment: WrapAlignment.center, children: [
                    TextView(
                        text: 'Not on WorkPlenty? ',
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    TextView(
                      text: 'Sign up',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      onTap: () =>
                          PageRouter.gotoWidget(GetStartedScreen(), context),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _proceed() {
    if (_formKey.currentState!.validate()) {
      _bloc.add(LoginEvent(AuthEntity(
          email: _emailController.text, password: _passwordController.text)));
    }
  }
}
