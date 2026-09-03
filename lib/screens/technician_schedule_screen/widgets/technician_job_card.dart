import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'job_info_row.dart';
import 'carousel_dot.dart';

class TechnicianJobCard extends StatelessWidget {
  final String title;
  final String description;
  final String budget;
  final String level;
  final String location;
  final String status; //
  final String actionText;
  final VoidCallback onChatPressed;
  final VoidCallback onActionPressed;

  // New fields for the updated design
  final String? userName;
  final String? userRole;
  final double? userRating;
  final String? userAvatar;
  final List<String>? images;
  final Color? statusColorOverride;

  const TechnicianJobCard({
    super.key,
    required this.title,
    required this.description,
    required this.budget,
    required this.level,
    required this.location,
    required this.status,
    required this.actionText,
    required this.onChatPressed,
    required this.onActionPressed,
    this.userName,
    this.userRole,
    this.userRating,
    this.userAvatar,
    this.images,
    this.statusColorOverride,
  });

  @override
  Widget build(BuildContext context) {
    bool isInProgress = status.toUpperCase() == 'INPROGRESS';
    bool isComplete = status.toUpperCase() == 'COMPLETE';

    Color statusColor =
        statusColorOverride ??
        (isInProgress
            ? AppColors.instance.primaryBrandOrange
            : (isComplete ? AppColors.instance.success : Colors.redAccent));

    Color statusBgColor = statusColor.withValues(alpha: 0.1);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.instance.surfaceLight, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (userName != null) ...[
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: userAvatar != null ? NetworkImage(userAvatar!) : null,
                  child: userAvatar == null ? const Icon(Icons.person, color: Colors.grey) : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            userName!,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.verified, color: Colors.blue, size: 14),
                        ],
                      ),
                      Text(userRole ?? 'Customer', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                    ],
                  ),
                ),
                if (userRating != null)
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(userRating.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 16),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  border: Border.all(color: statusColor.withValues(alpha: 0.5)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  status.toUpperCase(),
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: statusColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600, height: 1.4),
          ),
          const SizedBox(height: 16),
          JobInfoRow(label: 'Budget: ', value: budget),
          const SizedBox(height: 6),
          JobInfoRow(label: 'Level: ', value: level),
          const SizedBox(height: 6),
          JobInfoRow(label: 'Location: ', value: location),
          if (images != null && images!.isNotEmpty) ...[
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 160,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.network(
                      images!.first,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 160,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 160,
                        color: Colors.grey.shade300,
                        child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
                      ),
                    ),
                    Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white.withValues(alpha: 0.8),
                              radius: 14,
                              child: const Icon(Icons.chevron_left, size: 18, color: Colors.black87),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: AppColors.instance.primaryBrandBlue,
                              radius: 14,
                              child: const Icon(Icons.chevron_right, size: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CarouselDot(isActive: false),
                          const SizedBox(width: 4),
                          CarouselDot(isActive: true),
                          const SizedBox(width: 4),
                          CarouselDot(isActive: false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(color: Colors.grey.shade600, borderRadius: BorderRadius.circular(8)),
                child: IconButton(
                  icon: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 20),
                  onPressed: onChatPressed,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: onActionPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.instance.primary, // Dark blue
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: Text(
                      actionText,
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
