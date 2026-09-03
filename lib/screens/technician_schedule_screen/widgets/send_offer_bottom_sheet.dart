import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';

class SendOfferBottomSheet extends StatelessWidget {
  final String title;

  const SendOfferBottomSheet({super.key, required this.title});

  static void show(BuildContext context, {required String title}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SendOfferBottomSheet(title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.instance.primaryBrandOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Send offer',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildLabel('Job title ', autoFill: true),
          const SizedBox(height: 8),
          _buildTextField(hint: title),
          const SizedBox(height: 16),
          _buildLabel('Budget'),
          const SizedBox(height: 8),
          _buildTextField(hint: '\$80'),
          const SizedBox(height: 16),
          _buildLabel('Description'),
          const SizedBox(height: 8),
          _buildTextField(hint: 'Describe your task', maxLines: 4),
          const SizedBox(height: 24),
          AppButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: "Send offer",
            backgroundColor: AppColors.instance.primaryBrandBlue,
            titleColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          const SizedBox(height: 12),
          AppButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: "Cancel",
            backgroundColor: Colors.grey.shade600,
            titleColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text, {bool autoFill = false}) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        if (autoFill)
          Text(
            '(Auto fill)',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }

  Widget _buildTextField({required String hint, int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      style: const TextStyle(fontSize: 14, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.instance.primaryBrandOrange),
        ),
      ),
    );
  }
}
