import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/constant/app_asserts_image_path.dart';
import 'package:scoutasks/screens/job_screen/task_evidence_screen.dart';
import 'package:scoutasks/screens/job_screen/widgets/job_info_row_widget.dart';

enum JobStatus { inProgress, complete, offers }

class JobCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String budget;
  final String level;
  final String location;
  final JobStatus status;

  // For 'Offers' status
  final String? profileName;
  final String? profileImage;
  final double? profileRating;
  final String? profileType;
  final bool isVerified;

  const JobCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.budget,
    required this.level,
    required this.location,
    required this.status,
    this.profileName,
    this.profileImage,
    this.profileRating,
    this.profileType,
    this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    Color badgeColor;
    String badgeText;
    String buttonText;

    switch (status) {
      case JobStatus.inProgress:
        badgeColor = AppColors.instance.jobStatusInProgress;
        badgeText = "INPROGRESS";
        buttonText = "In Progress";
        break;
      case JobStatus.complete:
        badgeColor = AppColors.instance.jobStatusComplete;
        badgeText = "COMPLETE";
        buttonText = "View Evidence";
        break;
      case JobStatus.offers:
        badgeColor = AppColors.instance.jobStatusOffers;
        badgeText = "OFFERS";
        buttonText = "Accept offer";
        break;
    }

    return Container(
      margin: EdgeInsets.only(bottom: AppSize.width(value: 15)),
      padding: EdgeInsets.all(AppSize.width(value: 15)),
      decoration: BoxDecoration(color: AppColors.instance.surfaceLight, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (status == JobStatus.offers && profileName != null) ...[
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profileImage ?? ""),
                  onBackgroundImageError: (_, __) {},
                  child: profileImage == null ? const Icon(Icons.person) : null,
                ),
                const Gap(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AppText(text: profileName!, fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                          if (isVerified) ...[
                            const Gap(width: 5),
                            const Icon(Icons.verified, color: Colors.blue, size: 16),
                          ],
                        ],
                      ),
                      AppText(text: profileType ?? "", fontSize: 12, color: Colors.grey.shade600),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 18),
                    const Gap(width: 4),
                    AppText(
                      text: profileRating?.toString() ?? "",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ],
            ),
            const Gap(height: 15),
          ],

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppText(text: title, fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: badgeColor),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: AppText(text: badgeText, fontSize: 10, fontWeight: FontWeight.w600, color: badgeColor),
              ),
            ],
          ),
          const Gap(height: 10),
          AppText(text: description, fontSize: 12, color: Colors.grey.shade600, height: 1.4),
          const Gap(height: 15),
          JobInfoRowWidget(label: "Budget: ", value: budget),
          const Gap(height: 8),
          JobInfoRowWidget(label: "Level: ", value: level),
          const Gap(height: 8),
          JobInfoRowWidget(label: "Location: ", value: location),
          const Gap(height: 15),
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.grey.shade500, borderRadius: BorderRadius.circular(8)),
                child: Image.asset(AppAssertsImagePath.instance.massageIcon, color: Colors.white),
              ),
              const Gap(width: 15),
              Expanded(
                child: AppButton(
                  height: 45,
                  padding: EdgeInsets.zero,
                  onTap: () {
                    if (status == JobStatus.complete) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const TaskEvidenceScreen()));
                    }
                  },
                  title: buttonText,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  backgroundColor: AppColors.instance.primaryBrandBlue,
                  titleColor: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
