import 'package:flutter/material.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'widgets/chat_bubble_widget.dart';
import 'widgets/chat_input_widget.dart';
import 'widgets/quotation_card_widget.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  const AuthBackButtonWidget(),
                  const Gap(width: 15),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: const NetworkImage(
                        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200&auto=format&fit=crop"),
                    backgroundColor: Colors.grey.shade300,
                  ),
                  const Gap(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AppText(
                            text: "Guy Hawkins",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          const Gap(width: 4),
                          const Icon(Icons.verified, color: Colors.blue, size: 16),
                        ],
                      ),
                      AppText(
                        text: "Plumber",
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Chat Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                children: [
                  const ChatBubbleWidget(
                    text: "Hi Jean-Pierre, I noticed water seeping through my downstairs ceiling. It seems to originate from the master bathroom shower pipes.",
                    isMe: true,
                    time: "10:31",
                  ),
                  const ChatBubbleWidget(
                    text: "Hello. I can definitely help with that. Since this requires emergency pipe detection and ceiling reinforcement, let me compile a formal Digital Devis with a breakdown of labor and parts.",
                    isMe: false,
                    time: "10:31",
                  ),
                  const ChatBubbleWidget(
                    text: "Here is the detailed quotation for your bathroom pipe leakage repair.",
                    isMe: false,
                    time: "10:31",
                  ),
                  const QuotationCardWidget(),
                ],
              ),
            ),
            
            // Input Area
            const ChatInputWidget(),
          ],
        ),
      ),
    );
  }
}
