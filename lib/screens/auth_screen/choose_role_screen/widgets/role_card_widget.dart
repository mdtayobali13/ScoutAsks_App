import 'package:flutter/material.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class RoleCardWidget extends StatelessWidget {
  final String role;
  final String value;
  final String imagePath;
  final IconData iconFallback;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleCardWidget({
    super.key,
    required this.role,
    required this.value,
    required this.imagePath,
    required this.iconFallback,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFEEF2F6),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.green.shade400 : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  imagePath,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    iconFallback,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: role,
                  color: Colors.black87,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.green : Colors.grey.shade400,
                      width: 1.5,
                    ),
                    color: isSelected ? Colors.green : Colors.transparent,
                  ),
                  child: isSelected
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
