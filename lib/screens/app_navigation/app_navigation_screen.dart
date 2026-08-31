import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/screens/app_navigation/widgets/custom_bottom_nav_bar.dart';

class AppNavigationScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppNavigationScreen({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.black600,
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavBar(currentIndex: navigationShell.currentIndex, onTap: _onTap),
    );
  }
}
