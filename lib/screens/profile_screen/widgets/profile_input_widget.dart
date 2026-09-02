import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class ProfileInputWidget extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;

  const ProfileInputWidget({
    super.key,
    required this.label,
    required this.hint,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: label,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        const Gap(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
