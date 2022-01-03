import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_views.dart';

class ViewAllButton extends StatelessWidget {
  final String? title;
  final Function()? viewAll;

  const ViewAllButton({Key? key, required this.title, required this.viewAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          text: title!,
          fontWeight: FontWeight.w500,
          color: Pallets.grey900,
          fontSize: 16,
          textAlign: TextAlign.left,
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: viewAll,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView(
                text: 'See All',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Pallets.blue,
                textAlign: TextAlign.left,
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.arrow_forward_outlined,
                color: Pallets.blue,
              )
            ],
          ),
        ),
      ],
    );
  }
}
