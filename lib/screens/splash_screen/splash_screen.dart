import 'package:flutter/material.dart';
import 'package:scoutasks/widgets/app_logo.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/routes/app_routes.dart';
import 'package:scoutasks/routes/app_routes_key.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        AppRoutes.instance.go(AppRoutesKey.instance.signInScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.white50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}
