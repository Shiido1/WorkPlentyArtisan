import 'package:flutter/material.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends StatelessWidget {
  const DotsIndicator(
      {Key? key,
      this.controller,
      this.itemCount,
      this.onPageSelected,
      this.color})
      : super(key: key);

  final PageController? controller;
  final int? itemCount;
  final ValueChanged<int>? onPageSelected;
  final Color? color;
  static const double? _kDotSpacing = 25.0;
  static const int? index = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      child: SizedBox(
        width: _kDotSpacing,
        child: Center(
          child: Material(
            color: color,
            type: MaterialType.circle,
            child: SizedBox(
              width: 10,
              height: 10,
              child: InkWell(
                onTap: () => onPageSelected!(index!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
