import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';

class CarouselDot extends StatelessWidget {
  final bool isActive;

  const CarouselDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: isActive ? 16 : 12,
      decoration: BoxDecoration(
        color: isActive 
            ? AppColors.instance.primaryBrandBlue 
            : Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
