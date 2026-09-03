import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/screens/profile_screen/withdrawals_screen.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class WalletDetailsScreen extends StatelessWidget {
  const WalletDetailsScreen({super.key});

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
          text: "Send offer", // Exact match from design, although contextually might be 'Wallet details'
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(height: 20),
              AppText(text: "Wallet details", fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              const Gap(height: 16),

              // Grid of balances
              Row(
                children: [
                  Expanded(
                    child: _buildWalletCard(title: "Available Balance", amount: "\$450k"),
                  ),
                  const Gap(width: 12),
                  Expanded(
                    child: _buildWalletCard(title: "Pending Balance", amount: "\$2,450"),
                  ),
                ],
              ),
              const Gap(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildWalletCard(title: "Earnings", amount: "\$6,450"),
                  ),
                  const Gap(width: 12),
                  Expanded(
                    child: _buildWalletCard(title: "Withdrawals", amount: "\$1,450"),
                  ),
                ],
              ),
              const Gap(height: 16),

              // Fees Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    AppText(text: "Fees", fontSize: 13, color: AppColors.instance.primaryBrandOrange),
                    const Gap(height: 8),
                    AppText(
                      text: "-\$500",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.instance.primaryBrandOrange,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Action Buttons
              AppButton(
                title: "Withdraw net earnings",
                onTap: () {},
                backgroundColor: AppColors.instance.primaryBrandBlue,
                titleColor: Colors.white,
                borderRadius: BorderRadius.circular(8),
                height: 48,
                fontWeight: FontWeight.w600,
              ),
              const Gap(height: 12),
              AppButton(
                title: "Transaction History",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WithdrawalsScreen()));
                },
                backgroundColor: Colors.grey.shade600,
                titleColor: Colors.white,
                borderRadius: BorderRadius.circular(8),
                height: 48,
                fontWeight: FontWeight.w600,
              ),
              const Gap(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWalletCard({required String title, required String amount}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(color: const Color(0xFFEFF2F6), borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          AppText(text: title, fontSize: 12, color: Colors.grey.shade600),
          const Gap(height: 8),
          AppText(text: amount, fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
        ],
      ),
    );
  }
}
