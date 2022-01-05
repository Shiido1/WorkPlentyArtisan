import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/profile/widget/button_widget.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  double _progress = 70;
  int _index = 0;
  final _loadingKey = GlobalKey<FormState>();

  List<String> _fields = [
    "UI/UX Development",
    "Marketing",
    "Writing",
    "Mobile",
    "Customer Support"
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
          titleWidgte: TextView(
              text: 'Create Profile',
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Pallets.white,
              textAlign: TextAlign.center)),
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
              skip: () {},
            )
          ],
        ),
      ),
    );
  }

  void _increamentIndex() {
    if (_index == 3) {
      WorkPlenty.showSuccessDialog(context, _loadingKey,
          image: AppImages.blowWhistle,
          title: 'Profile looking good',
          message: 'Guess who just completed setting up is profile? You!',
          btnText: 'Continue');
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
    return _formFour();
  }

  Widget _formOne() {
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

  Widget _formTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Select talents category?',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 5.h),
        TextView(
          text:
              'Select 4 categories , we’ll build a custom homefeed tailored to talents',
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
        )
      ],
    );
  }

  Widget _formThree() {
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

  Widget _formFour() {
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
}
