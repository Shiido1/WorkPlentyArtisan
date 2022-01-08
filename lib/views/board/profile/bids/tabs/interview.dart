import 'package:artisan/core/bus/event_bus.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/views/board/widget/card_widget.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/search_field.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterviewTab extends StatelessWidget {
  const InterviewTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ListView(
        children: [
          ...[1, 2, 2, 2, 2, 2, 3].map((_) => CardWidget()).toList()
        ],
      ),
    );
  }
}
