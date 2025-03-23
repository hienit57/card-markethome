import 'package:card_markethome/index.dart';

class PurchaseBatchTransactionDetailPainter extends StatelessWidget {
  const PurchaseBatchTransactionDetailPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(context.maxWidth, 583),
      painter: PurchaseBatchTransactionPainter(),
    );
  }
}

class PurchaseBatchTransactionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width; // Lấy chiều rộng thực tế của trang
    double padding = 6; // Khoảng cách mép ngoài

    Path path_0 = Path();
    path_0.moveTo(padding, 14);
    path_0.cubicTo(padding, 7.37258, padding + 5.3726, 2, padding + 12, 2);
    path_0.lineTo(w - padding - 12, 2);
    path_0.cubicTo(w - padding - 6, 2, w - padding, 7.37258, w - padding, 14);
    path_0.lineTo(w - padding, 185.041);
    path_0.cubicTo(w - padding - 0.33, 185.014, w - padding - 0.67, 185,
        w - padding - 1, 185);
    path_0.cubicTo(
        w - padding - 8, 185, w - padding - 13, 190.373, w - padding - 13, 197);
    path_0.cubicTo(
        w - padding - 13, 203.627, w - padding - 8, 209, w - padding - 1, 209);
    path_0.cubicTo(w - padding - 0.67, 209, w - padding - 0.33, 208.986,
        w - padding, 208.959);
    path_0.lineTo(w - padding, 561);
    path_0.cubicTo(
        w - padding, 567.627, w - padding - 6, 573, w - padding - 12, 573);
    path_0.lineTo(padding + 12, 573);
    path_0.cubicTo(padding + 5.3726, 573, padding, 567.627, padding, 561);
    path_0.lineTo(padding, 208.959);
    path_0.cubicTo(
        padding + 6.1595, 208.451, padding + 11, 203.291, padding + 11, 197);
    path_0.cubicTo(
        padding + 11, 190.709, padding + 6.1595, 185.549, padding, 185.041);
    path_0.lineTo(padding, 14);
    path_0.close();

    // Fill shape
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    // Dotted Line
    Paint dottedPaint = Paint()
      ..color = const Color(0xff75B1E5)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double startX = 16; // Cách mép 16px
    double endX = w - 16; // Cách mép phải 16px
    double y = size.height * 0.3387650; // Định vị đường chấm chấm

    double dashWidth = 5; // Chiều dài mỗi đoạn chấm
    double dashSpace = 8; // Khoảng cách giữa các chấm

    double currentX = startX;
    while (currentX < endX) {
      canvas.drawLine(
        Offset(currentX, y),
        Offset(currentX + dashWidth, y),
        dottedPaint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
