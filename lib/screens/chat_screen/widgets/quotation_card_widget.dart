import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/screens/chat_screen/widgets/quotation_row_widget.dart';

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
          AppText(
            text: "Quotation (proposal)",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          const Divider(height: 24, color: Colors.grey),
          AppText(
            text: "Emergency Bathroom Pipe Repair & Leakage sealing",
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
          const Gap(height: 8),
          const Divider(height: 20, color: Colors.grey),
          QuotationRowWidget(title: "Subtotal (Net)", value: "€460.00"),
          const Gap(height: 8),
          QuotationRowWidget(title: "VAT Amount (6%)", value: "€27.60"),
          const Gap(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "Grand total", fontSize: 16, color: Colors.black87),
              AppText(text: "€487", fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
            ],
          ),
          const Gap(height: 20),
          if (isAccepted == null) ...[
            AppButton(
              title: "Accept",
              onTap: () {
                setState(() {
                  isAccepted = true;
                });
              },
              backgroundColor: AppColors.instance.primaryBrandBlue,
              titleColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              height: 45,
              fontWeight: FontWeight.w600,
            ),
            const Gap(height: 10),
            AppButton(
              title: "Cancel",
              onTap: () {
                setState(() {
                  isAccepted = false;
                });
              },
              backgroundColor: Colors.grey.shade600,
              titleColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              height: 45,
              fontWeight: FontWeight.w600,
            ),
          ] else ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isAccepted! ? Colors.green.shade50 : Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: isAccepted! ? Colors.green : Colors.red, width: 1),
              ),
              child: Center(
                child: AppText(
                  text: isAccepted! ? "Quotation Accepted" : "Quotation Canceled",
                  color: isAccepted! ? Colors.green.shade700 : Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
