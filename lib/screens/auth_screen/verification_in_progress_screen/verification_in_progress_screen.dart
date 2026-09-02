import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/routes/app_routes.dart';
import 'package:scoutasks/routes/app_routes_key.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class VerificationInProgressScreen extends ConsumerWidget {
  const VerificationInProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: InkWell(
            onTap: () => AppRoutes.instance.goNamed(AppRoutesKey.instance.signInScreen),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
            ),
          ),
        ),
        title: AppText(
          text: "Wafting",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF262626),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // Hourglass Icon/Image
              Container(
                height: 108,
                width: 108,
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.hourglass_bottom_rounded,
                    color: Colors.orange,
                    size: 60,
                  ),
                ),
              ),
              const Gap(height: 20),
              // Title
              AppText(
                text: "Request Sent!",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF262626),
                textAlign: TextAlign.center,
              ),
              const Gap(height: 15),
              // Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AppText(
                  text: "Your request to join scoutasks FC is being reviewed by the club administrator. Weill notify you once it's approved.",
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  textAlign: TextAlign.center,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              // Bottom Button
              AppButton(
                onTap: () {
                  AppRoutes.instance.goNamed(AppRoutesKey.instance.signInScreen);
                },
                title: "Waiting for approve",
                backgroundColor: const Color(0xFF6D6D6D), // Grey color from image
                titleColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 12)),
              ),
              const Gap(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
