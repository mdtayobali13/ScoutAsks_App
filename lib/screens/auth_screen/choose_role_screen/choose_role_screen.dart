import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/constant/app_asserts_image_path.dart';
import 'package:scoutasks/routes/app_routes.dart';
import 'package:scoutasks/routes/app_routes_key.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'widgets/role_card_widget.dart';

class ChooseRoleScreen extends ConsumerStatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  ConsumerState<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends ConsumerState<ChooseRoleScreen> {
  String selectedRole = 'customer'; // 'customer' or 'technician'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(height: 20),
              // Back button and Title Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => AppRoutes.instance.pop(),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                    ),
                  ),
                  const Gap(width: 15),
                  Expanded(
                    child: AppText(
                      text: "Choose your role.",
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const Gap(height: 15),
              // Subtitle
              Center(
                child: AppText(
                  text: "Choose the role that best describes\nyou to continue.",
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),
              const Gap(height: 30),
              // Role Cards
              Row(
                children: [
                  Expanded(
                    child: RoleCardWidget(
                      role: "Customer",
                      value: "customer",
                      imagePath: AppAssertsImagePath.instance.customerImage,
                      iconFallback: Icons.person,
                      isSelected: selectedRole == "customer",
                      onTap: () {
                        setState(() {
                          selectedRole = "customer";
                        });
                      },
                    ),
                  ),
                  const Gap(width: 15),
                  Expanded(
                    child: RoleCardWidget(
                      role: "Technician",
                      value: "technician",
                      imagePath: AppAssertsImagePath.instance.technicianImage,
                      iconFallback: Icons.engineering,
                      isSelected: selectedRole == "technician",
                      onTap: () {
                        setState(() {
                          selectedRole = "technician";
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Gap(height: 40),
              // Next Button
              AppButton(
                onTap: () {
                  AppRoutes.instance.pushNamed(AppRoutesKey.instance.signUpScreen);
                },
                title: "Next",
                backgroundColor: const Color(0xFF143B66),
                titleColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 12)),
              ),
              const Gap(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
