import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class ProgressPainter extends CustomPainter {
  final double porcentaje;
  const ProgressPainter(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.strokeWidth = 5;
    paint.color = ColorSelect.btnTextBo1;
    paint.style = PaintingStyle.stroke;

    final rect = Rect.fromCircle(
      center: Offset(size.width * 0.50, size.height * 0.50),
      radius: size.height * .48,
    );
    const startAngle = -math.pi / 2;
    final sweepAngle = math.pi * 2 * (porcentaje / 100.0);
    const useCenter = false;

    final paint2 = Paint();
    paint2.strokeWidth = 8;
    paint2.color = ColorSelect.btnBackgroundBo2;
    paint2.style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(size.width * 0.50, size.height * 0.50),
      size.height * 0.48,
      paint,
    );

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
