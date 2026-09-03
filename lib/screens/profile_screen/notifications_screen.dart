import 'package:flutter/material.dart';
import 'package:scoutasks/screens/auth_screen/choose_role_screen/role_provider.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/screens/auth_screen/choose_role_screen/choose_role_screen.dart';
import 'package:scoutasks/screens/profile_screen/widgets/notification_item_widget.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(userRoleProvider);
    final isTechnician = role == 'technician';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  const AuthBackButtonWidget(),
                  const Gap(width: 15),
                  AppText(
                    text: "Notifications",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(height: 10),
                    
                    AppText(
                      text: "Today",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                    const Gap(height: 15),
                    
                    if (isTechnician) ...[
                      // Technician Notifications
                      const NotificationItemWidget(
                        isUnread: true,
                        avatarUrl: "https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=150&auto=format&fit=crop",
                        title: "\"Jane Smith\" sent you a job request...",
                        message: "A new plumbing job is available in your area. Check the details to accept.",
                      ),
                      const Gap(height: 12),
                      const NotificationItemWidget(
                        isUnread: false,
                        avatarUrl: "https://images.unsplash.com/photo-1527980965255-d3b416303d12?q=80&w=150&auto=format&fit=crop",
                        title: "Withdrawal Successful",
                        message: "Your recent withdrawal of \$150 has been successfully processed.",
                      ),
                      const Gap(height: 12),
                      const NotificationItemWidget(
                        isUnread: true,
                        avatarUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=150&auto=format&fit=crop",
                        title: "New 5-star review!",
                        message: "\"Great service, highly recommended!\" - John Doe.",
                      ),
                    ] else ...[
                      // Customer Notifications
                      const NotificationItemWidget(
                        isUnread: true,
                        avatarUrl: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=150&auto=format&fit=crop",
                        title: "Technician is on the way",
                        message: "Your assigned technician is currently en route and will arrive shortly.",
                      ),
                      const Gap(height: 12),
                      const NotificationItemWidget(
                        isUnread: false,
                        avatarUrl: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=150&auto=format&fit=crop",
                        title: "Job completed successfully",
                        message: "Your electrical repair job has been marked as complete. Please leave a review.",
                      ),
                      const Gap(height: 12),
                      const NotificationItemWidget(
                        isUnread: true,
                        avatarUrl: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=150&auto=format&fit=crop",
                        title: "Offer received",
                        message: "A technician has sent an offer for your cleaning request.",
                      ),
                    ],
                    
                    const Gap(height: 25),
                    
                    AppText(
                      text: "Last week",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                    const Gap(height: 15),
                    
                    if (isTechnician) ...[
                      // Technician Notifications (Last week)
                      const NotificationItemWidget(
                        isUnread: false,
                        avatarUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=150&auto=format&fit=crop",
                        title: "Account verified successfully",
                        message: "Your background check is complete and your account is now fully active.",
                      ),
                      const Gap(height: 12),
                      const NotificationItemWidget(
                        isUnread: false,
                        avatarUrl: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=150&auto=format&fit=crop",
                        title: "Weekly Earnings Report",
                        message: "You earned \$450 last week. Keep up the great work!",
                      ),
                    ] else ...[
                      // Customer Notifications (Last week)
                      const NotificationItemWidget(
                        isUnread: false,
                        avatarUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=150&auto=format&fit=crop",
                        title: "Welcome to Scoutasks!",
                        message: "We're excited to have you on board. Start posting your jobs today.",
                      ),
                      const Gap(height: 12),
                      const NotificationItemWidget(
                        isUnread: false,
                        avatarUrl: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=150&auto=format&fit=crop",
                        title: "Payment processed",
                        message: "Your payment of \$85 for plumbing services has been successfully processed.",
                      ),
                    ],
                    
                    const Gap(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
