import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/profile_screen/widgets/profile_menu_item_widget.dart';
import 'package:scoutasks/screens/profile_screen/personal_details_screen.dart';
import 'package:scoutasks/screens/profile_screen/password_manage_screen.dart';
import 'package:scoutasks/screens/profile_screen/notifications_screen.dart';
import 'package:scoutasks/screens/profile_screen/booking_history_screen.dart';
import 'package:scoutasks/screens/profile_screen/review_screen.dart';
import 'package:scoutasks/screens/profile_screen/text_content_screen.dart';
import 'package:scoutasks/screens/profile_screen/delete_account_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.red.shade700,
                      // Placeholder for actual image
                      child: const Icon(Icons.person, size: 50, color: Colors.white),
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
              const Gap(height: 30),

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
              ProfileMenuItemWidget(title: "Payment methods", subtitle: "Stripe", onTap: () {}),
              ProfileMenuItemWidget(
                title: "Delete account",
                subtitle: "If you want to delete account",
                titleColor: Colors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DeleteAccountScreen()),
                  );
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
}
