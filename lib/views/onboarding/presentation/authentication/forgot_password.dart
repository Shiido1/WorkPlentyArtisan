// ignore_for_file: unused_field

import 'package:artisan/core/di/injector.dart';
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

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _bloc = AuthblocBloc(inject());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context),
        body: BlocListener<AuthblocBloc, AuthblocState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is AuthblocLoading) {
              WorkPlenty.showLoading(context, _loadingKey, '');
            }
            if (state is AuthblocSuccess) {
              WorkPlenty.hideLoading(_loadingKey);
              // PageRouter.gotoNamed(Routes.forgotPassword, context,
              //     args: _emailController.text);
            }
            if (state is AuthblocFailed) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.error(state.message);
            }
          },
          child: BodyWidget(
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextView(
                    text: 'Forgot Password',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 4.h),
                  TextView(
                    text:
                        'Type in your email address below and we will send you instructions on how to reset your password.',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 29.h),
                  EditFormField(
                    label: 'Email Address',
                    controller: _emailController,
                    validator: Validators.validateEmail(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 24.h),
                  ButtonWidget(
                      buttonText: 'Send Instructions',
                      onPressed: () => _proceed()),
                  SizedBox(height: 18.h),
                ],
              ),
            ),
          ),
        ));
  }

  void _proceed() {
    if (_formKey.currentState!.validate()) {
      _bloc.add(ForgotPasswordEvent(AuthEntity(email: _emailController.text)));
    }
  }
}
