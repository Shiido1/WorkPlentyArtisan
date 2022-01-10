import 'dart:io';

import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool? value;
  final Function(bool)? onChanged;

  const CustomSwitch({
    Key? key,
    this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Switch(
            onChanged: (value) => widget.onChanged!(value),
            value: widget.value!,
            activeColor: Pallets.primary100,
            activeTrackColor: Pallets.primary100.withOpacity(.3),
            inactiveThumbColor: Pallets.grey500,
            inactiveTrackColor: Pallets.grey500,
          )
        : CupertinoSwitch(
            value: widget.value!,
            onChanged: (value) => widget.onChanged!(value),
            activeColor: Pallets.primary100,
            trackColor: Pallets.primary100.withOpacity(.3),
          );
  }
}
