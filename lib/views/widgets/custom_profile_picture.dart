import 'dart:io';

import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/network/app_config.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_views.dart';

class CustomProfilePicture extends StatelessWidget {
  final File? file;
  final double? radius;
  final String? image;
  final String? initals;
  const CustomProfilePicture(
      {this.file, this.radius, this.image = '', this.initals = '', Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (file != null) {
      return CircleAvatar(
        backgroundColor: Pallets.primary50,
        radius: radius?.r,
        backgroundImage: FileImage(file!),
      );
    }
    if (image!.isEmpty) {
      return CircleAvatar(
        backgroundColor: Pallets.primary50,
        radius: radius?.r,
        child: TextView(
          text: initals ?? '',
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      );
    }
    return CircularProfileAvatar('$image',
        radius: radius!.r,
        backgroundColor: Colors.transparent,
        placeHolder: (c, url) => CircleAvatar(
              backgroundColor: Pallets.primary50,
              radius: radius?.r,
              child: TextView(
                text: initals ?? '',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
        errorWidget: (_, __, ___) => CircleAvatar(
              backgroundColor: Pallets.primary50,
              radius: radius?.r,
              child: TextView(
                text: initals ?? '',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
        cacheImage: true,
        showInitialTextAbovePicture: true);
  }
}
