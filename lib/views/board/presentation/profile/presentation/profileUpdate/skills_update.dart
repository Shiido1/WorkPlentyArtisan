import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:artisan/views/onboarding/presentation/profile/bloc/profile_bloc.dart';
import 'package:artisan/views/onboarding/presentation/profile/provider/profile_provider.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/skills_choice.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UpdateSkills extends StatefulWidget {
  const UpdateSkills({Key? key}) : super(key: key);

  @override
  State<UpdateSkills> createState() => _UpdateSkillsState();
}

class _UpdateSkillsState extends State<UpdateSkills> {
  final _loadingKey = GlobalKey<FormState>();

  List<String> _skills = [];

  final _bloc = ProfileBloc(inject());
  ProfileSetUpProvider? _profileProvider;

  @override
  void initState() {
    _profileProvider =
        Provider.of<ProfileSetUpProvider>(context, listen: false);
    _profileProvider?.fetchSkills();
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
              text: 'Update Skills',
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
                  state.response?.msg ?? 'Skills Updated Successfully');
            }
            if (state is ProfileFailed) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.error(state.message);
            }
          },
          child: BodyWidget(
            height: 0,
            width: 0,
            child: Stack(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  margin: EdgeInsets.only(bottom: 50.h),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TextView(
                        text: 'Select your skill(s)',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5.h),
                      TextView(
                        text: 'Choose as many as you want',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 43.h),
                      SkillsChoice(
                        listOfSkills: _skills,
                        onSelected: (String value) {
                          _checkIfSelectedSkills(value);
                        },
                      ),
                      SizedBox(height: 23.h),
                      TextView(
                        text: 'Not what you’re looking for?',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8.h),
                      EditFormField(label: 'Add'),
                      SizedBox(height: 114.h),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonWidget(
                      buttonText: 'Update Skills', onPressed: () => _proceed()),
                )
              ],
            ),
          )),
    );
  }

  void _proceed() {
    _bloc.add(SkillsProfileUpdate(ProfileEntity(skills: _skills)));
  }

  void _checkIfSelectedSkills(String value) {
    if (_skills.contains(value)) {
      _skills.remove(value);
    } else {
      _skills.add(value);
    }
    setState(() {});
  }
}
