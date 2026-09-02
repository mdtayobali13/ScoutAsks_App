import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/constant/app_colors.dart';

class ReportReviewBottomSheet extends StatefulWidget {
  const ReportReviewBottomSheet({super.key});

  @override
  State<ReportReviewBottomSheet> createState() => _ReportReviewBottomSheetState();
}

class _ReportReviewBottomSheetState extends State<ReportReviewBottomSheet> {
  final List<String> _reportOptions = [
    "False Review",
    "Abuse",
    "Off Topic",
    "Misleading",
    "Policy Violation",
    "Spam",
    "Mistake",
    "Other",
  ];
  
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._reportOptions.map((option) {
            bool isSelected = _selectedOption == option;
            return InkWell(
              onTap: () {
                setState(() {
                  _selectedOption = option;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.green, // Both selected and unselected have green border in design
                          width: 1.5,
                        ),
                      ),
                      child: isSelected
                          ? const Center(
                              child: Icon(Icons.check_circle, size: 20, color: Colors.green),
                            )
                          : null,
                    ),
                    const Gap(width: 15),
                    AppText(
                      text: option,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
            );
          }),
          
          if (_selectedOption == "Other") ...[
            const Gap(height: 15),
            TextField(
              decoration: InputDecoration(
                hintText: "enter your comment",
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: const EdgeInsets.only(bottom: 8),
                isDense: true,
              ),
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
          
          const Gap(height: 30),
          
          AppButton(
            title: "Submit",
            onTap: () {
              Navigator.pop(context);
            },
            backgroundColor: AppColors.instance.primaryBrandBlue,
            titleColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            height: 50,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          // Add padding for bottom safe area
          Gap(height: MediaQuery.of(context).viewInsets.bottom + 10),
        ],
      ),
    );
  }
}
