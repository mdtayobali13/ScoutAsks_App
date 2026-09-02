import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/constant/app_colors.dart';

class PasswordManageScreen extends StatelessWidget {
  const PasswordManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  const AuthBackButtonWidget(),
                  const Gap(width: 15),
                  AppText(
                    text: "Password manage",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(height: 20),
                    
                    // Form Fields
                    AppInputWidgetTwo(
                      title: "Old Password",
                      titleFontSize: 16,
                      fontWeight: FontWeight.bold,
                      hintText: "Enter old password",
                      prefix: Icon(Icons.lock_outline, color: Colors.grey.shade500),
                      isPassWord: true,
                      fillColor: Colors.white,
                      borderColor: Colors.grey,
                    ),
                    const Gap(height: 15),
                    
                    AppInputWidgetTwo(
                      title: "New Password",
                      titleFontSize: 16,
                      fontWeight: FontWeight.bold,
                      hintText: "Enter new password",
                      prefix: Icon(Icons.lock_outline, color: Colors.grey.shade500),
                      isPassWord: true,
                      fillColor: Colors.white,
                      borderColor: Colors.grey,
                    ),
                    const Gap(height: 15),
                    
                    AppInputWidgetTwo(
                      title: "Confirm password",
                      titleFontSize: 16,
                      fontWeight: FontWeight.bold,
                      hintText: "Confirm new password",
                      prefix: Icon(Icons.lock_outline, color: Colors.grey.shade500),
                      isPassWord: true,
                      fillColor: Colors.white,
                      borderColor: Colors.grey,
                    ),
                    const Gap(height: 30),
                  ],
                ),
              ),
            ),
            
            // Save Changes Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: AppButton(
                title: "Save changes",
                onTap: () {},
                backgroundColor: AppColors.instance.primaryBrandBlue,
                titleColor: Colors.white,
                borderRadius: BorderRadius.circular(8),
                height: 50,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
