import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';

import 'text_views.dart';

AppBar defaultAppBar(BuildContext context,
    {String title = '',
    VoidCallback? onTap,
    bool showLeading = true,
    bool showMoreMenu = false,
    bool centerTitle = false,
    double? elevation = .0,
    double? leadingWidth = .0,
    Widget? leadingWidget,
    Color? backgroundColor,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    Widget? titleWidgte,
    bool? showClearButton = true,
    String image = ''}) {
  return AppBar(
    automaticallyImplyLeading: showLeading,
    elevation: elevation,
    centerTitle: centerTitle,
    bottom: bottom,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    iconTheme: IconThemeData(color: Pallets.grey900),
    title: titleWidgte ??
        TextView(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Pallets.grey900,
            textAlign: TextAlign.center),
    actions: actions,
  );
}
