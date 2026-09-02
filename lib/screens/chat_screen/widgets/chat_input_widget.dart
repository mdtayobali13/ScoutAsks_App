import 'package:flutter/material.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/constant/app_colors.dart';

class ChatInputWidget extends StatelessWidget {
  const ChatInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.instance.surfaceLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.instance.primaryBrandOrange, width: 1),
        ),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                style:  TextStyle(color: Colors.black87, fontSize: 14),
                decoration:  InputDecoration(
                  hintText: "Say something.......",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.instance.primaryBrandBlue,
                borderRadius: BorderRadius.circular(6),
              ),
              child: AppText(
                text: "Send",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
