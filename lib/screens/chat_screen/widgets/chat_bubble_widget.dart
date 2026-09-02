import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/constant/app_colors.dart';

class ChatBubbleWidget extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;

  const ChatBubbleWidget({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
        decoration: BoxDecoration(
          color: isMe ? AppColors.instance.chatBubbleGrey : AppColors.instance.primaryBrandBlue,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isMe ? const Radius.circular(16) : Radius.zero,
            bottomRight: isMe ? Radius.zero : const Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: text,
              color: isMe ? Colors.black87 : Colors.white,
              fontSize: 14,
            ),
            const Gap(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  text: time,
                  color: isMe ? Colors.black54 : Colors.white70,
                  fontSize: 10,
                ),
                if (isMe) ...[
                  const Gap(width: 4),
                  const Icon(Icons.done_all, size: 12, color: Colors.black54),
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}
