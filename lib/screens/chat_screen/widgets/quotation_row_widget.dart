import 'package:flutter/material.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class QuotationRowWidget extends StatelessWidget {
  final String title;
  final String value;
  
  const QuotationRowWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(text: title, fontSize: 13, color: Colors.black87),
        AppText(text: value, fontSize: 13, color: Colors.grey.shade700),
      ],
    );
  }
}
