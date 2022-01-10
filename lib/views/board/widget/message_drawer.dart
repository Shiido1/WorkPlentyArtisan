import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/profile/widget/clicks_two.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageDrawerWidget extends StatelessWidget {
  const MessageDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BodyWidget(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 23.h, horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                      child: TextView(
                    text: 'Filter',
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.left,
                  )),
                  Expanded(
                      child: TextView(
                    text: 'Clear',
                    color: Pallets.grey,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.right,
                  ))
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Message',
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      TextView(
                        text: 'All',
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      TextView(
                        text: 'Unread',
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      TextView(
                        text: 'Archived',
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      TextView(
                        text: 'Spam',
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
