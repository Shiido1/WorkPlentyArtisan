import 'package:artisan/views/board/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BidTab extends StatelessWidget {
  const BidTab({Key? key}) : super(key: key);
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
