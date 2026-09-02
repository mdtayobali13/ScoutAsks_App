import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class ArtisanCardWidget extends StatelessWidget {
  final String name;
  final String reviews;
  final String rate;
  final String imageUrl;
  final bool isTopRated;

  const ArtisanCardWidget({
    super.key,
    required this.name,
    required this.reviews,
    required this.rate,
    required this.imageUrl,
    this.isTopRated = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF2F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.grey.shade300,
          ),
          const Gap(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                      text: name,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    const Gap(width: 5),
                    const Icon(Icons.verified, color: Colors.blueAccent, size: 16),
                  ],
                ),
                const Gap(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const Gap(width: 5),
                    AppText(
                      text: reviews,
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                text: rate,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
              if (isTopRated) ...[
                const Gap(height: 5),
                AppText(
                  text: "Top rated",
                  fontSize: 12,
                  color: Colors.orange.shade400,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
