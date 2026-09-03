import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/screens/chat_screen/widgets/quotation_row_widget.dart';
import 'package:scoutasks/screens/chat_screen/widgets/split_vat_automation_box.dart';

class QuotationCardWidget extends StatefulWidget {
  const QuotationCardWidget({super.key});

  @override
  State<QuotationCardWidget> createState() => _QuotationCardWidgetState();
}

class _QuotationCardWidgetState extends State<QuotationCardWidget> {
  bool? isAccepted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.instance.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.instance.primaryBrandOrange, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: "Quotation (proposal)", fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
          const Gap(height: 16),
          _buildAddressRow("Registered Office Address:", "2972 Westheimer Rd. Santa\nAna, Illinois 85486"),
          const Gap(height: 8),
          _buildAddressRow("VAT Number:", "BE 0876.543.210"),
          const Gap(height: 16),
          AppText(
            text: "Emergency Bathroom Pipe Repair &\nLeakage sealing",
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          const Gap(height: 15),
          QuotationRowWidget(title: "Labor (4h @ €65/hr)", value: "€260"),
          const Gap(height: 8),
          QuotationRowWidget(title: "Materials Cost", value: "€120"),
          const Gap(height: 8),
          QuotationRowWidget(title: "Parts & Seals", value: "€80"),
          const Gap(height: 16),

          // Split vat automation box
          const SplitVatAutomationBox(backgroundColor: Colors.white),
          const Gap(height: 16),
          QuotationRowWidget(title: "Subtotal (Net)", value: "€460.00"),
          const Gap(height: 8),
          QuotationRowWidget(title: "VAT Amount (6%)", value: "€27.60"),
          const Gap(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "Grand total", fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              AppText(text: "€487", fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
            ],
          ),
          const Gap(height: 20),
          AppButton(
            title: "Withdraw",
            onTap: () {},
            backgroundColor: AppColors.instance.primaryBrandBlue,
            titleColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            height: 45,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: AppText(text: title, fontSize: 11, color: Colors.grey.shade700),
        ),
        Expanded(
          flex: 3,
          child: AppText(text: value, fontSize: 11, color: Colors.grey.shade600, textAlign: TextAlign.right),
        ),
      ],
    );
  }
}
