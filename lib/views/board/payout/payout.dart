import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/image_decoration.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Payouts extends StatefulWidget {
  const Payouts({Key? key}) : super(key: key);

  @override
  State<Payouts> createState() => _PayoutsState();
}

class _PayoutsState extends State<Payouts> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          centerTitle: true, textColor: Pallets.white, title: 'Payout'),
      body: BodyWidget(
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _index = 0),
                    child: TextView(
                      text: 'Overview',
                      color: _index == 0 ? Pallets.primary150 : Pallets.grey,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      maxLines: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _index = 1),
                    child: TextView(
                      text: 'Withdraw',
                      color: _index == 1 ? Pallets.primary150 : Pallets.grey,
                      textAlign: TextAlign.right,
                      fontWeight: FontWeight.w700,
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h),
            _bodyWidget()
          ],
        ),
      ),
    );
  }

  _bodyWidget() {
    if (_index == 0) return _getOverview();
    return _getWithdraw();
  }

  Column _getOverview() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageBgCard(Row(
          children: [
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Pending Balance',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  color: Pallets.grey,
                  maxLines: 1,
                ),
                SizedBox(height: 5.h),
                TextView(
                  text: 'NGN 241,000',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  color: Pallets.white,
                  maxLines: 1,
                ),
                SizedBox(height: 16.h),
                TextView(
                  text: 'Pending Earning',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  color: Pallets.grey,
                  maxLines: 1,
                ),
                SizedBox(height: 5.h),
                TextView(
                  text: 'NGN 67,000',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  color: Pallets.white,
                  maxLines: 1,
                ),
                SizedBox(height: 16.h),
                TextView(
                  text: 'Pending Withdrawal',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  color: Pallets.grey,
                  maxLines: 1,
                ),
                SizedBox(height: 5.h),
                TextView(
                  text: 'NGN 77,000',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  color: Pallets.white,
                  maxLines: 1,
                ),
              ],
            )),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextView(
                  text: 'Available',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  color: Pallets.grey,
                  maxLines: 1,
                ),
                SizedBox(height: 5.h),
                TextView(
                  text: 'NGN 93,000',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  color: Pallets.white,
                  maxLines: 1,
                ),
                SizedBox(height: 16.h),
                TextView(
                  text: 'In Review',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  color: Pallets.grey,
                  maxLines: 1,
                ),
                SizedBox(height: 5.h),
                TextView(
                  text: 'NGN 83,000',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  color: Pallets.white,
                  maxLines: 1,
                ),
                SizedBox(height: 16.h),
                TextView(
                  text: 'Withdraw',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  color: Pallets.grey,
                  maxLines: 1,
                ),
                SizedBox(height: 5.h),
                TextView(
                  text: 'NGN 83,000',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  color: Pallets.white,
                  maxLines: 1,
                ),
              ],
            )),
          ],
        )),
        SizedBox(height: 37.h),
        Row(
          children: [
            Expanded(
                child: TextView(
              text: 'Activity',
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              maxLines: 1,
            )),
            Row(
              children: [
                TextView(
                  text: 'Sort: ',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  maxLines: 1,
                ),
                TextView(
                    text: 'All',
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    color: Pallets.mildGrey200),
                Icon(Icons.keyboard_arrow_down, color: Pallets.grey)
              ],
            )
          ],
        ),
        SizedBox(height: 12.h),
        ...[1, 2, 2, 2, 2, 4, 1, 2, 2, 2, 2, 4]
            .map(
              (notification) => Container(
                margin: EdgeInsets.only(bottom: 16.h),
                child: ReviewBgCard(TextView(
                  text:
                      'NGN 5000, Pending earning from Live Consultancy with Daniel James',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  fontWeight: FontWeight.w400,
                  color: Pallets.grey,
                  fontSize: 16,
                )),
              ),
            )
            .toList()
      ],
    );
  }

  Column _getWithdraw() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageBgCard(Row(
          children: [
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Pending Withdrawal',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  color: Pallets.grey,
                  maxLines: 1,
                ),
                SizedBox(height: 5.h),
                TextView(
                  text: 'NGN 241,000',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  color: Pallets.white,
                  maxLines: 1,
                ),
              ],
            )),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextView(
                  text: 'Withdraw',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  color: Pallets.grey,
                  maxLines: 1,
                ),
                SizedBox(height: 5.h),
                TextView(
                  text: 'NGN 93,000',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  color: Pallets.white,
                  maxLines: 1,
                ),
              ],
            )),
          ],
        )),
        SizedBox(height: 43.h),
        TextView(
          text: 'Request Withdrawal',
          textAlign: TextAlign.left,
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Pallets.primary150,
          maxLines: 1,
        ),
        SizedBox(height: 16.h),
        EditFormField(label: 'Amount (NGN)'),
        SizedBox(height: 18.h),
        ButtonWidget(buttonText: 'Submit Withdrawal', onPressed: () => null),
        SizedBox(height: 16.h),
      ],
    );
  }
}
