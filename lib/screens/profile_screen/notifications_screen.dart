import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/screens/profile_screen/widgets/notification_item_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    
                    const NotificationItemWidget(
                      isUnread: true,
                      avatarUrl: "https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=150&auto=format&fit=crop",
                      title: "\"John doe\" send you addi...",
                      message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    ),
                    const Gap(height: 12),
                    
                    const NotificationItemWidget(
                      isUnread: false,
                      avatarUrl: "https://images.unsplash.com/photo-1527980965255-d3b416303d12?q=80&w=150&auto=format&fit=crop",
                      title: "\"John doe\" complete task & mark as c...",
                      message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    ),
                    const Gap(height: 12),
                    
                    const NotificationItemWidget(
                      isUnread: true,
                      avatarUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=150&auto=format&fit=crop",
                      title: "Hello! We're excited to sh...",
                      message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    ),
                    const Gap(height: 25),
                    
                    AppText(
                      text: "Last week",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                    const Gap(height: 15),
                    
                    const NotificationItemWidget(
                      isUnread: true,
                      avatarUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=150&auto=format&fit=crop",
                      title: "Hey there! We'd love to h...",
                      message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    ),
                    const Gap(height: 12),
                    
                    const NotificationItemWidget(
                      isUnread: false,
                      avatarUrl: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=150&auto=format&fit=crop",
                      title: "Hey there! Just wanted to l...",
                      message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                    ),
                    const Gap(height: 12),
                    
                    const NotificationItemWidget(
                      isUnread: true,
                      avatarUrl: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=150&auto=format&fit=crop",
                      title: "What if your next Crush is...",
                      message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do",
                    ),
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
