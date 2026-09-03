import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddNewCategoryDialog extends StatefulWidget {
  const AddNewCategoryDialog({super.key});

  @override
  State<AddNewCategoryDialog> createState() => _AddNewCategoryDialogState();
}

class _AddNewCategoryDialogState extends State<AddNewCategoryDialog> {
  final ValueNotifier<String?> selectedService = ValueNotifier<String?>(null);
  final ValueNotifier<String?> selectedPrice = ValueNotifier<String?>(null);
  final ValueNotifier<String?> selectedLevel = ValueNotifier<String?>(null);

  @override
  void dispose() {
    selectedService.dispose();
    selectedPrice.dispose();
    selectedLevel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AppText(
                    text: "Add new Categories",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: const Icon(Icons.close, size: 16, color: Colors.red),
                  ),
                ),
              ],
            ),
            const Gap(height: 24),

            // Service Name
            _buildLabel("Service name"),
            const Gap(height: 8),
            _buildDropdown(
              hint: "Select",
              items: ["Plumbing", "Electrical", "Cleaning"],
              valueNotifier: selectedService,
            ),
            const Gap(height: 16),

            // Price and Level Row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Price (€)"),
                      const Gap(height: 8),
                      _buildDropdown(
                        hint: "65",
                        items: ["65", "85", "105", "125"],
                        valueNotifier: selectedPrice,
                      ),
                    ],
                  ),
                ),
                const Gap(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Level"),
                      const Gap(height: 8),
                      _buildDropdown(
                        hint: "Medium Urgency",
                        items: ["Low Urgency", "Medium Urgency", "High Urgency"],
                        valueNotifier: selectedLevel,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(height: 32),

            // Action Buttons
            AppButton(
              title: "Save Categories",
              onTap: () {},
              backgroundColor: AppColors.instance.primaryBrandBlue,
              titleColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              height: 48,
              fontWeight: FontWeight.w600,
            ),
            const Gap(height: 12),
            AppButton(
              title: "Cancel",
              onTap: () => Navigator.pop(context),
              backgroundColor: Colors.grey.shade600,
              titleColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              height: 48,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return AppText(text: text, fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87);
  }

  Widget _buildDropdown({
    required String hint,
    required List<String> items,
    required ValueNotifier<String?> valueNotifier,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          valueListenable: valueNotifier,
          hint: AppText(text: hint, fontSize: 14, color: Colors.black87, maxLines: 1, overflow: TextOverflow.ellipsis),
          items: items
              .map<DropdownItem<String>>(
                (item) => DropdownItem<String>(
                  value: item,
                  child: AppText(text: item, fontSize: 14, color: Colors.black87),
                ),
              )
              .toList(),
          onChanged: (val) {
            valueNotifier.value = val;
          },
          buttonStyleData: const ButtonStyleData(height: 48, padding: EdgeInsets.only(left: 12, right: 12)),
          iconStyleData: IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade700, size: 20),
            iconSize: 20,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
          ),
        ),
      ),
    );
  }
}
