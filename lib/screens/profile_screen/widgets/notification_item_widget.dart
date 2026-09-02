import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class NotificationItemWidget extends StatelessWidget {
  final bool isUnread;
  final String avatarUrl;
  final String title;
  final String message;

  const NotificationItemWidget({
    super.key,
    required this.isUnread,
    required this.avatarUrl,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread ? const Color(0xFFEFF2F6) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(avatarUrl),
            backgroundColor: Colors.grey.shade300,
          ),
          const Gap(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                const Gap(height: 6),
                AppText(
                  text: message,
                  fontSize: 13,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ],
            ),
          ),
          if (isUnread) ...[
            const Gap(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ] else ...[
            // Keep spacing consistent even if no dot
            const Gap(width: 20),
          ]
        ],
      ),
    );
  }
}
