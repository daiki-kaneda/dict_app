import 'dart:math';

import 'package:flutter/cupertino.dart';

class _ProgressRingPainter extends CustomPainter {
  _ProgressRingPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
    required this.completionColor,
    required this.ringDiameterRatio,
  });

  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final Color completionColor;
  final double ringDiameterRatio;

  static const double startAngle = pi * 1 / 2;
  static const double sweepAngle = pi * 2;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final d = size.width * ringDiameterRatio;
    final c = Offset(size.width / 2, size.height / 2);

    final backgroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = progress == 1.0 ? completionColor : progressColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(Rect.fromCenter(center: c, width: d, height: d), startAngle,
        sweepAngle, false, backgroundPaint);

    canvas.drawArc(Rect.fromCenter(center: c, width: d, height: d), startAngle,
        sweepAngle * progress, false, progressPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _ProgressRingPainter oldDelegate) =>
      progress != oldDelegate.progress ||
      strokeWidth != oldDelegate.strokeWidth ||
      backgroundColor != oldDelegate.backgroundColor ||
      progressColor != oldDelegate.progressColor ||
      ringDiameterRatio != oldDelegate.ringDiameterRatio;
}

// アニメーションなしの ProgressRing (Stateless)
class ProgressRingStatic extends StatelessWidget {
  const ProgressRingStatic({
    super.key,
    this.dimension = 24,
    this.progress = 0,
    this.strokeWidth = 8.0,
    this.backgroundColor = CupertinoColors.lightBackgroundGray,
    this.progressColor = CupertinoColors.systemCyan,
    this.completionColor = CupertinoColors.systemGreen,
    this.ringDiameterRatio = 0.8,
  });

  final double dimension;
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final Color completionColor;
  final double ringDiameterRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dimension,
      height: dimension,
      child: CustomPaint(
        painter: _ProgressRingPainter(
          progress: progress,
          strokeWidth: strokeWidth,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          completionColor: completionColor,
          ringDiameterRatio: ringDiameterRatio,
        ),
      ),
    );
  }
}
