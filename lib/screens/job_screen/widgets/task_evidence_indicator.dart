import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';

class TaskEvidenceIndicator extends StatelessWidget {
  final bool isActive;
  const TaskEvidenceIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 20,
      decoration: BoxDecoration(
        color: isActive ? AppColors.instance.primaryBrandBlue : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
