import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/domain/entity/forgot_password_entity.dart';
import 'package:artisan/views/onboarding/presentation/authentication/password/bloc/password_bloc.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'reset_password.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _bloc = PasswordBloc(inject(), inject());
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: BodyWidget(
        child: Form(
          key: _formKey,
          child: BlocListener<PasswordBloc, PasswordState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is PasswordLoading) {
                WorkPlenty.showLoading(context, _loadingKey);
              }
              if (state is PasswordSuccess) {
                WorkPlenty.hideLoading(_loadingKey);
                WorkPlenty.success(state.response.msg ?? '');
                PageRouter.gotoWidget(ResetPasswordScreen(), context);
              }
              if (state is PasswordFailed) {
                WorkPlenty.hideLoading(_loadingKey);
                WorkPlenty.error(state.message ?? '');
              }
            },
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
                EditFormField(
                  label: 'Email Address',
                  controller: _emailController,
                  validator: Validators.validateEmail(),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 18.h),
                ButtonWidget(
                    buttonText: 'Send Instructions',
                    onPressed: () => _proceed()),
                SizedBox(height: 18.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _proceed() {
    if (_formKey.currentState!.validate()) {
      _bloc.add(ForgotPasswordEvent(
          entity: ForgotPasswordEntity(email: _emailController.text)));
    }
  }
}
