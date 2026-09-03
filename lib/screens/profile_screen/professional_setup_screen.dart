import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/constant/app_colors.dart';

class ProfessionalSetupScreen extends StatelessWidget {
  const ProfessionalSetupScreen({super.key});

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
                    text: "Professional Setup",
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
                    
                    AppInputWidgetTwo(
                      title: "Office location",
                      titleFontSize: 16,
                      fontWeight: FontWeight.w500,
                      hintText: "Enter",
                      fillColor: Colors.white,
                      borderColor: Colors.grey,
                    ),
                    const Gap(height: 15),
                    
                    AppInputWidgetTwo(
                      title: "Business Description",
                      titleFontSize: 16,
                      fontWeight: FontWeight.w500,
                      hintText: "Enter full name",
                      fillColor: Colors.white,
                      borderColor: Colors.grey,
                    ),
                    const Gap(height: 15),
                    
                    AppInputWidgetTwo(
                      title: "Service radius (km)",
                      titleFontSize: 16,
                      fontWeight: FontWeight.w500,
                      hintText: "10",
                      fillColor: Colors.white,
                      borderColor: Colors.grey,
                    ),
                    const Gap(height: 15),
                    
                    Row(
                      children: [
                        Expanded(
                          child: AppInputWidgetTwo(
                            title: "Open",
                            titleFontSize: 16,
                            fontWeight: FontWeight.bold,
                            hintText: "08:00",
                            fillColor: Colors.white,
                            borderColor: Colors.grey,
                          ),
                        ),
                        const Gap(width: 15),
                        Expanded(
                          child: AppInputWidgetTwo(
                            title: "close",
                            titleFontSize: 16,
                            fontWeight: FontWeight.bold,
                            hintText: "20:00",
                            fillColor: Colors.white,
                            borderColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    
                    const Gap(height: 40),
                    
                    // Save Changes Button
                    AppButton(
                      title: "Save changes",
                      onTap: () {
                        // handle save
                        Navigator.pop(context);
                      },
                      backgroundColor: AppColors.instance.primaryBrandBlue,
                      titleColor: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      height: 50,
                      width: double.infinity,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    const Gap(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
