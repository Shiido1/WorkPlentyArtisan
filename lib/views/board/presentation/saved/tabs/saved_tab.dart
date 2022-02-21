import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/datum.dart';
import 'package:artisan/views/board/presentation/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SavedTab extends StatelessWidget {
  final List<Datum> gigs;

  const SavedTab({required this.gigs, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (gigs.isEmpty) {
      return Center(child: SvgPicture.asset(AppImages.empty));
    }
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ListView(
        children: [
          SizedBox(height: 16.h),
          ...gigs
              .map((gig) => CardWidget(
                    gig: gig,
                    skills: gig.skills,
                  ))
              .toList()
        ],
      ),
    );
  }
}
