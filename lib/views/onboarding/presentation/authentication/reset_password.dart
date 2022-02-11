// ignore_for_file: unused_field

import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/routes/routes.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/views/onboarding/domain/entity/auth_entity.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/utils/workplenty_dialog.dart';
import 'bloc/authbloc_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String? email;
  ResetPasswordScreen(this.email, {Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _pinController = TextEditingController();
  bool _togglePassword = true;
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
              PageRouter.gotoNamed(Routes.login, context);
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
                  label: 'PIN',
                  controller: _pinController,
                  validator: Validators.validateInt(),
                  keyboardType: TextInputType.number,
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
                SizedBox(height: 18.h),
                ButtonWidget(
                    buttonText: 'Reset password', onPressed: () => _proceed()),
                SizedBox(height: 18.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _proceed() {
    // PageRouter.gotoWidget(WelcomeBackScreen(), context);
    if (_formKey.currentState!.validate()) {
      _bloc.add(ResetPasswordEvent(AuthEntity(
          email: widget.email,
          pin: _pinController.text,
          password: _passwordController.text)));
    }
  }
}
