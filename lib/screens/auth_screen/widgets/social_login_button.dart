import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class SocialLoginButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: Colors.grey.shade400),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const Gap(width: 10),
          AppText(text: title, color: Colors.black87),
        ],
      ),
    );
  }
}
