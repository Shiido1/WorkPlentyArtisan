import 'package:flutter/painting.dart';

enum IndicatorSize {
  tiny,
  normal,
  full,
}

class IndicatorDecoration extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final IndicatorSize indicatorSize;

  const IndicatorDecoration(
      {required this.indicatorHeight,
      required this.indicatorColor,
      required this.indicatorSize});

  @override
  IndicatorPainter createBoxPainter([VoidCallback? onChanged]) {
    return new IndicatorPainter(this, onChanged!);
  }
}

class IndicatorPainter extends BoxPainter {
  final IndicatorDecoration decoration;

  IndicatorPainter(this.decoration, VoidCallback onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    Rect? rect;
    if (decoration.indicatorSize == IndicatorSize.full) {
      rect = Offset(offset.dx,
              (configuration.size!.height - decoration.indicatorHeight)) &
          Size(configuration.size!.width, decoration.indicatorHeight);
    } else if (decoration.indicatorSize == IndicatorSize.normal) {
      rect = Offset(offset.dx + 10,
              (configuration.size!.height - decoration.indicatorHeight)) &
          Size(configuration.size!.width - 12, decoration.indicatorHeight);
    } else if (decoration.indicatorSize == IndicatorSize.tiny) {
      rect = Offset(offset.dx + configuration.size!.width / 2 - 8,
              (configuration.size!.height - decoration.indicatorHeight)) &
          Size(16, decoration.indicatorHeight);
    }

    final Paint paint = Paint();
    paint.color = decoration.indicatorColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndCorners(rect!,
            topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        paint);
  }
}
