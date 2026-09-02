import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class HomeSosFormWidget extends StatefulWidget {
  final VoidCallback onBackTap;
  final VoidCallback onBroadcastGpsTap;

  const HomeSosFormWidget({super.key, required this.onBackTap, required this.onBroadcastGpsTap});

  @override
  State<HomeSosFormWidget> createState() => _HomeSosFormWidgetState();
}

class _HomeSosFormWidgetState extends State<HomeSosFormWidget> {
  final ValueNotifier<String?> selectedService = ValueNotifier<String?>("Water leak");
  final ValueNotifier<String?> selectedPriority = ValueNotifier<String?>("High urgency");

  final List<String> services = ["Water leak", "Fire", "Medical emergency", "Gas leak"];
  final List<String> priorities = ["High urgency", "Medium urgency", "Low urgency"];

  @override
  void dispose() {
    selectedService.dispose();
    selectedPriority.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.width(value: 20)),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF5F5), // Very light red/pink tint
        border: Border.all(color: Colors.red.shade400, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel("Select service"),
          _buildDropdown(
            valueNotifier: selectedService,
            items: services,
          ),
          const Gap(height: 20),
          _buildLabel("Select dispatch priority"),
          _buildDropdown(
            valueNotifier: selectedPriority,
            items: priorities,
          ),
          const Gap(height: 25),
          Row(
            children: [
              // Back Button
              AppButton(
                height: 50,
                width: 80,
                padding: EdgeInsets.zero,
                onTap: widget.onBackTap,
                title: "Back",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                backgroundColor: Colors.grey.shade600,
                titleColor: Colors.white,
                borderColor: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(8),
              ),
              const Gap(width: 15),
              // Broadcast GPS Button
              Expanded(
                child: AppButton(
                  height: 50,
                  padding: EdgeInsets.zero,
                  onTap: widget.onBroadcastGpsTap,
                  title: "Broadcast GPS",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  backgroundColor: const Color(0xFF143B66),
                  titleColor: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AppText(text: text, fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87),
    );
  }

  Widget _buildDropdown({required ValueNotifier<String?> valueNotifier, required List<String> items}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400),
      ),
      padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 12)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          valueListenable: valueNotifier,
          isExpanded: true,
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.black87),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: (val) {
            valueNotifier.value = val;
          },
          items: items.map<DropdownItem<String>>((String item) {
            return DropdownItem<String>(
              value: item, 
              child: Text(
                item,
                style: const TextStyle(
                  color: Colors.black, 
                  fontSize: 14, 
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
