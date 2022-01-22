import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_widget.dart';

class EmploymentSheet extends StatelessWidget {
  const EmploymentSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Utils.getDeviceHeight(context) * .6,
        child: Scaffold(
          appBar: defaultAppBar2(context,
              showLeading: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: true,
              title: 'Add Employment',
              elevation: 1),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: ListView(
              children: [
                TextView(
                  text: 'Company',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8.h),
                EditFormField(
                  label: 'Ex: WorkPlenty',
                ),
                SizedBox(height: 18.h),
                TextView(
                  text: 'Location',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8.h),
                EditFormField(
                  label: 'Ex: Lagos',
                ),
                SizedBox(height: 18.h),
                TextView(
                  text: 'Position',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8.h),
                EditFormField(
                  label: 'Ex: Lead Frontend Engineer',
                ),
                SizedBox(height: 18.h),
                TextView(
                  text: 'Period',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8.h),
                EditFormField(
                  label: 'Start - MM - YYYY',
                  suffixIcon: Icons.keyboard_arrow_down,
                ),
                SizedBox(height: 8.h),
                EditFormField(
                  label: 'Through - MM - YYYY',
                  suffixIcon: Icons.keyboard_arrow_down,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    TextView(
                      text: 'I currently work there',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                  ],
                ),
                BtnWidget(
                  btnText: 'Save',
                  showSkip: false,
                  callback: () => null,
                  goBack: () => null,
                )
              ],
            ),
          ),
        ));
  }
}
