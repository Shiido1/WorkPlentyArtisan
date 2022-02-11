import 'dart:io';

import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/routes/routes.dart';
import 'package:artisan/core/helper/utils/image_picker.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/button_widget.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/custom_profile_picture.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/global_dialog.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/profile_bloc.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  double _progress = 70;
  int _index = 0;
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();

  final _bloc = ProfileBloc(inject());
  final _pickImage = ImagePickerHandler();
  File? _imageFile;

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
          }
        },
        child: BodyWidget(
          height: 0,
          width: 0,
          child: Form(
            key: _formKey,
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
                    SizedBox(height: 33.h),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        child: _bodySelect())
                  ],
                ),
                BtnWidget(
                  showBackButton: _index > 0,
                  btnText: _index != 3 ? 'Next' : "Complete",
                  showSkip: _index != 3,
                  callback: () => _whenFormIsField(),
                  goBack: () => _decreamentIndex(),
                  skip: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _increamentIndex() {
    if (_index == 2) {
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

  void _whenFormIsField() {
    if (_formKey.currentState!.validate()) {
      if (_index == 0) {
        _bloc.add(BioProfileUpdate(ProfileEntity(
            title: _titleController.text,
            description: _descriptionController.text,
            gender: _genderController.text)));
      }

      if (_index == 1) {
        _bloc.add(AvatarProfileUpdate(
            ProfileEntity(avatar: _pickImage.multiPathFile(_imageFile!))));
      }

      if (_index == 2) {
        _bloc.add(LocationProfileUpdate(ProfileEntity(
            country: _countryController.text,
            state: _stateController.text,
            city: _cityController.text,
            countryID: 160,
            stateId: 435,
            zipcode: _zipcodeController.text,
            address: _addressController.text,
            appartment: _apartmentController.text)));
      }
    }
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
    return _formThree();
  }

  Widget _formOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Your Profile Bio?',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 5.h),
        TextView(
          text:
              'Write a great profile bio, remember that’s what attracts your clients',
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Pallets.mildGrey,
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
          validator: _index == 0 ? Validators.validateString() : null,
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
          validator: _index == 0 ? Validators.validateString() : null,
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
          validator: _index == 0 ? Validators.validateString() : null,
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
        SizedBox(height: Utils.getDeviceHeight(context) * .3),
      ],
    );
  }

  Widget _formTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Pallets.mildGrey,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 43.h),
        Center(
          child: CustomProfilePicture(
            file: _imageFile,
            image: '',
            initals: '',
            radius: 100.r,
          ),
        ),
        SizedBox(height: 43.h),
        ButtonWidget(
            buttonText: 'Add Profile Picture',
            buttonStyle: true,
            primary: Colors.transparent,
            color: Pallets.primary100,
            onPressed: () => _getImage()),
        SizedBox(height: Utils.getDeviceHeight(context) * .3),
      ],
    );
  }

  Widget _formThree() {
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
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Pallets.mildGrey,
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
        EditFormField(
            label: 'Nigeria',
            suffixIcon: Icons.keyboard_arrow_down,
            controller: _countryController,
            validator: Validators.validateString()),
        SizedBox(height: 31.h),
        TextView(
          text: 'Street Address',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(
            label: 'Ex : 123 Street Close',
            controller: _addressController,
            validator: Validators.validateString()),
        SizedBox(height: 8.h),
        EditFormField(
            label: 'Apartment/Suite',
            controller: _apartmentController,
            validator: Validators.validateString()),
        SizedBox(height: 31.h),
        TextView(
          text: 'City',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(
            label: 'Search for your city',
            controller: _cityController,
            validator: Validators.validateString()),
        SizedBox(height: 31.h),
        TextView(
          text: 'ZIP/Postal Code',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        EditFormField(
            label: 'Ex: 00000',
            controller: _zipcodeController,
            validator: Validators.validateString()),
        SizedBox(height: Utils.getDeviceHeight(context) * .3),
      ],
    );
  }
}
