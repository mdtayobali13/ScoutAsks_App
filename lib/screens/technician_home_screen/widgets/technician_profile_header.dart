import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';

import 'wave_pattern_painter.dart';

class TechnicianProfileHeader extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;
  final bool isVerified;
  final bool isDispatchAreaOn;
  final ValueChanged<bool> onDispatchAreaChanged;
  final String serviceRadius;

  const TechnicianProfileHeader({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.role,
    this.isVerified = true,
    required this.isDispatchAreaOn,
    required this.onDispatchAreaChanged,
    required this.serviceRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.instance.surfaceLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Background wave pattern representation (Custom Painter)
            Positioned(
              right: -20,
              top: -20,
              child: CustomPaint(
                size: const Size(100, 100),
                painter: WavePatternPainter(),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(imageUrl),
                      backgroundColor: Colors.pink.shade100,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.instance.primary,
                                ),
                              ),
                              if (isVerified) ...[
                                const SizedBox(width: 6),
                                Icon(
                                  Icons.verified,
                                  color: AppColors.instance.blue,
                                  size: 18,
                                ),
                              ]
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            role,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.instance.gray400,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dispatches area',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.instance.primary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Service radius: $serviceRadius',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.instance.gray400,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: isDispatchAreaOn,
                        onChanged: onDispatchAreaChanged,
                        thumbColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.instance.primaryBrandOrange;
                          }
                          return Colors.white;
                        }),
                        trackColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.white;
                          }
                          return AppColors.instance.gray200;
                        }),
                        trackOutlineColor: WidgetStateProperty.all(Colors.grey.shade300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

