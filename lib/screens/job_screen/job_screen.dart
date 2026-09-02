import 'package:flutter/material.dart';
import 'package:scoutasks/screens/home_screen/widgets/home_toggle_button_row.dart';
import 'package:scoutasks/screens/job_screen/widgets/create_job_dialog.dart';
import 'package:scoutasks/screens/job_screen/widgets/job_card_widget.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  String _selectedTab = "All";

  final String dummyDescription =
      "Implements the emergency location broadcast HUD and search filtersImplements the emergency location broadcast HUD and search filtersImplements the emergency location broadcast HUD and search filters";

  late final List<Map<String, dynamic>> _allJobs = [
    {
      "title": "Leaking kitchen pipe",
      "description": dummyDescription,
      "budget": "\$65 to \$120",
      "level": "Low urgency",
      "location": "Dhaka, Bangladesh",
      "status": JobStatus.inProgress,
    },
    {
      "title": "Leaking kitchen pipe",
      "description": dummyDescription,
      "budget": "\$65 to \$120",
      "level": "Low urgency",
      "location": "Dhaka, Bangladesh",
      "status": JobStatus.complete,
    },
    {
      "title": "Leaking kitchen pipe",
      "description": dummyDescription,
      "budget": "\$80",
      "level": "Low urgency",
      "location": "Dhaka, Bangladesh",
      "status": JobStatus.offers,
      "profileName": "Guy Hawkins",
      "profileImage": "https://models.readyplayer.me/651ed9c30f40d7c71d6bb78e.png",
      "profileRating": 4.5,
      "profileType": "Plumber",
      "isVerified": true,
    },
  ];

  List<Map<String, dynamic>> _filteredJobs() {
    if (_selectedTab == "All") {
      return _allJobs;
    } else if (_selectedTab == "In Progress") {
      return _allJobs.where((j) => j["status"] == JobStatus.inProgress).toList();
    } else if (_selectedTab == "Complete") {
      return _allJobs.where((j) => j["status"] == JobStatus.complete).toList();
    } else if (_selectedTab == "Offers") {
      return _allJobs.where((j) => j["status"] == JobStatus.offers).toList();
    }
    return _allJobs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(height: 15),
              // Search and Post Button
              Row(
                children: [
                  Expanded(
                    child: AppInputWidgetTwo(
                      padding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSize.width(value: 15),
                        vertical: AppSize.width(value: 12),
                      ),
                      hintText: "What service do you need?",
                      fillColor: const Color(0xFFF0F2F5),
                    ),
                  ),
                  const Gap(width: 10),
                  AppButton(
                    width: 100,
                    height: 48,
                    padding: EdgeInsets.zero,
                    onTap: () {
                      showDialog(context: context, builder: (context) => const CreateJobDialog());
                    },
                    title: "Post a job",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    backgroundColor: const Color(0xFF143B66),
                    titleColor: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ],
              ),
              const Gap(height: 25),
              // Title
              AppText(text: "Your jobs", fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
              const Gap(height: 20),
              // Tabs
              HomeToggleButtonRow(
                selectedItem: _selectedTab,
                onSelected: (item) {
                  setState(() {
                    _selectedTab = item;
                  });
                },
                items: const ["All", "In Progress", "Complete", "Offers"],
              ),
              const Gap(height: 20),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: AppSize.width(value: 20)),
                  itemCount: _filteredJobs().length,
                  separatorBuilder: (context, index) => const Gap(height: 15),
                  itemBuilder: (context, index) {
                    final job = _filteredJobs()[index];
                    final status = job["status"] as JobStatus;

                    Widget card = JobCardWidget(
                      title: job["title"],
                      description: job["description"],
                      budget: job["budget"],
                      level: job["level"],
                      location: job["location"],
                      status: status,
                      profileName: job["profileName"],
                      profileImage: job["profileImage"],
                      profileRating: job["profileRating"],
                      profileType: job["profileType"],
                      isVerified: job["isVerified"] ?? false,
                    );

                    // Add blue border to complete state for mockup matching
                    if (status == JobStatus.complete) {
                      card = Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade300, width: 1.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: card,
                      );
                    }

                    return card;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
