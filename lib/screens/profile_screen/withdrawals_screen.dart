import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/profile_screen/widgets/withdrawal_card_widget.dart';

class WithdrawalsScreen extends StatelessWidget {
  const WithdrawalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.instance.primaryBrandOrange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
            ),
          ),
        ),
        title: AppText(
          text: "Withdrawals",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(height: 20),
              const WithdrawalCardWidget(
                initials: "SJ",
                name: "sarah.j@paypal.com",
                status: WithdrawalStatus.pending,
                id: "WD-1040",
                method: "PayPal",
                amount: "\$840.00",
                date: "Jul 28, 2025",
              ),
              const WithdrawalCardWidget(
                initials: "BT",
                name: "Bank Transfer\n****2290",
                status: WithdrawalStatus.processing,
                id: "WD-1039",
                method: "Bank\nTransfer",
                amount: "\$620.00",
                date: "Jul 27, 2025",
              ),
              const WithdrawalCardWidget(
                initials: "BT",
                name: "Bank Transfer\n****7714",
                status: WithdrawalStatus.success,
                id: "WD-1038",
                method: "Bank\nTransfer",
                amount: "\$380.00",
                date: "Jul 26, 2025",
              ),
              const WithdrawalCardWidget(
                initials: "AD",
                name: "andre.d@paypal.com",
                status: WithdrawalStatus.success,
                id: "WD-1037",
                method: "PayPal",
                amount: "\$240.00",
                date: "Jul 25, 2025",
              ),
              const WithdrawalCardWidget(
                initials: "BT",
                name: "Bank Transfer\n****6630",
                status: WithdrawalStatus.rejected,
                id: "WD-1036",
                method: "Bank\nTransfer",
                amount: "\$150.00",
                date: "Jul 24, 2025",
              ),
              const Gap(height: 12),
              Center(
                child: AppText(
                  text: "End of list",
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
              ),
              const Gap(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
