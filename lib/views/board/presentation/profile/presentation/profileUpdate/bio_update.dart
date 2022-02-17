import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:artisan/views/onboarding/presentation/profile/bloc/profile_bloc.dart';
import 'package:artisan/views/onboarding/presentation/profile/provider/profile_provider.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/button_widget.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/global_dialog.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UpdateBio extends StatefulWidget {
  const UpdateBio({Key? key}) : super(key: key);

  @override
  State<UpdateBio> createState() => _UpdateBioState();
}

class _UpdateBioState extends State<UpdateBio> {
  double _progress = 10;
  int _index = 0;
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  final _bloc = ProfileBloc(inject());
  ProfileSetUpProvider? _profileProvider;

  @override
  void initState() {
    _profileProvider =
        Provider.of<ProfileSetUpProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: defaultAppBar2(context,
          backgroundColor: Pallets.primary100,
          centerTitle: true,
          titleWidgte: TextView(
              text: 'Update Profile Bio',
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
                state.response?.msg ?? 'Bio Updated Successfully');
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
                        text: 'Your Profile Bio?',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5.h),
                      TextView(
                        text:
                            'Write a great profile bio, remember that’s what attracts your clients',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 43.h),
                      TextView(
                        text: 'Title',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8.h),
                      EditFormField(
                        label: 'Ex: Web Developer & Designer',
                        controller: _titleController,
                        validator: Validators.validateString(),
                      ),
                      SizedBox(height: 26.h),
                      TextView(
                        text: 'Description',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8.h),
                      EditFormField(
                        height: 224.h,
                        label:
                            'Highlight your top skills, experience and interests. Lorem impsum lorem ipsum lorem ipsum',
                        controller: _descriptionController,
                        validator: Validators.validateString(),
                      ),
                      SizedBox(height: 26.h),
                      TextView(
                        text: 'Gender',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8.h),
                      EditFormField(
                        label: '',
                        suffixIcon: Icons.keyboard_arrow_down,
                        validator: Validators.validateString(),
                        controller: _genderController,
                        readOnly: true,
                        onTapped: () => globalDialog(
                            showRadioButton: false,
                            question: 'Gender',
                            context: context,
                            list: ['Male', "Female"],
                            picked: (v) {
                              _genderController.text = v;
                              setState(() {});
                            }),
                      ),
                      SizedBox(height: 114.h)
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonWidget(
                      buttonText: 'Update Profile Bio',
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
      _bloc.add(BioProfileUpdate(ProfileEntity(
          title: _titleController.text,
          description: _descriptionController.text,
          gender: _genderController.text)));
    }
  }
}
