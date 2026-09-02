import 'package:flutter/material.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';

class HomeSearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPostJobTap;

  const HomeSearchBarWidget({super.key, required this.controller, required this.onPostJobTap});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: AppInputWidgetTwo(
              padding: EdgeInsets.zero,
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppSize.width(value: 15),
                vertical: AppSize.width(value: 15),
              ),
              hintText: "What service do you need?",
              controller: controller,
              fillColor: const Color(0xFFEFF2F6),
              borderColor: Colors.grey.shade400,
              maxLines: 1,
            ),
          ),
          const Gap(width: 10),
          Expanded(
            flex: 3,
            child: AppButton(
              height: double.infinity,
              padding: EdgeInsets.zero,
              onTap: onPostJobTap,
              title: "Post a job",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              backgroundColor: const Color(0xFF143B66),
              titleColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
