import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/constant/app_colors.dart';

class RevisionBottomSheet extends StatelessWidget {
  const RevisionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Padding at the bottom for the keyboard
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    
    return Container(
      decoration: BoxDecoration(
        color: AppColors.instance.primaryBrandBlue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 20 + bottomInset,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: Colors.white, size: 24),
            ),
            const Gap(height: 20),
            
            AppText(
              text: "Revision",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            const Gap(height: 15),
            
            // Text Input
            TextField(
              maxLines: 4,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Input your review",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                contentPadding: const EdgeInsets.all(15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white, width: 1.5),
                ),
              ),
            ),
            const Gap(height: 8),
            
            // Notice Text
            Align(
              alignment: Alignment.centerRight,
              child: AppText(
                text: "This revision will go direct message & push notice",
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const Gap(height: 30),
            
            // Submit Button
            AppButton(
              title: "Submit",
              onTap: () {
                Navigator.pop(context);
              },
              backgroundColor: AppColors.instance.primaryBrandOrange,
              titleColor: Colors.white,
              height: 50,
              borderRadius: BorderRadius.circular(8),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
