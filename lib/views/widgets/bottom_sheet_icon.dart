import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSheetIcon extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final double? size;
  const ButtonSheetIcon({Key? key, this.icon, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon!,
      color: color,
      size: size,
    );
  }
}
