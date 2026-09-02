import 'package:flutter/material.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String userName;
  final String greeting;
  final String avatarUrl;
  final VoidCallback onNotificationTap;

  const HomeHeaderWidget({
    super.key,
    required this.userName,
    required this.greeting,
    required this.avatarUrl,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: AppSize.width(value: 22),
          backgroundImage: NetworkImage(avatarUrl),
          backgroundColor: Colors.grey.shade200,
        ),
        const Gap(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: greeting,
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
              AppText(
                text: userName,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onNotificationTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.orange.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
