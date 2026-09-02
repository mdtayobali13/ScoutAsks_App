import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/constant/app_colors.dart';

class RateContractorBottomSheet extends StatefulWidget {
  const RateContractorBottomSheet({super.key});

  @override
  State<RateContractorBottomSheet> createState() => _RateContractorBottomSheetState();
}

class _RateContractorBottomSheetState extends State<RateContractorBottomSheet> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    // We add padding at the bottom for the keyboard
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
            // Close Button
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: Colors.white, size: 24),
            ),
            const Gap(height: 20),
            
            AppText(
              text: "Tap the stars to rate this Contractor",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            const Gap(height: 15),
            
            // Star Rating
            Row(
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                );
              }),
            ),
            const Gap(height: 25),
            
            AppText(
              text: "Write something",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            const Gap(height: 10),
            
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
