import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/board/presentation/profile/presentation/stateManagers/provider/profile_provider.dart';
import 'package:artisan/views/board/presentation/profile/presentation/widget/experience_widget.dart';
import 'package:artisan/views/onboarding/presentation/profile/bloc/profile_bloc.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/employment.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/bottom_sheet.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UpdateWork extends StatefulWidget {
  const UpdateWork({Key? key}) : super(key: key);

  @override
  State<UpdateWork> createState() => _UpdateWorkState();
}

class _UpdateWorkState extends State<UpdateWork> {
  final _loadingKey = GlobalKey<FormState>();

  final _bloc = ProfileBloc(inject());
  ProfileProvider? _profileProvider;

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
                state.response?.msg ?? 'Work Experience Updated Successfully');
          }
          if (state is ProfileFailed) {
            WorkPlenty.hideLoading(_loadingKey);
            WorkPlenty.error(state.message);
          }
        },
        child: BodyWidget(
          child: Consumer<ProfileProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Work Experience?',
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
                        .map((history) => ExperienceWidget(history))
                        .toList()
                        .reversed
                        .toList(),
                    SizedBox(height: 43.h),
                    ButtonWidget(
                        width: Utils.getDeviceWidth(context),
                        buttonText: 'Update Working Experience',
                        onPressed: () => BottomSheets.showSheet(context,
                            child: EmploymentSheet())),
                    SizedBox(height: 114.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
