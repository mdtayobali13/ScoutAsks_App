import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/screens/technician_schedule_screen/widgets/review_bottom_sheet.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'job_info_row.dart';

class CompleteJobBottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final String budget;
  final String level;
  final String location;

  const CompleteJobBottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.budget,
    required this.level,
    required this.location,
  });

  static void show(
    BuildContext context, {
    required String title,
    required String description,
    required String budget,
    required String level,
    required String location,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CompleteJobBottomSheet(
        title: title,
        description: description,
        budget: budget,
        level: level,
        location: location,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              const SizedBox(width: 16),
              const Text(
                'Complete job',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4F8), // Light greyish-blue
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'VALID',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                JobInfoRow(label: 'Budget: ', value: budget, useRichText: true),
                const SizedBox(height: 8),
                JobInfoRow(label: 'Level: ', value: level, useRichText: true),
                const SizedBox(height: 8),
                JobInfoRow(label: 'Location: ', value: location, useRichText: true),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 22),
                        onPressed: () {
                          // Chat logic
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppButton(
                        onTap: () {
                          // Close complete job bottom sheet
                          Navigator.pop(context);
                          // Show review bottom sheet
                          ReviewBottomSheet.show(context);
                        },
                        title: "Review to customer",
                        backgroundColor: AppColors.instance.primary, // Dark blue
                        titleColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
