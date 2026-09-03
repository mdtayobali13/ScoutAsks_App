import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/chat_screen/widgets/quotation_row_widget.dart';
import 'package:scoutasks/screens/chat_screen/widgets/split_vat_automation_box.dart';

class CreateQuotationBottomSheet extends StatelessWidget {
  const CreateQuotationBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const CreateQuotationBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Close button and title
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: Colors.red.shade50, shape: BoxShape.circle),
                  child: Icon(Icons.close, color: Colors.red.shade300, size: 16),
                ),
              ),
            ),
            const Gap(height: 8),
            AppText(
              text: "Create Devis (Itemized\nQuotation)",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            const Gap(height: 24),

            // Form fields
            const FormLabelWidget(text: "Quotation Number"),
            const FormTextFieldWidget(hint: "e.g. Q-2026-001"),
            const Gap(height: 16),

            const FormLabelWidget(text: "Labor hours expected"),
            const FormTextFieldWidget(hint: "4"),
            const Gap(height: 16),

            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabelWidget(text: "Month"),
                      const FormDropdownWidget(hint: "July"),
                    ],
                  ),
                ),
                const Gap(width: 16),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabelWidget(text: "Day"),
                      const FormDropdownWidget(hint: "26"),
                    ],
                  ),
                ),
                const Spacer(flex: 3), // This shrinks the dropdowns to take less width
              ],
            ),
            const Gap(height: 16),

            const FormLabelWidget(text: "Per hours (€)"),
            const FormTextFieldWidget(hint: "65"),
            const Gap(height: 16),

            const FormLabelWidget(text: "Parts price (€)"),
            const FormTextFieldWidget(hint: "150"),
            const Gap(height: 16),

            const FormLabelWidget(text: "Material cost (€)"),
            const FormTextFieldWidget(hint: "80"),
            const Gap(height: 24),

            // Summary Section
            AppText(
              text: "Emergency Bathroom Pipe Repair &\nLeakage sealing",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            const Gap(height: 12),
            QuotationRowWidget(title: "Labor (4h @ €65/hr)", value: "€260"),
            const Gap(height: 6),
            QuotationRowWidget(title: "Materials Cost", value: "€120"),
            const Gap(height: 6),
            QuotationRowWidget(title: "Parts", value: "€80"),
            const Gap(height: 16),

            // Split vat automation box
            SplitVatAutomationBox(backgroundColor: AppColors.instance.surfaceLight),
            const Gap(height: 16),

            QuotationRowWidget(title: "Subtotal (Net)", value: "€460.00"),
            const Gap(height: 6),
            QuotationRowWidget(title: "VAT Amount (6%/21%)", value: "Not Include"),
            const Gap(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: "Grand total", fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                AppText(text: "€487", fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ],
            ),
            const Gap(height: 24),

            // Actions
            AppButton(
              title: "Send Quotation",
              onTap: () => Navigator.pop(context),
              backgroundColor: AppColors.instance.primaryBrandBlue,
              titleColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              height: 45,
              fontWeight: FontWeight.w600,
            ),
            const Gap(height: 12),
            AppButton(
              title: "Cancel",
              onTap: () => Navigator.pop(context),
              backgroundColor: Colors.grey.shade600,
              titleColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              height: 45,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

class FormLabelWidget extends StatelessWidget {
  final String text;
  
  const FormLabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: AppText(text: text, fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
    );
  }
}

class FormTextFieldWidget extends StatelessWidget {
  final String hint;

  const FormTextFieldWidget({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: TextField(
        style: const TextStyle(fontSize: 14, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          isDense: true,
        ),
      ),
    );
  }
}

class FormDropdownWidget extends StatelessWidget {
  final String hint;

  const FormDropdownWidget({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(text: hint, fontSize: 13, color: Colors.grey.shade600),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600, size: 20),
        ],
      ),
    );
  }
}
