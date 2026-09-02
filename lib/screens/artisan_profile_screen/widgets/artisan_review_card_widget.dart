import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class ArtisanReviewCardWidget extends StatelessWidget {
  final String name;
  final double rating;
  final String date;
  final String content;
  final String imageUrl;
  final Color avatarBgColor;

  const ArtisanReviewCardWidget({
    super.key,
    required this.name,
    required this.rating,
    required this.date,
    required this.content,
    required this.imageUrl,
    required this.avatarBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: avatarBgColor, shape: BoxShape.circle),
              child: ClipOval(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
            const Gap(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: name, fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
                  const Gap(height: 5),
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          Icon(index < rating.floor() ? Icons.star : Icons.star_border, color: Colors.amber, size: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(height: 10),
        AppText(text: date, fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w500),
        const Gap(height: 5),
        AppText(text: content, fontSize: 13, color: Colors.grey.shade600, maxLines: 4, height: 1.4),
      ],
    );
  }
}
