import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'edit_form_widget.dart';
import 'image_loader.dart';

class SearchAndFilter extends StatelessWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final Function()? filter;
  final Function()? onPressed;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final bool? showFilter;
  final bool? readOnly;
  final Function()? onTap;
  final Function()? onFilter;
  final IconData? icon;

  const SearchAndFilter(
      {Key? key,
      this.hint,
      this.textEditingController,
      this.filter,
      this.onPressed,
      this.onSubmitted,
      this.onChanged,
      this.onTap,
      this.icon,
      this.showFilter = true,
      this.readOnly = false,
      this.onFilter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EditFormField(label: hint, suffixIcon: Icons.search),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: onFilter,
          child: Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Pallets.primary100),
            child: ImageLoader(path: AppImages.filter),
          ),
        ),
      ],
    );
  }
}
