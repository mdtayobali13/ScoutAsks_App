import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/screens/profile_screen/widgets/my_review_card_widget.dart';
import 'package:scoutasks/screens/profile_screen/widgets/report_review_bottom_sheet.dart';
import 'package:scoutasks/screens/profile_screen/appeal_statues_screen.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

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
                      text: "Review",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  AppButton(
                    title: "Appeal statues",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AppealStatuesScreen()),
                      );
                    },
                    backgroundColor: AppColors.instance.primaryBrandBlue,
                    titleColor: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    height: 38,
                    width: 130,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: 4,
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
                      "image": "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=150&auto=format&fit=crop"
                    },
                    {
                      "name": "Victoria Champain",
                      "date": "Today, 09:12",
                      "content": "Food, as always, is good both upstairs and downstairs is always clean (download the bk app for deals etc.) sit upstairs every time, more relaxed feel.",
                      "image": "https://images.unsplash.com/photo-1531123897727-8f129e1bf98a?q=80&w=150&auto=format&fit=crop"
                    },
                    {
                      "name": "Laura Smith",
                      "date": "Yesterday, 16:40",
                      "content": "Amazing food. Lots of choice. We took a while to choose as everything sounded amazing on the menu! All cooked to perfection. Portions were large. Service excellent. Definitely plan to go again and often!",
                      "image": "https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=150&auto=format&fit=crop"
                    },
                    {
                      "name": "Dora Perry",
                      "date": "Yesterday, 16:40",
                      "content": "I popped in for a late lunch on Friday after a long morning working. The staff member was rude and unhelpful and the toilets were closed. I will not be returning and suggest others do not either.",
                      "image": "https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=150&auto=format&fit=crop"
                    }
                  ];

                  final review = reviews[index];
                  
                  return MyReviewCardWidget(
                    name: review["name"]!,
                    rating: 5.0,
                    date: review["date"]!,
                    content: review["content"]!,
                    imageUrl: review["image"]!,
                    avatarBgColor: Colors.orange.shade100,
                    onMoreTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const ReportReviewBottomSheet(),
                      );
                    },
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
