import 'package:flutter/material.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class HomeSectionTitleWidget extends StatelessWidget {
  final String title;
  final String? trailingText;
  final VoidCallback? onTrailingTap;

  const HomeSectionTitleWidget({
    super.key,
    required this.title,
    this.trailingText,
    this.onTrailingTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: title,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        if (trailingText != null)
          InkWell(
            onTap: onTrailingTap,
            child: AppText(
              text: trailingText!,
              color: Colors.orange.shade400,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }
}
