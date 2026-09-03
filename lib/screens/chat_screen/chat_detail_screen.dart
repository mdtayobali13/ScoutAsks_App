import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'widgets/chat_bubble_widget.dart';
import 'widgets/chat_input_widget.dart';
import 'widgets/quotation_card_widget.dart';
import 'widgets/create_quotation_bottom_sheet.dart';

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
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.instance.primaryBrandOrange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Gap(width: 15),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: const NetworkImage(
                        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200&auto=format&fit=crop"),
                    backgroundColor: Colors.grey.shade300,
                  ),
                  const Gap(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AppText(
                              text: "Guy king",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            const Gap(width: 4),
                            const Icon(Icons.verified, color: Colors.blue, size: 16),
                          ],
                        ),
                        AppText(
                          text: "Customer",
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      CreateQuotationBottomSheet.show(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.instance.primaryBrandOrange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AppText(
                        text: "Quotation",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
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
