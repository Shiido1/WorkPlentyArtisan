import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Languages {
  final String? language;
  final String? proficiency;

  Languages({this.language, this.proficiency});

  static List<Languages> getLanguages() {
    List<Languages> _languages = [];
    Languages _l = Languages(language: 'English', proficiency: 'Fluent');
    _languages.add(_l);
    _l = Languages(language: 'Yoruba', proficiency: 'Fluent');
    _languages.add(_l);
    _l = Languages(language: 'Hausa', proficiency: 'Fluent');
    _languages.add(_l);
    return _languages;
  }
}

class LanguageSheet extends StatelessWidget {
  final Function(Languages l)? languageCallback;
  const LanguageSheet({required this.languageCallback, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Utils.getDeviceHeight(context) * .4,
        child: Scaffold(
          appBar: defaultAppBar2(context,
              showLeading: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: true,
              title: 'Language Proficiency',
              elevation: 1),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: ListView(
              children: [
                ...Languages.getLanguages()
                    .map((l) => Container(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: TextView(
                          text: '${l.language} - ${l.proficiency}',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Pallets.mildGrey,
                          onTap: () {
                            languageCallback!(l);
                            PageRouter.goBack(context);
                          },
                        )))
                    .toList()
              ],
            ),
          ),
        ));
  }
}
