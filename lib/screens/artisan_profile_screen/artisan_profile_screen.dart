import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/constant/app_asserts_image_path.dart';
import 'package:scoutasks/screens/artisan_profile_screen/widgets/artisan_service_card_widget.dart';
import 'package:scoutasks/screens/artisan_profile_screen/widgets/artisan_review_card_widget.dart';

class ArtisanProfileScreen extends StatefulWidget {
  const ArtisanProfileScreen({super.key});

  @override
  State<ArtisanProfileScreen> createState() => _ArtisanProfileScreenState();
}

class _ArtisanProfileScreenState extends State<ArtisanProfileScreen> {
  int _selectedTabIndex = 0;

  final List<String> _tabs = ["Services", "Old projects", "Reviews"];

  final List<Map<String, String>> _services = [
    {
      "title": "Plumbing",
      "type": "Regular",
      "rate": "Rates from €65/hr",
      "image": "https://images.unsplash.com/photo-1581578731548-c64695cc6952?q=80&w=300&auto=format&fit=crop",
    },
    {
      "title": "Plumbing",
      "type": "Emergency",
      "rate": "Rates from €165/hr",
      "image": "https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=300&auto=format&fit=crop",
    },
  ];

  final List<Map<String, dynamic>> _reviews = [
    {
      "name": "Eleanor Summers",
      "rating": 5.0,
      "date": "Today, 16:40",
      "content":
          "What can I say it's fast food, it's scoutasks.No different to any of the other scoutasks, nice with adequate seating",
      "image":
          "https://models.readyplayer.me/651ed9c30f40d7c71d6bb78e.png", // Just using a generic placeholder that will fall back to Icon or working image
      "bgColor": const Color(0xFFFFE0B2),
    },
    {
      "name": "Victoria Champain",
      "rating": 5.0,
      "date": "Today, 09:12",
      "content":
          "Food, as always, is good both upstairs and downstairs is always clean (download the bk app for deals etc.) sit upstairs every time, more relaxed feel.",
      "image": "https://models.readyplayer.me/651ed9c30f40d7c71d6bb78e.png",
      "bgColor": const Color(0xFFC8E6C9),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20)),
          child: Column(
            children: [
              const Gap(height: 20),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AuthBackButtonWidget(),
                  AppText(text: "Artisan/Technician", fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(color: Colors.grey.shade600, borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(AppAssertsImagePath.instance.massageIcon, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const Gap(height: 30),
              // Profile Section
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Avatar
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(color: Color(0xFFD32F2F), shape: BoxShape.circle),
                        child: ClipOval(
                          child: Image.asset(AppAssertsImagePath.instance.technicianImage, fit: BoxFit.cover),
                        ),
                      ),
                      const Gap(height: 15),
                      // Name and Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: "Ronald Richards",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          const Gap(width: 10),
                          const Icon(Icons.star, color: Colors.orange, size: 20),
                          const Gap(width: 4),
                          AppText(text: "4.5", fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
                          AppText(text: " (80)", fontSize: 12, color: Colors.grey.shade600),
                        ],
                      ),
                      const Gap(height: 15),
                      // Stats
                      AppText(text: "In Queue: 10", fontSize: 15, color: Colors.black87),
                      const Gap(height: 5),
                      AppText(text: "Projects Completed: 100", fontSize: 15, color: Colors.black87),
                      const Gap(height: 5),
                      AppText(text: "Open hour: 8:00-16:00", fontSize: 15, color: Colors.black87),
                      const Gap(height: 15),
                      // Description
                      AppText(
                        text:
                            "That's the complete Contractor journey end-to-end. Let me know if you want the Super Admin flow next.",
                        fontSize: 14,
                        color: Colors.black87,
                        textAlign: TextAlign.center,
                      ),
                      const Gap(height: 25),
                      // Tabs
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(_tabs.length, (index) {
                          bool isSelected = _selectedTabIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTabIndex = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF1B3B6F) : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: isSelected ? null : Border.all(color: Colors.grey.shade300),
                              ),
                              child: AppText(
                                text: _tabs[index],
                                fontSize: 14,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                color: isSelected ? Colors.white : Colors.black87,
                              ),
                            ),
                          );
                        }),
                      ),
                      const Gap(height: 20),
                      // Grid or Reviews
                      if (_selectedTabIndex == 0 || _selectedTabIndex == 1)
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 20),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: _services.length,
                          itemBuilder: (context, index) {
                            return ArtisanServiceCardWidget(
                              title: _services[index]["title"]!,
                              type: _services[index]["type"]!,
                              rate: _services[index]["rate"]!,
                              imageUrl: _services[index]["image"]!,
                              isProject: _selectedTabIndex == 1,
                            );
                          },
                        )
                      else if (_selectedTabIndex == 2)
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 20, top: 10),
                          itemCount: _reviews.length,
                          separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Divider(color: Colors.grey.shade300, height: 1),
                          ),
                          itemBuilder: (context, index) {
                            final review = _reviews[index];
                            return ArtisanReviewCardWidget(
                              name: review["name"],
                              rating: review["rating"],
                              date: review["date"],
                              content: review["content"],
                              imageUrl: review["image"],
                              avatarBgColor: review["bgColor"],
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
