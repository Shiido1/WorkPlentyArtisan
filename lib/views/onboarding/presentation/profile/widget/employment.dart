import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/presentation/profile/bloc/profile_bloc.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_widget.dart';

class EmploymentSheet extends StatefulWidget {
  const EmploymentSheet({Key? key}) : super(key: key);

  @override
  State<EmploymentSheet> createState() => _EmploymentSheetState();
}

class _EmploymentSheetState extends State<EmploymentSheet> {
  final _bloc = ProfileBloc(inject());
  final _loadingKey = GlobalKey<FormState>();

  final _companyController = TextEditingController();
  final _locationController = TextEditingController();
  final _positionController = TextEditingController();
  final _startController = TextEditingController();
  final _throughController = TextEditingController();

  bool? _checked = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is ProfileLoading) {
          WorkPlenty.showLoading(context, _loadingKey, '');
        }
        if (state is ProfileSuccess) {
          WorkPlenty.hideLoading(_loadingKey);
        }
        if (state is ProfileFailed) {
          WorkPlenty.hideLoading(_loadingKey);
          WorkPlenty.error(state.message);
        }
      },
      child: Container(
          height: Utils.getDeviceHeight(context) * .6,
          child: Scaffold(
            appBar: defaultAppBar2(context,
                showLeading: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                centerTitle: true,
                title: 'Add Employment',
                elevation: 1),
            body: Padding(
              padding: EdgeInsets.all(16.w),
              child: ListView(
                children: [
                  TextView(
                    text: 'Company',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8.h),
                  EditFormField(
                    label: 'Ex: WorkPlenty',
                    validator: Validators.validateString(),
                    controller: _companyController,
                  ),
                  SizedBox(height: 18.h),
                  TextView(
                    text: 'Location',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8.h),
                  EditFormField(
                    label: 'Ex: Lagos',
                    validator: Validators.validateString(),
                    controller: _locationController,
                  ),
                  SizedBox(height: 18.h),
                  TextView(
                    text: 'Position',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8.h),
                  EditFormField(
                    label: 'Ex: Lead Frontend Engineer',
                    validator: Validators.validateString(),
                    controller: _positionController,
                  ),
                  SizedBox(height: 18.h),
                  TextView(
                    text: 'Period',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8.h),
                  EditFormField(
                    label: 'Start - MM - YYYY',
                    suffixIcon: Icons.keyboard_arrow_down,
                    validator: Validators.validateString(),
                    controller: _startController,
                  ),
                  SizedBox(height: 8.h),
                  EditFormField(
                    label: 'Through - MM - YYYY',
                    suffixIcon: Icons.keyboard_arrow_down,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Checkbox(
                          value: _checked,
                          onChanged: (bool? value) {
                            _checked = value;
                            setState(() {});
                          }),
                      TextView(
                        text: 'I currently work there',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  BtnWidget(
                    btnText: 'Save',
                    callback: () => null,
                    goBack: () => null,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
