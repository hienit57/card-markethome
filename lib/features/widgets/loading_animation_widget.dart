import 'dart:math';
import 'package:card_markethome/index.dart';

class LoadingAnimation extends StatefulWidget {
  final double size;
  final Color color;
  final double maxDotSize;

  const LoadingAnimation({
    super.key,
    this.size = 80,
    this.color = Colors.white,
    this.maxDotSize = 8.0,
  });

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: CustomPaint(
          painter: LoadingPainter(
            animation: _controller,
            color: widget.color,
            maxDotSize: widget.maxDotSize,
          ),
        ),
      ),
    );
  }
}

class LoadingPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;
  final double maxDotSize;
  static const numberOfDots = 8;

  LoadingPainter({
    required this.animation,
    required this.color,
    required this.maxDotSize,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;

    for (int i = 0; i < numberOfDots; i++) {
      final angle = 2 * pi * (i / numberOfDots) - (2 * pi * animation.value);
      final dotPosition = (i / numberOfDots + animation.value) % 1.0;
      final dotSize = _calculateDotSize(dotPosition);

      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);

      final paint = Paint()
        ..color = color.withOpacity(_calculateOpacity(dotPosition))
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(x, y),
        dotSize,
        paint,
      );
    }
  }

  double _calculateDotSize(double position) {
    final minSize = maxDotSize * 0.4;
    final size = maxDotSize - (position * (maxDotSize - minSize));
    return size;
  }

  double _calculateOpacity(double position) {
    return 1.0 - (position * 0.5);
  }

  @override
  bool shouldRepaint(LoadingPainter oldDelegate) => true;
}
