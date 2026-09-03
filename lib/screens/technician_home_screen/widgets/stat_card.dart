import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? backgroundColor;
  final Color? valueColor;
  final double? valueFontSize;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.backgroundColor,
    this.valueColor,
    this.valueFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.instance.surfaceLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.instance.gray500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: valueFontSize ?? 22,
              fontWeight: FontWeight.bold,
              color: valueColor ?? AppColors.instance.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
