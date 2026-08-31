import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class RememberMeCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;

  const RememberMeCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label = "Remember",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            side: BorderSide(color: Colors.grey.shade500),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
        const Gap(width: 8),
        AppText(text: label, color: Colors.grey.shade600, fontSize: 14),
      ],
    );
  }
}
