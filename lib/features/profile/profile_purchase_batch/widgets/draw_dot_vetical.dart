import 'package:flutter/material.dart';

class VerticalDotLine extends StatelessWidget {
  const VerticalDotLine({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(2, 50),
      painter: DottedLinePainter(),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xffB7D6FF)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double dashHeight = 3;
    double spaceHeight = 5;
    double currentY = 0;

    while (currentY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, currentY),
        Offset(size.width / 2, currentY + dashHeight),
        paint,
      );
      currentY += dashHeight + spaceHeight;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
