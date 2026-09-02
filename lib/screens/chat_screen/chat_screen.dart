import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/chat_screen/widgets/chat_card_widget.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final List<Map<String, String>> chats = [
      {
        "name": "Guy Hawkins",
        "profession": "Plumber",
        "avatar": "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200&auto=format&fit=crop",
      },
      {
        "name": "Sarah Wilson",
        "profession": "Electrician",
        "avatar": "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=200&auto=format&fit=crop",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Secured communication",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  const Gap(height: 5),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "Scoutasks ",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 13),
                        ),
                        TextSpan(
                          text: "Chats & Devis",
                          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey.shade600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(height: 20),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: chats.length,
                separatorBuilder: (context, index) => const Gap(height: 15),
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ChatCardWidget(chat: chat);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
