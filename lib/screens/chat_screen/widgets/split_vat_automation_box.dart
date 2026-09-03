import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class SplitVatAutomationBox extends StatelessWidget {
  final Color backgroundColor;
  
  const SplitVatAutomationBox({
    super.key,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "Split vat automation", fontWeight: FontWeight.bold, fontSize: 14),
              AppText(text: "Tax Rule", color: Colors.grey.shade600, fontSize: 12),
            ],
          ),
          const Gap(height: 4),
          AppText(
            text: "Properties older than 10 years qualify for 6% VAT. Newer builds are taxed at 21%.",
            fontSize: 11,
            color: Colors.grey.shade600,
          ),
          const Gap(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.instance.primaryBrandBlue),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: AppText(
                      text: "<10 YRS (21% VAT)",
                      color: AppColors.instance.primaryBrandBlue,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Gap(width: 8),
              Expanded(
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.instance.primaryBrandBlue,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: AppText(
                      text: ">10 YRS (6% VAT)",
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
