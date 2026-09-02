import 'package:flutter/material.dart';

class JobInfoRowWidget extends StatelessWidget {
  final String label;
  final String value;
  
  const JobInfoRowWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: label,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 14),
          ),
          TextSpan(
            text: value,
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey.shade700, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
