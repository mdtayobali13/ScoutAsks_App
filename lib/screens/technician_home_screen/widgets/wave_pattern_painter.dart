import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';

class WavePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.instance.blue.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    for (int i = 0; i < 6; i++) {
      final path = Path();
      double offset = i * 8.0;
      path.moveTo(0, size.height - offset);
      
      for (double x = 0; x <= size.width; x += 10) {
        double y = (size.height - offset) - (x * 0.5) + ((x / 20).floor().isEven ? 5 : -5);
        path.lineTo(x, y);
      }
      // Simple representation of wavy lines
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
