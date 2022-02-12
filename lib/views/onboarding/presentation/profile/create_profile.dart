import 'dart:io';

import 'package:artisan/core/database/session_manager.dart';
import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/routes/routes.dart';
import 'package:artisan/core/helper/utils/date_picker.dart';
import 'package:artisan/core/helper/utils/image_picker.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/time_helper.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/data/model/work_history_response/datum.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:artisan/views/onboarding/presentation/profile/provider/profile_provider.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/button_widget.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/category.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/subcategory.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/weekly_hour.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/bottom_sheet.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'bloc/profile_bloc.dart';
import 'widget/employment.dart';
import 'widget/industry.dart';
import 'widget/skills.dart';
import 'widget/skills_choice.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  double _progress = 10;
  int _index = 0;
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weeklyController = TextEditingController();
  final TextEditingController _homeServiceController = TextEditingController();
  final TextEditingController _liveConsultancyController =
      TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();

  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _fieldController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  final _bloc = ProfileBloc(inject());
  final _pickImage = ImagePickerHandler();
  File? _imageFile;
  List<String> _skills = [];
  ProfileProvider? _profileProvider;

  @override
  void initState() {
    _profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    _profileProvider?.fetchSkills();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: defaultAppBar2(context,
          backgroundColor: Pallets.primary100,
          leadingWidth: 70,
          leadingWidget: ImageLoader(
            path: AppImages.whiteLogo,
            height: 24.h,
            width: 24.w,
            onTap: () => PageRouter.goBack(context),
          ),
          centerTitle: true,
          titleWidgte: TextView(
              text: 'Create Profile',
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
            _increamentIndex();
          }
          if (state is ProfileFailed) {
            WorkPlenty.hideLoading(_loadingKey);
            WorkPlenty.error(state.message);
            _increamentIndex();
          }
        },
        child: BodyWidget(
          height: 0,
          width: 0,
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Scrollbar(
                  isAlwaysShown: true,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      LinearProgressIndicator(
                        minHeight: 12.h,
                        backgroundColor: Pallets.shade,
                        value: _progress / 100,
                        color: Pallets.shade100,
                      ),
                      SizedBox(height: 33.h),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          child: _bodySelect())
                    ],
                  ),
                ),
                BtnWidget(
                  showBackButton: _index > 0,
                  btnText: _index != 9 ? 'Next' : "Complete",
                  showSkip: _index == 3 || _index == 6,
                  callback: () => _whenFormIsField(),
                  goBack: () => _decreamentIndex(),
                  skip: () => _increamentIndex(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _increamentIndex() {
    if (_index == 9) {
      WorkPlenty.showSuccessDialog(context, _loadingKey,
          image: AppImages.blowWhistle,
          title: 'Profile looking good',
          message: 'Guess who just completed setting up is profile? You!',
          btnText: 'Continue', next: () {
        PageRouter.goBack(context);
        PageRouter.gotoNamed(Routes.board, context, clearStack: true);
      });
      return;
    }
    _index++;
    _progress += 10;
    setState(() {});
  }

  void _decreamentIndex() {
    if (_index == 0) {
      PageRouter.goBack(context);
      return;
    }

    _index--;
    _progress -= 10;
    setState(() {});
  }

  Future<void> _getImage() async {
    try {
      await _pickImage.pickImage(
          context: context,
          file: (file) {
            _imageFile = file;
            setState(() {});
          });
    } catch (e) {
      logger.e(e);
    }
  }

  Widget _bodySelect() {
    if (_index == 0) return _formOne();
    if (_index == 1) return _formTwo();
    if (_index == 2) return _formThree();
    if (_index == 3) return _formFour();
    if (_index == 4) return _formFive();
    if (_index == 5) return _formSix();
    if (_index == 6) return _formSeven();
    if (_index == 7) return _formEight();
    if (_index == 8) return _formNine();
    if (_index == 9) return _formTen();
    return Container();
  }

  String _skill = '';

  void _checkIfSelectedSkills(String value) {
    if (_skills.contains(value)) {
      _skills.remove(value);
    } else {
      _skills.add(value);
    }
    setState(() {});
  }

  Widget _formOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Categorize the work the you do',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 43.h),
        TextView(
          text: 'Industry?',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(
          label: 'Technology',
          suffixIcon: Icons.keyboard_arrow_down,
          readOnly: true,
          onTapped: () {
            BottomSheets.showSheet(context, child: IndustrySheet(onTap: (d) {
              logger.d(d.toJson());
            }));
          },
        ),
        SizedBox(height: 26.h),
        TextView(
          text: 'Service you offer?',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(
          label: 'Select Category',
          suffixIcon: Icons.keyboard_arrow_down,
          readOnly: true,
          onTapped: () {
            BottomSheets.showSheet(context, child: CategorySheet(onTap: (d) {
              logger.d(d.toJson());
            }));
          },
        ),
        SizedBox(height: 18.h),
        EditFormField(
          label: 'Select Subcategory',
          suffixIcon: Icons.keyboard_arrow_down,
          readOnly: true,
          onTapped: () {
            BottomSheets.showSheet(context, child: SubCategorySheet());
          },
        ),
      ],
    );
  }

  Widget _formTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }

  int? _experienceIndex = 1;

  Widget _formThree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Level of Experience in selected fields?',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 5.h),
        TextView(
          text:
              'Select your overall experience regarding skills selected ealier',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 43.h),
        Row(
          children: [
            SkillStatus(
              image: AppImages.entry,
              text: 'Entry',
              color: Color(0xffFAC1B4),
              index: _experienceIndex,
              defaultIndex: 1,
              onTap: () => setState(() => _experienceIndex = 1),
            ),
            SizedBox(width: 40.w),
            SkillStatus(
              image: AppImages.intermediate,
              text: 'Intermediate',
              color: Color(0xffFFE5B8),
              index: _experienceIndex,
              defaultIndex: 2,
              onTap: () => setState(() => _experienceIndex = 2),
            )
          ],
        ),
        SizedBox(height: 31.h),
        Row(
          children: [
            SkillStatus(
              image: AppImages.midLevel,
              text: 'Mid-Level',
              color: Color(0xffB8AEF4),
              onTap: () => setState(() => _experienceIndex = 3),
              index: _experienceIndex,
              defaultIndex: 3,
            ),
            SizedBox(width: 40.w),
            SkillStatus(
              image: AppImages.senior,
              text: 'Senior',
              color: Color(0xffB4FCE5),
              index: _experienceIndex,
              defaultIndex: 4,
              onTap: () => setState(() => _experienceIndex = 4),
            )
          ],
        )
      ],
    );
  }

  Widget _formFour() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }

  Widget _formFive() {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: 'Work Experence?',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 5.h),
            TextView(
              text:
                  'Build your credibility  by showcasing projects/jobs you’ve worked on, and completed',
              fontWeight: FontWeight.w400,
              fontSize: 18,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 43.h),
            Divider(),
            ...provider.getWorkHistory!
                .map((history) => _experience(history))
                .toList(),
            SizedBox(height: 43.h),
            ButtonWidget(
                buttonText: 'Add Experience',
                buttonStyle: true,
                primary: Colors.transparent,
                color: Pallets.primary100,
                onPressed: () =>
                    BottomSheets.showSheet(context, child: EmploymentSheet())),
            SizedBox(height: 114.h),
          ],
        );
      },
    );
  }

  Widget _formSix() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Preferred Language',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 5.h),
        TextView(
          text:
              'Language you are proefficient with, meaning can have conversation with',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 43.h),
        Divider(),
        EditFormField(label: 'English - Fluent'),
        SizedBox(height: 8.h),
        EditFormField(
          label: 'Add Language',
          suffixIcon: Icons.keyboard_arrow_down,
        ),
      ],
    );
  }

  Widget _formSeven() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Availability & Rate',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        TextView(
          text: 'Choose available hour range and rate',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 43.h),
        TextView(
          text: 'Weekly Hour',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(
          label: '20-30 hours/week',
          controller: _weeklyController,
          validator: Validators.validateInt(),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 26.h),
        TextView(
          text: 'Rate Per Hour - Home Service',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(
          label: 'Ex. NGN1000 / hour',
          controller: _homeServiceController,
          validator: Validators.validateInt(),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 18.h),
        TextView(
          text: 'Rate - Live Consultancy',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(
          label: 'Ex. NGN1000 / 15 minutes',
          controller: _liveConsultancyController,
          validator: Validators.validateInt(),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _formEight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        EditFormField(label: 'Ex: Web Developer & Designer'),
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
                'Highlight your top skills, experience and interests. Lorem impsum lorem ipsum lorem ipsum'),
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
        ),
      ],
    );
  }

  Widget _formNine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Add Profile Picture',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 5.h),
        TextView(
          text:
              'Please upload a professional portrait in which your face appears',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 43.h),
        Center(
          child: ImageLoader(
              width: 238.w, height: 238.h, path: AppImages.imagePlaceHolder),
        ),
        SizedBox(height: 43.h),
        ButtonWidget(
            buttonText: 'Add Profile Picture',
            buttonStyle: true,
            primary: Colors.transparent,
            color: Pallets.primary100,
            onPressed: () {}),
      ],
    );
  }

  Widget _formTen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Your current location',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 5.h),
        TextView(
          text:
              'We take your privacy seriously. Only your city and country will be visible to clients',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 43.h),
        TextView(
          text: 'Country',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(label: 'Nigeria', suffixIcon: Icons.keyboard_arrow_down),
        SizedBox(height: 18.h),
        TextView(
          text: 'Street Address',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(label: 'Ex : 123 Street Close'),
        SizedBox(height: 8.h),
        EditFormField(label: 'Apartment/Suite'),
        SizedBox(height: 18.h),
        TextView(
          text: 'City',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(label: 'Search for your city'),
        SizedBox(height: 18.h),
        TextView(
          text: 'ZIP/Postal Code',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(label: 'Ex: 00000')
      ],
    );
  }

  Column _experience(Datum? history) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                TextView(
                  text:
                      '${history?.position ?? ''} | ${history?.company ?? ''}',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8.h),
                TextView(
                  text:
                      '${TimeUtil.getMonthAndYear(history?.startedOn ?? '')} - ${_isStillThere(history?.currentlyHere) ? 'Present' : '${TimeUtil.getMonthAndYear(history?.endedOn ?? '')}'}',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          ImageLoader(path: AppImages.edit),
          ImageLoader(path: AppImages.close),
        ]),
        SizedBox(height: 18.h),
        Divider(),
      ],
    );
  }

  bool _isStillThere(int? d) {
    if (d == 1) return true;
    return false;
  }

  /// checks if a particular form is submitted
  void _whenFormIsField() {
    if (_formKey.currentState!.validate()) {
      if (_index == 0) _submitFormOne();
      if (_index == 1) _submitFormTwo();
      if (_index == 2) _submitFormThree();
      if (_index == 3) _submitFormFour();
      if (_index == 4) _submitFormFive();
      if (_index == 5) _submitFormSix();
      if (_index == 6) _submitFormSeven();
      if (_index == 7) _submitFormEight();
      if (_index == 8) _submitFormNine();
      if (_index == 9) _submitFormTen();
    }
  }

  void _submitFormOne() {
    _increamentIndex();
  }

  void _submitFormTwo() {
    if (_skills.isEmpty) {
      WorkPlenty.error('You need to have atlease one skill');
      return;
    }
    _bloc.add(SkillsProfileUpdate(ProfileEntity(skills: _skills)));
  }

  void _submitFormThree() {
    _bloc.add(
        UpdateExperience(ProfileEntity(experienceLevel: _experienceIndex)));
  }

  void _submitFormFour() {
    _bloc.add(UpdateEducation(ProfileEntity(
      school: _schoolController.text,
      fieldOfStudy: _fieldController.text,
      degree: _degreeController.text,
      attendedFrom: _fromDateController.text,
      attendedTo: _toDateController.text,
    )));
  }

  void _submitFormFive() {
    if (_profileProvider!.getWorkHistory!.isEmpty) {
      WorkPlenty.error('You need to have atleast one working experience.');
      return;
    }
    _increamentIndex();
  }

  void _submitFormSix() {
    _increamentIndex();
  }

  void _submitFormSeven() {
    _bloc.add(UpdateAvailabilityRate(ProfileEntity(
        weeklyHours: _weeklyController.text,
        rateForHomeService: _homeServiceController.text,
        rateForLiveService: _liveConsultancyController.text)));
  }

  void _submitFormEight() {}
  void _submitFormNine() {}
  void _submitFormTen() {}
}
