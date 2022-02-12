import 'dart:io';

import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/custom_profile_picture.dart';
import 'package:artisan/views/widgets/decoration/arc.dart';
import 'package:artisan/views/widgets/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileImageWidget extends StatelessWidget {
  final File? _imageFile;
  final Function()? onTap;

  const ProfileImageWidget(
    this._imageFile, {
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        color: Pallets.greyLight,
        borderType: BorderType.circle,
        strokeWidth: 1,
        child: _imageFile != null
            ? CustomProfilePicture(
                file: _imageFile,
                image: '',
                initals: '',
                radius: 100.r,
              )
            : CircleAvatar(
                radius: 100.r,
                backgroundColor: Color.fromRGBO(16, 55, 92, .15),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 100.h),
                      child: SvgPicture.asset(AppImages.image),
                    ),
                    MyArc(diameter: 300),
                  ],
                ),
              ),
      ),
    );
  }
}
