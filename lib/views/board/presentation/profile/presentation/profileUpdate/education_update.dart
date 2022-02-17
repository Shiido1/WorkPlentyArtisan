import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/utils/date_picker.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:artisan/views/onboarding/presentation/profile/bloc/profile_bloc.dart';
import 'package:artisan/views/onboarding/presentation/profile/provider/profile_provider.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/global_dialog.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UpdateProfileEducation extends StatefulWidget {
  const UpdateProfileEducation({Key? key}) : super(key: key);

  @override
  State<UpdateProfileEducation> createState() => _UpdateProfileEducationState();
}

class _UpdateProfileEducationState extends State<UpdateProfileEducation> {
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _fieldController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  final _bloc = ProfileBloc(inject());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: defaultAppBar2(context,
          backgroundColor: Pallets.primary100,
          centerTitle: true,
          titleWidgte: TextView(
              text: 'Update Education Level',
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Pallets.white,
              textAlign: TextAlign.center)),
      body: BlocListener<ProfileBloc, ProfileState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is ProfileLoading) {
            WorkPlenty.showLoading(context, _loadingKey, '');
          }
          if (state is ProfileSuccess) {
            WorkPlenty.hideLoading(_loadingKey);
            WorkPlenty.success(
                state.response?.msg ?? 'Education Updated Successfully');
          }
          if (state is ProfileFailed) {
            WorkPlenty.hideLoading(_loadingKey);
            WorkPlenty.error(state.message);
          }
        },
        child: BodyWidget(
          height: 0,
          width: 0,
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TextView(
                        text: 'Level of Education?',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5.h),
                      TextView(
                        text:
                            'Add schools, courses you attended, areas of study, and degrees you attained',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 43.h),
                      TextView(
                        text: 'School',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8.h),
                      EditFormField(
                        label: 'Ex: University of Ibadan',
                        validator: Validators.validateString(),
                        controller: _schoolController,
                      ),
                      SizedBox(height: 18.h),
                      TextView(
                        text: 'Field of Study',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8.h),
                      EditFormField(
                        label: 'Ex: Computer Engineering',
                        validator: Validators.validateString(),
                        controller: _fieldController,
                      ),
                      SizedBox(height: 18.h),
                      TextView(
                        text: 'Degree',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8.h),
                      EditFormField(
                        label: 'Ex. Bachelor\'s',
                        validator: Validators.validateString(),
                        controller: _degreeController,
                      ),
                      SizedBox(height: 18.h),
                      TextView(
                        text: 'Dates Attended',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8.h),
                      EditFormField(
                        label: 'From',
                        suffixIcon: Icons.keyboard_arrow_down_sharp,
                        controller: _fromDateController,
                        validator: Validators.validateString(),
                        readOnly: true,
                        onTapped: () => pickDate(
                            context: context,
                            dateOptions: DateOptions.past,
                            onChange: (v) {
                              _fromDateController.text = v;
                              setState(() {});
                            }),
                      ),
                      SizedBox(height: 8.h),
                      EditFormField(
                        label: 'To (expected graduation year)',
                        suffixIcon: Icons.keyboard_arrow_down_sharp,
                        controller: _toDateController,
                        validator: Validators.validateString(),
                        readOnly: true,
                        onTapped: () => pickDate(
                            context: context,
                            dateOptions: DateOptions.general,
                            onChange: (v) {
                              _toDateController.text = v;
                              setState(() {});
                            }),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonWidget(
                      buttonText: 'Update Education Level',
                      onPressed: () => _proceed()),
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
      _bloc.add(UpdateEducation(ProfileEntity(
        school: _schoolController.text,
        fieldOfStudy: _fieldController.text,
        degree: _degreeController.text,
        attendedFrom: _fromDateController.text,
        attendedTo: _toDateController.text,
      )));
    }
  }
}
