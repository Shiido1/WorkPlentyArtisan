import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/onboarding/presentation/profile/provider/profile_provider.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SkillsChoice extends StatelessWidget {
  final Function(String)? onSelected;
  final List<String>? listOfSkills;

  const SkillsChoice({this.listOfSkills, required this.onSelected, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Wrap(
          spacing: 18.w,
          children: List<Widget>.generate(
            provider.getSkills!.length,
            (int index) {
              final _field = provider.getSkills![index];
              return ChoiceChip(
                label: TextView(
                  text: _field.name ?? '',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: listOfSkills!.contains(_field.name)
                      ? Pallets.white
                      : Pallets.shade100,
                ),
                selected: listOfSkills!.contains(_field.name),
                backgroundColor: Pallets.chipBackground,
                selectedColor: listOfSkills!.contains(_field.name)
                    ? Pallets.primary100
                    : Pallets.chipBackground,
                onSelected: (value) {
                  onSelected!(_field.name ?? '');
                },
              );
            },
          ).toList(),
        );
      },
    );
  }
}
