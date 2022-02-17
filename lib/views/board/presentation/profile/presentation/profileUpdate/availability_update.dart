import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/board/presentation/profile/presentation/stateManagers/provider/profile_provider.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:artisan/views/onboarding/presentation/profile/bloc/profile_bloc.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UpdateAvailability extends StatefulWidget {
  const UpdateAvailability({Key? key}) : super(key: key);

  @override
  State<UpdateAvailability> createState() => _UpdateAvailabilityState();
}

class _UpdateAvailabilityState extends State<UpdateAvailability> {
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  final _bloc = ProfileBloc(inject());
  ProfileProvider? _profileProvider;
  final TextEditingController _weeklyController = TextEditingController();
  final TextEditingController _homeServiceController = TextEditingController();
  final TextEditingController _liveConsultancyController =
      TextEditingController();

  @override
  void initState() {
    _profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    _profileProvider!.fetchArtisansWorkHistory();
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
              text: 'Update Availability',
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Pallets.white,
              textAlign: TextAlign.center)),
      body: Form(
        key: _formKey,
        child: BlocListener<ProfileBloc, ProfileState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is ProfileLoading) {
              WorkPlenty.showLoading(context, _loadingKey, '');
            }
            if (state is ProfileSuccess) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.success(state.response?.msg ??
                  'Work Experience Updated Successfully');
            }
            if (state is ProfileFailed) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.error(state.message);
            }
          },
          child: BodyWidget(
            child: Consumer<ProfileProvider>(
              builder: (context, provider, child) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
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
                          SizedBox(height: 114.h),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonWidget(
                          buttonText: 'Update Availability',
                          onPressed: () => _update()),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _update() {
    if (_formKey.currentState!.validate()) {
      _bloc.add(UpdateAvailabilityRate(ProfileEntity(
          weeklyHours: _weeklyController.text,
          rateForHomeService: _homeServiceController.text,
          rateForLiveService: _liveConsultancyController.text)));
    }
  }
}
