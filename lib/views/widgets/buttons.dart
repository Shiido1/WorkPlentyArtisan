import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';

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

  const ButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.textOverflow = TextOverflow.clip,
      this.textAlign = TextAlign.left,
      this.color,
      this.icon,
      this.borderColor,
      this.height = 48.0,
      this.width = 100.0,
      this.fontSize = 14.0,
      this.fontWeight = FontWeight.normal,
      this.radius = 5.0,
      this.elevation = .0,
      this.fontStyle = FontStyle.normal,
      this.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: elevation,
            primary: primary ?? Pallets.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius!)),
            side: BorderSide(
                color: borderColor != null ? borderColor! : Pallets.blue)),
        onPressed: onPressed,
        child: icon == null
            ? TextView(
                text: buttonText,
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: color,
                textAlign: textAlign,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageLoader(path: icon),
                  TextView(
                    text: buttonText,
                    fontWeight: fontWeight,
                    fontSize: fontSize,
                    color: color,
                    textAlign: textAlign,
                  )
                ],
              ),
      ),
    );
  }
}
