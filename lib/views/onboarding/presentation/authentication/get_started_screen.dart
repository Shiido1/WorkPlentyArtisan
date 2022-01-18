import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/routes/routes.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';
import 'package:artisan/views/onboarding/presentation/authentication/bloc/register_bloc.dart';
import 'package:artisan/views/onboarding/presentation/authentication/welcom_back.dart';
import 'package:artisan/views/onboarding/presentation/profile/profile_setup.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedScreen extends StatefulWidget {
  GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final _bloc = RegisterBloc(inject());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: BodyWidget(
        child: BlocListener<RegisterBloc, RegisterState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is RegisterLoading) {}
            if (state is RegisterSuccess) {}
            if (state is RegisterFailed) {}
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
              EditFormField(label: 'First Name'),
              SizedBox(height: 18.h),
              EditFormField(label: 'Last Name'),
              SizedBox(height: 18.h),
              EditFormField(label: 'Username'),
              SizedBox(height: 18.h),
              EditFormField(label: 'Email Address'),
              SizedBox(height: 18.h),
              EditFormField(label: 'Phone Number'),
              SizedBox(height: 18.h),
              EditFormField(
                label: 'Password',
                obscureText: true,
                suffixIcon: Icons.visibility_outlined,
              ),
              SizedBox(height: 18.h),
              ButtonWidget(buttonText: 'Continue', onPressed: () => _proceed()),
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
    );
  }

  void _proceed() {
    _bloc.add(RegisteringEvent(
        entity: RegisterEntity(
      email: faker.internet.freeEmail(),
      fname: faker.person.firstName(),
      lname: faker.person.lastName(),
      phone: '+2347036331480',
      password: faker.person.name(),
    )));
  }
}
