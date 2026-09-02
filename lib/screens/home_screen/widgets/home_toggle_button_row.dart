import 'package:flutter/material.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class HomeToggleButtonRow extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final Function(String) onSelected;

  const HomeToggleButtonRow({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          final isSelected = item == selectedItem;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () => onSelected(item),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF143B66) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: isSelected ? null : Border.all(color: Colors.grey.shade300),
                ),
                child: AppText(
                  text: item,
                  color: isSelected ? Colors.white : Colors.grey.shade600,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
