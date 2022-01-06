import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/profile/awaiting_approval.dart';
import 'package:artisan/views/onboarding/profile/widget/button_widget.dart';
import 'package:artisan/views/onboarding/profile/widget/employment.dart';
import 'package:artisan/views/onboarding/profile/widget/status.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/bottom_sheet.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/subcategory.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  double _progress = 10;
  int _index = 0;
  final _loadingKey = GlobalKey<FormState>();

  List<String> _fields = [
    "HTML",
    "Vue JS",
    "JavaScript",
    "React",
    "AngularJS",
    "AngularJS"
  ];

  List<String> _selectedFields = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: 'Create Profile',
          textColor: Pallets.white),
      body: BodyWidget(
        height: 0,
        width: 0,
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                LinearProgressIndicator(
                  minHeight: 12.h,
                  backgroundColor: Pallets.shade,
                  value: _progress / 100,
                  color: Pallets.shade100,
                ),
                SizedBox(height: 16.h),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: _bodySelect())
              ],
            ),
            BtnWidget(
              btnText: 'Next',
              callback: () => _increamentIndex(),
              goBack: () => _decreamentIndex(),
            )
          ],
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
        PageRouter.gotoWidget(AwaitingApproval(), context);
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
        Wrap(
          spacing: 18.w,
          children: List<Widget>.generate(
            _fields.length,
            (int index) {
              final _field = _fields[index];
              return ChoiceChip(
                label: TextView(
                  text: _field,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: _selectedFields.contains(_field)
                      ? Pallets.white
                      : Pallets.shade100,
                ),
                selected: _selectedFields.contains(_field),
                selectedColor: _selectedFields.contains(_field)
                    ? Pallets.primary100
                    : Pallets.chipBackground,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedFields.contains(_field)
                        ? _selectedFields.remove(_field)
                        : _selectedFields.add(_field);
                  });
                },
              );
            },
          ).toList(),
        ),
        SizedBox(height: 114.h),
        TextView(
          text: 'Not what you’re looking for?',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(label: 'Add'),
      ],
    );
  }

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
              onTap: () {},
            ),
            SizedBox(width: 40.w),
            SkillStatus(
              image: AppImages.intermediate,
              text: 'Intermediate',
              color: Color(0xffFFE5B8),
              onTap: () {},
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
              onTap: () {},
            ),
            SizedBox(width: 40.w),
            SkillStatus(
              image: AppImages.senior,
              text: 'Senior',
              color: Color(0xffB4FCE5),
              onTap: () {},
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
        ),
        SizedBox(height: 18.h),
        TextView(
          text: 'Field of Study',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(label: 'Ex: Computer Engineering'),
        SizedBox(height: 18.h),
        TextView(
          text: 'Degree',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(label: 'Ex. Bachelor\'s'),
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
        ),
        SizedBox(height: 8.h),
        EditFormField(
          label: 'To(expected graduation year)',
          suffixIcon: Icons.keyboard_arrow_down_sharp,
        ),
      ],
    );
  }

  Widget _formFive() {
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
        ...[1, 2].map((_) => _experience()).toList(),
        SizedBox(height: 43.h),
        ButtonWidget(
            buttonText: 'Add Experience',
            buttonStyle: true,
            primary: Colors.transparent,
            color: Pallets.primary100,
            onPressed: () =>
                BottomSheets.showSheet(context, child: EmploymentSheet())),
      ],
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
            label: '20-30 hours/week', suffixIcon: Icons.keyboard_arrow_down),
        SizedBox(height: 26.h),
        TextView(
          text: 'Rate Per Hour - Home Service',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(label: 'Ex. NGN1000 / hour'),
        SizedBox(height: 18.h),
        TextView(
          text: 'Rate - Live Consultancy',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(label: 'Ex. NGN1000 / 15 minutes'),
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

  Column _experience() {
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
                  text: 'Software Engineer | Eduwiki',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8.h),
                TextView(
                  text: 'May 2020 - Present',
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
}
