import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 153.h,
            width: 136.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Pallets.primary100),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.bottomLeft,
                  child: TextView(
                    text: 'Website, IT & Software',
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Pallets.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            width: 125.w,
            decoration: BoxDecoration(
                color: Pallets.primary100.withOpacity(.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                )),
          ),
        ],
      ),
    );
  }
}
