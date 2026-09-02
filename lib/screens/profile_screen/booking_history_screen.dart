import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/screens/profile_screen/widgets/booking_history_card_widget.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

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
                  AppText(
                    text: "Booking history",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: 3,
                separatorBuilder: (context, index) => const Gap(height: 15),
                itemBuilder: (context, index) {
                  return BookingHistoryCardWidget(
                    title: "Leaking kitchen pipe",
                    description: "Implements the emergency location broadcast HUD and search filtersImplements the emergency location broadcast HUD and search filtersImplements the emergency location broadcast HUD and search filtersImplements the emergency location broadcast HUD and search filters",
                    budget: index == 1 ? "\$120" : "\$65",
                    level: "Low urgency",
                    location: "Dhaka, Bangladesh",
                    status: "Complete",
                    onChatTap: () {},
                    onBookAgainTap: () {},
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
