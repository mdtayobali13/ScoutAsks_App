import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class ArtisanFullCardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isVerified;
  final double rating;
  final String category;
  final String distance;
  final String hourlyRate;
  final String responseTime;
  final VoidCallback onChatTap;
  final VoidCallback onViewProfileTap;

  const ArtisanFullCardWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    this.isVerified = true,
    required this.rating,
    required this.category,
    required this.distance,
    required this.hourlyRate,
    required this.responseTime,
    required this.onChatTap,
    required this.onViewProfileTap,
  });

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: AppSize.width(value: 15)),
      padding: EdgeInsets.all(AppSize.width(value: 15)),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF2F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 180,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported, color: Colors.grey),
              ),
            ),
          ),
          const Gap(height: 15),

          // Name and Rating Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppText(
                    text: name,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  if (isVerified) ...[
                    const Gap(width: 5),
                    const Icon(
                      Icons.verified,
                      color: Colors.blue,
                      size: 16,
                    ),
                  ],
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 18,
                  ),
                  const Gap(width: 4),
                  AppText(
                    text: rating.toString(),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ],
              ),
            ],
          ),
          const Gap(height: 15),

          // Info Rows
          _buildInfoRow("Category", category),
          _buildInfoRow("Distance", distance),
          _buildInfoRow("Hourly rate", hourlyRate),
          _buildInfoRow("Response time", responseTime),
          const Gap(height: 10),

          // Action Buttons
          Row(
            children: [
              // Chat Button
              InkWell(
                onTap: onChatTap,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 50,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    CupertinoIcons.chat_bubble_text,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
              const Gap(width: 15),
              // View Profile Button
              Expanded(
                child: AppButton(
                  height: 45,
                  padding: EdgeInsets.zero,
                  onTap: onViewProfileTap,
                  title: "View profile",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  backgroundColor: const Color(0xFF143B66),
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
  
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "$label: ",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
