import 'package:flutter/material.dart';

class DeviderWidget extends StatelessWidget {
  const DeviderWidget({
    super.key,
    required this.isVertical,
    required this.sizePadding,
    required this.color,
    required this.height,
    required this.width,
  });

  final bool isVertical;
  final double sizePadding;
  final Color color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isVertical ? sizePadding : 0,
        horizontal: isVertical ? 0 : sizePadding,
      ),
      child: Container(
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}
