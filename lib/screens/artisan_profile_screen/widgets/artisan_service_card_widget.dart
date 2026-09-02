import 'package:flutter/material.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class ArtisanServiceCardWidget extends StatelessWidget {
  final String title;
  final String? rate;
  final String type;
  final String imageUrl;
  final VoidCallback? onTap;
  final bool isProject;

  const ArtisanServiceCardWidget({
    super.key,
    required this.title,
    this.rate,
    required this.type,
    required this.imageUrl,
    this.onTap,
    this.isProject = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEFF2F6),
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AppText(
                            text: title,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        AppText(
                          text: type,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFE99331), // Orange color
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    if (isProject)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            text: "View details",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFE99331),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: Color(0xFFE99331),
                          ),
                        ],
                      )
                    else if (rate != null)
                      AppText(
                        text: rate!,
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
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
