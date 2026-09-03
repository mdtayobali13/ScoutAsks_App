import 'package:flutter/material.dart';
import 'dashed_border_painter.dart';

class AddPhotoButton extends StatelessWidget {
  final VoidCallback? onTap;

  const AddPhotoButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 65,
        height: 65,
        child: CustomPaint(
          painter: DashedBorderPainter(
            color: Colors.grey.shade600,
            strokeWidth: 1.5,
            dashWidth: 6,
            gap: 4,
            radius: 12,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.black87, size: 20),
                SizedBox(height: 2),
                Text('Add', style: TextStyle(fontSize: 12, color: Colors.black87)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
