import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

enum WithdrawalStatus {
  pending,
  processing,
  success,
  rejected,
}

class WithdrawalCardWidget extends StatelessWidget {
  final String initials;
  final String name;
  final WithdrawalStatus status;
  final String id;
  final String method;
  final String amount;
  final String date;

  const WithdrawalCardWidget({
    super.key,
    required this.initials,
    required this.name,
    required this.status,
    required this.id,
    required this.method,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF2F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: AppText(
                  text: initials,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.instance.primaryBrandBlue,
                ),
              ),
              const Gap(width: 12),
              Expanded(
                child: AppText(
                  text: name,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              _buildStatusPill(status),
            ],
          ),
          const Gap(height: 16),
          Divider(color: Colors.grey.shade300, height: 1, thickness: 1),
          const Gap(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: "ID &\nMETHOD", fontSize: 10, color: Colors.grey.shade500, height: 1.2),
                  const Gap(height: 8),
                  AppText(text: id, fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.instance.primaryBrandBlue),
                  const Gap(height: 4),
                  AppText(text: method, fontSize: 12, color: Colors.grey.shade600),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppText(text: "PAYOUT", fontSize: 10, color: Colors.grey.shade500),
                  const Gap(height: 8),
                  AppText(text: amount, fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                  const Gap(height: 4),
                  AppText(text: date, fontSize: 12, color: Colors.grey.shade600),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusPill(WithdrawalStatus status) {
    Color bgColor;
    Color textColor;
    String text;

    switch (status) {
      case WithdrawalStatus.pending:
        bgColor = Colors.yellow.shade100;
        textColor = Colors.brown.shade800;
        text = "Pending";
        break;
      case WithdrawalStatus.processing:
        bgColor = Colors.blue.shade50;
        textColor = Colors.blue.shade700;
        text = "Processing";
        break;
      case WithdrawalStatus.success:
        bgColor = Colors.green.shade50;
        textColor = Colors.green.shade700;
        text = "Success";
        break;
      case WithdrawalStatus.rejected:
        bgColor = Colors.red.shade50;
        textColor = Colors.red.shade700;
        text = "Rejected";
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: AppText(
        text: text,
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }
}
