import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/screens/auth_screen/choose_role_screen/role_provider.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/screens/profile_screen/widgets/profile_menu_item_widget.dart';
import 'package:scoutasks/screens/profile_screen/personal_details_screen.dart';
import 'package:scoutasks/screens/profile_screen/password_manage_screen.dart';
import 'package:scoutasks/screens/profile_screen/notifications_screen.dart';
import 'package:scoutasks/screens/profile_screen/booking_history_screen.dart';
import 'package:scoutasks/screens/profile_screen/professional_setup_screen.dart';
import 'package:scoutasks/screens/profile_screen/review_screen.dart';
import 'package:scoutasks/screens/profile_screen/text_content_screen.dart';
import 'package:scoutasks/screens/profile_screen/delete_account_screen.dart';
import 'package:scoutasks/screens/profile_screen/wallet_details_screen.dart';
import 'package:scoutasks/screens/profile_screen/widgets/add_new_category_dialog.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(userRoleProvider);
    final isTechnician = role == 'technician';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(height: 20),
              // Profile Header
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.red.shade700,
                          backgroundImage: const NetworkImage(
                            "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200&auto=format&fit=crop",
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            child: const Icon(Icons.verified, color: Colors.blue, size: 22),
                          ),
                        ),
                      ],
                    ),
                    const Gap(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: "Ronald Richards",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        const Gap(width: 8),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(Icons.edit_outlined, size: 16, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                    const Gap(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone_outlined, size: 16, color: Colors.grey.shade600),
                        const Gap(width: 4),
                        AppText(text: "+32 478 123 456", fontSize: 14, color: Colors.grey.shade600),
                      ],
                    ),
                    const Gap(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined, size: 16, color: Colors.grey.shade600),
                        const Gap(width: 4),
                        AppText(text: "Location name", fontSize: 14, color: Colors.grey.shade600),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(height: 20),

              if (isTechnician) ...[
                // Technician Stats
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AppText(text: "In Queue: 10", fontSize: 13, color: Colors.grey.shade700),
                      const Gap(height: 6),
                      AppText(
                        text: "Projects Completed: 52 | Completion rate: 99%",
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                      const Gap(height: 6),
                      AppText(
                        text: "Open hour: 8:00-20:00 | Response time: 1h",
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                      const Gap(height: 6),
                      AppText(text: "Years of experience: 5", fontSize: 13, color: Colors.grey.shade700),
                      const Gap(height: 12),
                      AppText(
                        text:
                            "That's the complete Contractor journey end-to-end. Let me know if you want the Super Admin flow next.",
                        fontSize: 13,
                        color: Colors.grey.shade700,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Gap(height: 24),

                // Earning Cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF2F6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              AppText(text: "€1200", fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                              const Gap(height: 4),
                              AppText(text: "Net earning", fontSize: 13, color: Colors.black87),
                            ],
                          ),
                        ),
                      ),
                      const Gap(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF2F6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              AppText(text: "€800", fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                              const Gap(height: 4),
                              AppText(text: "Pending", fontSize: 13, color: Colors.black87),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(height: 16),

                // Wallet Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppButton(
                    title: "Withdraw net earnings",
                    onTap: () {},
                    backgroundColor: AppColors.instance.primaryBrandBlue,
                    titleColor: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    height: 45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppButton(
                    title: "View wallet",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const WalletDetailsScreen()));
                    },
                    backgroundColor: Colors.grey.shade600,
                    titleColor: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    height: 45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(height: 24),

                // Categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(text: "Categories", fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                          GestureDetector(
                            onTap: () {
                              showDialog(context: context, builder: (context) => const AddNewCategoryDialog());
                            },
                            child: AppText(
                              text: "Add new",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.instance.primaryBrandOrange,
                            ),
                          ),
                        ],
                      ),
                      const Gap(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildCategoryCard(title: "Plumbing", type: "Regular", rate: "Rates from €65/hr"),
                          ),
                          const Gap(width: 12),
                          Expanded(
                            child: _buildCategoryCard(title: "Plumbing", type: "Emergency", rate: "Rates from €165/hr"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(height: 30),
              ],

              // Menu Items
              ProfileMenuItemWidget(
                title: "Personal info",
                subtitle: "Manage you personal details",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalDetailsScreen()));
                },
              ),
              ProfileMenuItemWidget(
                title: "Password",
                subtitle: "Manage your password",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordManageScreen()));
                },
              ),
              ProfileMenuItemWidget(
                title: "Notification",
                subtitle: "Check all notification",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
                },
              ),
              if (!isTechnician)
                ProfileMenuItemWidget(
                  title: "Booking history",
                  subtitle: "Check all booking history",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingHistoryScreen()));
                  },
                ),
              ProfileMenuItemWidget(
                title: "My rating",
                subtitle: "Manage rating",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ReviewScreen()));
                },
              ),
              ProfileMenuItemWidget(
                title: "Privacy & Security",
                subtitle: "Your data & security",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextContentScreen(
                        title: "Privacy & Security",
                        content:
                            "scoutasks is built to make you a ghost. We do not collect, capture, or resell your personal data. No signup, email, or phone number is ever required to use the application. All messages, cryptographic keys, and communication data are stored 100% serverless and exist only on your local device. Secure connections are established directly between devices using peer-to-peer QR Code scanning. You leave zero digital footprint.",
                      ),
                    ),
                  );
                },
              ),
              ProfileMenuItemWidget(
                title: "Terms & Conditions",
                subtitle: "Your data & security",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextContentScreen(
                        title: "Terms & Conditions",
                        content:
                            "scoutasks is built to make you a ghost. We do not collect, capture, or resell your personal data. No signup, email, or phone number is ever required to use the application. All messages, cryptographic keys, and communication data are stored 100% serverless and exist only on your local device. Secure connections are established directly between devices using peer-to-peer QR Code scanning. You leave zero digital footprint.",
                      ),
                    ),
                  );
                },
              ),
              if (isTechnician)
                ProfileMenuItemWidget(
                  title: "Professional Setup",
                  subtitle: "Manage service, Business Description, Service Pricing, S...",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfessionalSetupScreen()));
                  },
                ),
              ProfileMenuItemWidget(title: "Payment methods", subtitle: "Stripe", onTap: () {}),
              ProfileMenuItemWidget(
                title: "Delete account",
                subtitle: "If you want to delete account",
                titleColor: Colors.red,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DeleteAccountScreen()));
                },
              ),

              const Gap(height: 20),

              // Log Out Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red, width: 1),
                    ),
                    alignment: Alignment.center,
                    child: AppText(text: "Log Out", fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
              ),
              const Gap(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({required String title, required String type, required String rate}) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFEFF2F6), borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=300&auto=format&fit=crop",
            height: 90,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: title, fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                    AppText(text: type, fontSize: 11, color: AppColors.instance.primaryBrandBlue),
                  ],
                ),
                const Gap(height: 4),
                AppText(text: rate, fontSize: 11, color: Colors.grey.shade600),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
