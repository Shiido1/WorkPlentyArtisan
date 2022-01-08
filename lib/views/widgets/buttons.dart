import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_loader.dart';
import 'text_views.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? primary;
  final Color? borderColor;
  final Function()? onPressed;
  final double? height;
  final double? width;
  final double? radius;
  final String? icon;
  final double? elevation;
  final bool? buttonStyle;
  final bool? row;

  const ButtonWidget({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.textOverflow = TextOverflow.clip,
    this.textAlign = TextAlign.left,
    this.color,
    this.icon,
    this.borderColor,
    this.height = 50.0,
    this.width,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.radius = 5.0,
    this.elevation = .0,
    this.fontStyle = FontStyle.normal,
    this.primary,
    this.buttonStyle = false,
    this.row = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (row!) {
      return SizedBox(
        width: width?.w,
        height: height?.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: buttonStyle!
              ? _getCustomStyle()
              : Theme.of(context).elevatedButtonTheme.style,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageLoader(
                path: icon,
                width: 24.w,
              ),
              SizedBox(width: 8.w),
              TextView(
                text: buttonText,
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: color ?? Pallets.white,
                textAlign: textAlign,
              )
            ],
          ),
        ),
      );
    }
    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle!
            ? _getCustomStyle()
            : Theme.of(context).elevatedButtonTheme.style,
        child: icon == null
            ? TextView(
                text: buttonText,
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: color ?? Pallets.white,
                textAlign: textAlign,
              )
            : Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ImageLoader(
                      path: icon,
                      width: 24.w,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextView(
                      text: buttonText,
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                      color: color ?? Pallets.white,
                      textAlign: textAlign,
                    ),
                  )
                ],
              ),
      ),
    );
  }

  ButtonStyle _getCustomStyle() {
    return ElevatedButton.styleFrom(
        elevation: elevation,
        primary: primary ?? Pallets.primary100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!)),
        side: BorderSide(
            color: borderColor != null ? borderColor! : Pallets.primary100));
  }
}
