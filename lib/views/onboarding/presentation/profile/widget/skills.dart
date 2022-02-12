import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillStatus extends StatelessWidget {
  final String? text;
  final String? image;
  final Color? color;
  final Function()? onTap;
  final int? defaultIndex;
  final int? index;

  const SkillStatus(
      {Key? key,
      this.defaultIndex,
      this.index,
      this.text,
      this.image,
      this.color,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: color,
              border: Border.all(
                  color: index == defaultIndex
                      ? Pallets.primary100
                      : Colors.transparent)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image!),
              SizedBox(height: 17.h),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextView(
                  text: text ?? '',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Pallets.primaryText,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
