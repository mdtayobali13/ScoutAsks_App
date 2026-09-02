import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/chat_screen/chat_detail_screen.dart';
import 'package:scoutasks/constant/app_colors.dart';

class ChatCardWidget extends StatelessWidget {
  final Map<String, String> chat;

  const ChatCardWidget({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatDetailScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(color: AppColors.instance.surfaceLight, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(chat["avatar"]!),
              backgroundColor: Colors.grey.shade300,
            ),
            const Gap(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: chat["name"]!, fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                  const Gap(height: 2),
                  AppText(text: chat["profession"]!, fontSize: 13, color: Colors.grey.shade600),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Icon(
                Icons.near_me_outlined,
                color: Colors.black87,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
