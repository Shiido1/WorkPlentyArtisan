import 'package:artisan/core/enums/viewstate.dart';
import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/onboarding/data/model/general_list_of_industry_response/datum.dart';
import 'package:artisan/views/onboarding/presentation/profile/provider/profile_provider.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class IndustrySheet extends StatelessWidget {
  final Function(Datum d)? onTap;
  const IndustrySheet({required this.onTap, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false)
        .fetchListOfIndustries();
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Container(
            height: Utils.getDeviceHeight(context) * .6,
            child: Scaffold(
              appBar: defaultAppBar2(context,
                  showLeading: false,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  centerTitle: true,
                  title: 'Select Industry',
                  elevation: 1),
              body: Padding(
                padding: EdgeInsets.all(16.w),
                child: ListView(
                  children: [
                    if (provider.state == ViewState.busy)
                      LinearProgressIndicator(color: Pallets.primary50),
                    ...provider.data!
                        .map((data) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: TextView(
                                text: data.name ?? '',
                                textAlign: TextAlign.left,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                onTap: () {
                                  onTap!(data);
                                  PageRouter.goBack(context);
                                },
                              ),
                            ))
                        .toList()
                  ],
                ),
              ),
            ));
      },
    );
  }
}
