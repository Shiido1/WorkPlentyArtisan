import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:country_picker/country_picker.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';
import 'package:artisan/views/onboarding/presentation/authentication/login/welcom_back.dart';
import 'package:artisan/views/onboarding/presentation/profile/profile_setup.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/register_bloc.dart';

class GetStartedScreen extends StatefulWidget {
  GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final _bloc = RegisterBloc(inject());
  final _loadingKey = GlobalKey<FormState>();
  final _globalFormKey = GlobalKey<FormState>();
  bool _togglePassword = true;

  final _fnController = TextEditingController();
  final _lnController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  Country? _country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: BodyWidget(
        child: Form(
          key: _globalFormKey,
          child: BlocListener<RegisterBloc, RegisterState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is RegisterLoading) {
                WorkPlenty.showLoading(context, _loadingKey);
              }
              if (state is RegisterSuccess) {
                WorkPlenty.hideLoading(_loadingKey);
                logger.d(state.response.toJson());
              }
              if (state is RegisterFailed) {
                WorkPlenty.hideLoading(_loadingKey);
                WorkPlenty.error(state.message ?? '');
              }
            },
            child: ListView(
              children: [
                TextView(
                  text: 'Get Started',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                TextView(
                  text:
                      'Create an account and find projects you are excited to work on 2x faster on WorkPlenty.',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 30.h),
                EditFormField(
                  label: 'First Name',
                  controller: _fnController,
                  validator: Validators.validateString(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Last Name',
                  controller: _lnController,
                  validator: Validators.validateString(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Username',
                  controller: _usernameController,
                  validator: Validators.validateString(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Email Address',
                  controller: _emailController,
                  validator: Validators.validateEmail(),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  validator: Validators.validatePhone(),
                  keyboardType: TextInputType.phone,
                  prefixWidget: GestureDetector(
                    onTap: () => showCountryPicker(
                      context: context,
                      countryListTheme: const CountryListThemeData(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        setState(() => _country = country);
                      },
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextView(
                              text: _country?.countryCode ?? 'NG',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Pallets.grey900,
                              textAlign: TextAlign.center),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Pallets.grey900,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Password',
                  controller: _passwordController,
                  obscureText: _togglePassword,
                  suffixIcon: _togglePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  onPasswordToggle: () =>
                      setState(() => _togglePassword = !_togglePassword),
                  validator: Validators.validatePlainPassword(),
                ),
                SizedBox(height: 18.h),
                ButtonWidget(
                    buttonText: 'Continue', onPressed: () => _proceed()),
                SizedBox(height: 57.h),
                Wrap(alignment: WrapAlignment.center, children: [
                  TextView(
                      text: 'By signing up, you’re agreeing to our ',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  TextView(
                      text: 'Terms of Use',
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                  TextView(
                      text: ' and ', fontSize: 14, fontWeight: FontWeight.w400),
                  TextView(
                      text: 'Privacy Policy',
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ]),
                SizedBox(height: 24.h),
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
                    onPressed: () =>
                        PageRouter.gotoWidget(SetUpProfile(), context)),
                SizedBox(height: 18.h),
                ButtonWidget(
                    buttonText: 'Continue with Meta',
                    buttonStyle: true,
                    color: Pallets.primary150,
                    primary: Pallets.skyBlue,
                    borderColor: Pallets.skyBlue,
                    icon: AppImages.meta,
                    onPressed: () {}),
                SizedBox(height: 16.h),
                Wrap(alignment: WrapAlignment.center, children: [
                  TextView(
                      text: 'Already on WorkPlenty? ',
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  TextView(
                    text: 'Sign in',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    onTap: () =>
                        PageRouter.gotoWidget(WelcomeBackScreen(), context),
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
    if (_globalFormKey.currentState!.validate()) {
      _bloc.add(RegisteringEvent(
          entity: RegisterEntity(
              email: _emailController.text,
              fname: _fnController.text,
              lname: _lnController.text,
              phone: '${_country?.phoneCode ?? '+234'}${_phoneController.text}',
              password: _passwordController.text)));
    }
  }
}
