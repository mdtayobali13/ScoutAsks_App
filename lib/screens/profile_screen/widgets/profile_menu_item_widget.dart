import 'package:flutter/material.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/utils/gap.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color titleColor;
  final VoidCallback onTap;

  const ProfileMenuItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleColor = Colors.black87,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
                const Gap(height: 4),
                AppText(
                  text: subtitle,
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.black87,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
