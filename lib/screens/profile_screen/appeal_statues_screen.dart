import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/screens/profile_screen/widgets/my_review_card_widget.dart';

class AppealStatuesScreen extends StatelessWidget {
  const AppealStatuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  const AuthBackButtonWidget(),
                  const Gap(width: 15),
                  Expanded(
                    child: AppText(
                      text: "Appeal statues",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: 2,
                separatorBuilder: (context, index) => const Column(
                  children: [
                    Gap(height: 15),
                    Divider(color: Color(0xFFF3F5F7), thickness: 1.5),
                    Gap(height: 15),
                  ],
                ),
                itemBuilder: (context, index) {
                  final reviews = [
                    {
                      "name": "Eleanor Summers",
                      "date": "Today, 16:40",
                      "content": "What can I say it's fast food, it's scoutasks.No different to any of the other scoutasks, nice with adequate seating",
                      "image": "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=150&auto=format&fit=crop",
                      "status": "APPEAL ACCEPTED",
                      "statusColor": Colors.green
                    },
                    {
                      "name": "Victoria Champain",
                      "date": "Today, 09:12",
                      "content": "Food, as always, is good both upstairs and downstairs is always clean (download the bk app for deals etc.) sit upstairs every time, more relaxed feel.",
                      "image": "https://images.unsplash.com/photo-1531123897727-8f129e1bf98a?q=80&w=150&auto=format&fit=crop",
                      "status": "APPEAL REJECTED",
                      "statusColor": Colors.red
                    },
                  ];

                  final review = reviews[index];
                  final statusColor = review["statusColor"] as Color;
                  
                  return MyReviewCardWidget(
                    name: review["name"] as String,
                    rating: index == 0 ? 1.0 : 2.0,
                    date: review["date"] as String,
                    content: review["content"] as String,
                    imageUrl: review["image"] as String,
                    avatarBgColor: Colors.orange.shade100,
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.05),
                        border: Border.all(color: statusColor, width: 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: AppText(
                        text: review["status"] as String,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
