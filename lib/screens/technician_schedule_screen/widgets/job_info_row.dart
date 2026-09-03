import 'package:flutter/material.dart';

class JobInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool useRichText;

  const JobInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.useRichText = false,
  });

  @override
  Widget build(BuildContext context) {
    if (useRichText) {
      return RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      );
    }
    
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}
