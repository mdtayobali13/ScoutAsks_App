import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          text: title,
          fontSize: 30,
          fontWeight: FontWeight.w800,
          color: const Color(0xFF262626),
        ),
        const Gap(height: 12),
        AppText(
          text: subtitle,
          textAlign: TextAlign.center,
          fontSize: 16,
          color: Colors.grey.shade600,
          height: 1.5,
        ),
      ],
    );
  }
}
