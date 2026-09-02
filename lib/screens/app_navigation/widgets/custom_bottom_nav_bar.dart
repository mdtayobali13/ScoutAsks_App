import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_asserts_image_path.dart';
import 'package:scoutasks/screens/app_navigation/widgets/nav_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF2F6),
        border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarItem(label: "Home", isSelected: currentIndex == 0, assetPath: AppAssertsImagePath.instance.navHome, onTap: () => onTap(0)),
            NavBarItem(label: "Job", isSelected: currentIndex == 1, assetPath: AppAssertsImagePath.instance.navJob, onTap: () => onTap(1)),
            NavBarItem(label: "Chat", isSelected: currentIndex == 2, assetPath: AppAssertsImagePath.instance.navChat, onTap: () => onTap(2)),
            NavBarItem(label: "Profile", isSelected: currentIndex == 3, assetPath: AppAssertsImagePath.instance.navProfile, onTap: () => onTap(3)),
          ],
        ),
      ),
    );
  }
}
