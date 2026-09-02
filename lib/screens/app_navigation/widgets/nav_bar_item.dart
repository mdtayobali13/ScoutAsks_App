import 'package:flutter/material.dart';



class NavBarItem extends StatelessWidget {
  final bool isSelected;
  final IconData? icon;
  final IconData? filledIcon;
  final String? assetPath;
  final String label;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.isSelected,
    this.icon,
    this.filledIcon,
    this.assetPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 70,
        height: 65,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.shade400 : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (assetPath != null)
              Image.asset(
                assetPath!,
                width: 24,
                height: 24,
                color: isSelected ? Colors.white : Colors.grey.shade500,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.image_not_supported_outlined, color: isSelected ? Colors.white : Colors.grey.shade500, size: 24),
              )
            else
              Icon(
                isSelected ? (filledIcon ?? icon) : icon,
                color: isSelected ? Colors.white : Colors.grey.shade500,
                size: 24,
              ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
