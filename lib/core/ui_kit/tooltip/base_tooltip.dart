import 'package:flutter/material.dart';

class BaseTooltipWidget extends StatelessWidget {
  const BaseTooltipWidget({
    super.key,
    required this.tooltipTitle,
    required this.widget,
  });

  final String tooltipTitle;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      richMessage: WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Container(
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints(maxWidth: 250),
            child: Text(
              tooltipTitle,
              style: const TextStyle(color: Colors.white),
            ),
          )),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      showDuration: const Duration(seconds: 8),
      decoration: ShapeDecoration(
        color: Colors.grey,
        shape: ToolTipCustomShape(usePadding: true),
      ),
      preferBelow: false,
      verticalOffset: 5,
      child: widget,
    );
  }
}

class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;

  ToolTipCustomShape({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 10 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect =
        Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 3)))
      ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
      // ..relativeLineTo(10, 20)
      // ..relativeLineTo(10, -20)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
