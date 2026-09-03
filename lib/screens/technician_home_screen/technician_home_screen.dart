import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/routes/app_routes.dart';
import 'package:scoutasks/routes/app_routes_key.dart';

import 'widgets/full_width_stat_card.dart';
import 'widgets/performance_metric_item_card.dart';
import 'widgets/quick_operation_button.dart';
import 'widgets/stat_card.dart';
import 'widgets/technician_profile_header.dart';

class TechnicianHomeScreen extends StatefulWidget {
  const TechnicianHomeScreen({super.key});

  @override
  State<TechnicianHomeScreen> createState() => _TechnicianHomeScreenState();
}

class _TechnicianHomeScreenState extends State<TechnicianHomeScreen> {
  bool isDispatchAreaOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TechnicianProfileHeader(
                  imageUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
                  name: 'Guy Hawkins',
                  role: 'Plumber',
                  isVerified: true,
                  isDispatchAreaOn: isDispatchAreaOn,
                  onDispatchAreaChanged: (value) {
                    setState(() {
                      isDispatchAreaOn = value;
                    });
                  },
                  serviceRadius: '10 km',
                ),
                const SizedBox(height: 24),
                Text(
                  'Overview',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.instance.primary),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.6,
                  children: [
                    StatCard(title: 'Today\'s Earnings', value: '\$450k'),
                    StatCard(title: 'Weekly Earnings', value: '\$2,450'),
                    StatCard(title: 'Monthly Earnings', value: '\$6,450'),
                    StatCard(title: 'Pending Payouts', value: '\$1,450'),
                    StatCard(title: 'Response Rate', value: '1 h'),
                    StatCard(title: 'Repeat Customers', value: '50'),
                    StatCard(title: 'Completion Rate', value: '98%'),
                    StatCard(title: 'Profile view this month', value: '1k'),
                  ],
                ),
                const SizedBox(height: 16),
                FullWidthStatCard(
                  title: 'Completed Jobs',
                  value: '50+',
                  titleColor: AppColors.instance.primaryBrandOrange,
                  valueColor: AppColors.instance.primaryBrandOrange,
                  backgroundColor: AppColors.instance.primaryBrandOrange.withValues(alpha: 0.1),
                ),
                const SizedBox(height: 16),
                FullWidthStatCard(
                  title: 'Wallet Balance',
                  value: '\$4,950',
                  titleColor: AppColors.instance.success,
                  valueColor: AppColors.instance.success,
                  backgroundColor: AppColors.instance.success.withValues(alpha: 0.05),
                ),
                const SizedBox(height: 24),
                Text(
                  'Quick operation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.instance.primary),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuickOperationButton(
                      icon: Icons.account_balance_wallet_outlined,
                      label: 'Payout',
                      iconColor: AppColors.instance.primaryBrandBlue,
                      onTap: () {},
                    ),
                    QuickOperationButton(
                      icon: Icons.my_location,
                      label: 'Service',
                      iconColor: AppColors.instance.primaryBrandOrange,
                      onTap: () {},
                    ),
                    QuickOperationButton(
                      icon: Icons.calendar_today_outlined,
                      label: 'Schedule',
                      iconColor: AppColors.instance.blue,
                      onTap: () {
                        AppRoutes.instance.goNamed(AppRoutesKey.instance.technicianScheduleScreen);
                      },
                    ),
                    QuickOperationButton(
                      icon: Icons.chat_bubble_outline,
                      label: 'Chat',
                      iconColor: AppColors.instance.success,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.instance.surfaceLight,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Performance Metrics',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.instance.primaryBrandBlue,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          PerformanceMetricItemCard(
                            icon: Icon(Icons.star, color: AppColors.instance.yellow, size: 18),
                            value: '4.9',
                            label: 'RATING',
                            valueColor: AppColors.instance.primary,
                          ),
                          PerformanceMetricItemCard(
                            value: '142',
                            label: 'JOBS',
                            valueColor: AppColors.instance.primary,
                          ),
                          PerformanceMetricItemCard(
                            value: '98%',
                            label: 'DONE',
                            valueColor: AppColors.instance.success,
                          ),
                          PerformanceMetricItemCard(value: '85%', label: 'REPEAT', valueColor: AppColors.instance.blue),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
