import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategorySheet extends StatelessWidget {
  const SubCategorySheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> _categories = [
      "Desktop Software Development",
      "Ecommerce Development",
      "Game Development",
      "Other - Software Development",
      "Product Management",
      "QA & Testing",
      "Scripts & Plugins",
      "Web & Mobile Design",
      "Web Development"
    ];
    return Container(
        height: Utils.getDeviceHeight(context) * .6,
        child: Scaffold(
          appBar: defaultAppBar2(context,
              showLeading: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: true,
              title: 'Select A Sub Category',
              elevation: 1),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: ListView(
              children: [
                ..._categories
                    .map((category) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: TextView(
                            text: category,
                            textAlign: TextAlign.left,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                    .toList()
              ],
            ),
          ),
        ));
  }
}
