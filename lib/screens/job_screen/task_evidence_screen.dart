import 'package:flutter/material.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/job_screen/widgets/rate_contractor_bottom_sheet.dart';
import 'package:scoutasks/screens/job_screen/widgets/revision_bottom_sheet.dart';
import 'package:scoutasks/screens/job_screen/widgets/task_evidence_indicator.dart';
import 'package:scoutasks/screens/job_screen/widgets/task_evidence_info_row.dart';
import 'package:scoutasks/constant/app_colors.dart';

class TaskEvidenceScreen extends StatelessWidget {
  const TaskEvidenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  const AuthBackButtonWidget(),
                  const Gap(width: 15),
                  AppText(
                    text: "Task evidence",
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
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.instance.surfaceLight,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Carousel Mockup
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                "https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=600&auto=format&fit=crop",
                                fit: BoxFit.cover,
                              ),
                              // Left Arrow
                              Positioned(
                                left: 10,
                                top: 0,
                                bottom: 0,
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.white.withOpacity(0.8),
                                    child: const Icon(Icons.chevron_left, color: Colors.black87, size: 20),
                                  ),
                                ),
                              ),
                              // Right Arrow
                              Positioned(
                                right: 10,
                                top: 0,
                                bottom: 0,
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: AppColors.instance.primaryBrandBlue,
                                    child: const Icon(Icons.chevron_right, color: Colors.white, size: 20),
                                  ),
                                ),
                              ),
                              // Indicators
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TaskEvidenceIndicator(isActive: false),
                                    const Gap(width: 6),
                                    TaskEvidenceIndicator(isActive: true),
                                    const Gap(width: 6),
                                    TaskEvidenceIndicator(isActive: false),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(height: 20),
                      
                      // Details
                      TaskEvidenceInfoRow(label: "Issue name: ", value: "Water Leak"),
                      const Gap(height: 12),
                      TaskEvidenceInfoRow(
                        label: "Descriptions: ",
                        value: "That's the complete Contractor journey end-to-end. Let me know if you want the Super Admin flow next.",
                      ),
                      const Gap(height: 12),
                      TaskEvidenceInfoRow(label: "Time: ", value: "05:15 Pm (09/05/2026)"),
                      const Gap(height: 12),
                      TaskEvidenceInfoRow(label: "End Time: ", value: "05:15 Pm (10/05/2026)"),
                      const Gap(height: 12),
                      TaskEvidenceInfoRow(label: "Status: ", value: "Completed"),
                      
                      const Gap(height: 30),
                      
                      // Buttons
                      AppButton(
                        title: "Complete & Rate",
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const RateContractorBottomSheet(),
                          );
                        },
                        backgroundColor: AppColors.instance.primaryBrandBlue,
                        titleColor: Colors.white,
                        height: 50,
                        borderRadius: BorderRadius.circular(8),
                        fontWeight: FontWeight.w600,
                      ),
                      const Gap(height: 15),
                      AppButton(
                        title: "Revision",
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const RevisionBottomSheet(),
                          );
                        },
                        backgroundColor: Colors.grey.shade600,
                        titleColor: Colors.white,
                        height: 50,
                        borderRadius: BorderRadius.circular(8),
                        fontWeight: FontWeight.w600,
                      ),
                      const Gap(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
