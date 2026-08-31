import 'package:flutter/material.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class AuthRedirectionText extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onTap;

  const AuthRedirectionText({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          AppText(text: text, color: Colors.grey.shade700),
          InkWell(
            onTap: onTap,
            child: AppText(text: actionText, color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
