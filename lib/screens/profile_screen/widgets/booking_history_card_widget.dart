import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/constant/app_asserts_image_path.dart';

class BookingHistoryCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String budget;
  final String level;
  final String location;
  final String status;
  final VoidCallback onChatTap;
  final VoidCallback onBookAgainTap;

  const BookingHistoryCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.budget,
    required this.level,
    required this.location,
    required this.status,
    required this.onChatTap,
    required this.onBookAgainTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFEFF2F6), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText(text: title, fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  border: Border.all(color: Colors.green.shade400),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: AppText(
                  text: status.toUpperCase(),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade600,
                ),
              ),
            ],
          ),
          const Gap(height: 15),

          // Description
          AppText(text: description, fontSize: 13, color: Colors.grey.shade600, height: 1.4),
          const Gap(height: 15),

          // Details
          _buildDetailRow("Budget:", budget),
          const Gap(height: 8),
          _buildDetailRow("Level:", level),
          const Gap(height: 8),
          _buildDetailRow("Location:", location),
          const Gap(height: 20),

          // Footer Buttons
          Row(
            children: [
              InkWell(
                onTap: onChatTap,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.grey.shade600, borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(
                    AppAssertsImagePath.instance.massageIcon,
                    width: 20,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(width: 15),
              Expanded(
                child: AppButton(
                  title: "Book again",
                  onTap: onBookAgainTap,
                  backgroundColor: AppColors.instance.primaryBrandBlue,
                  titleColor: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  height: 44,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: label, fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
        const Gap(width: 5),
        Expanded(
          child: AppText(text: value, fontSize: 14, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
