import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/routes/app_routes.dart';
import 'package:scoutasks/routes/app_routes_key.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';

import 'widgets/artisan_card_widget.dart';
import 'widgets/category_card_widget.dart';
import 'widgets/home_header_widget.dart';
import 'widgets/home_search_bar_widget.dart';
import 'widgets/home_section_title_widget.dart';
import 'widgets/home_sos_banner_widget.dart';
import 'widgets/home_sos_form_widget.dart';
import 'widgets/home_toggle_button_row.dart';
import 'package:scoutasks/screens/job_screen/widgets/create_job_dialog.dart';
import 'package:scoutasks/screens/profile_screen/notifications_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late TextEditingController searchController;
  bool isSosFormVisible = false;
  String selectedCategoryToggle = "All";
  String selectedArtisanToggle = "Recommend";

  final List<String> categoryToggles = ["All", "Popular"];
  final List<String> artisanToggles = ["Recommend", "Top rated", "Popular", "Near"];

  // Mock data for display
  final List<Map<String, String>> categories = [
    {
      "title": "Certified plumbers",
      "rate": "Rates from €65/hr",
      "image": "https://images.unsplash.com/photo-1607472586893-edb57cbceb42?q=80&w=300&auto=format&fit=crop",
    },
    {
      "title": "Electricians",
      "rate": "Rates from €65/hr",
      "image": "https://images.unsplash.com/photo-1621905251189-08b45d6a269e?q=80&w=300&auto=format&fit=crop",
    },
    {
      "title": "Boiler & heating",
      "rate": "Rates from €65/hr",
      "image": "https://images.unsplash.com/photo-1505798577917-a65157d3320a?q=80&w=300&auto=format&fit=crop",
    },
    {
      "title": "Roof & Masonry",
      "rate": "Rates from €65/hr",
      "image": "https://images.unsplash.com/photo-1541888081622-152e85e51025?q=80&w=300&auto=format&fit=crop",
    },
  ];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20), vertical: AppSize.width(value: 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              HomeHeaderWidget(
                userName: "Guy Hawkins",
                greeting: "Good morning",
                avatarUrl:
                    "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200&auto=format&fit=crop",
                onNotificationTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
                },
              ),
              const Gap(height: 25),

              // Search Bar
              HomeSearchBarWidget(
                controller: searchController,
                onPostJobTap: () {
                  showDialog(context: context, builder: (context) => const CreateJobDialog());
                },
              ),
              const Gap(height: 25),

              // SOS Section
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                crossFadeState: isSosFormVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                firstChild: HomeSosBannerWidget(
                  onTap: () {
                    setState(() {
                      isSosFormVisible = true;
                    });
                  },
                ),
                secondChild: HomeSosFormWidget(
                  onBackTap: () {
                    setState(() {
                      isSosFormVisible = false;
                    });
                  },
                  onBroadcastGpsTap: () {
                    AppRoutes.instance.pushNamed(AppRoutesKey.instance.artisanListScreen);
                  },
                ),
              ),
              const Gap(height: 30),

              // Categories Section
              HomeSectionTitleWidget(
                title: "Categories",
                trailingText: "See all",
                onTrailingTap: () {
                  AppRoutes.instance.pushNamed(AppRoutesKey.instance.allServicesScreen);
                },
              ),
              const Gap(height: 15),
              HomeToggleButtonRow(
                items: categoryToggles,
                selectedItem: selectedCategoryToggle,
                onSelected: (val) {
                  setState(() {
                    selectedCategoryToggle = val;
                  });
                },
              ),
              const Gap(height: 20),

              // Categories Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.85,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCardWidget(
                    title: categories[index]["title"]!,
                    rate: categories[index]["rate"]!,
                    imageUrl: categories[index]["image"]!,
                  );
                },
              ),
              const Gap(height: 30),

              // Artisans Section
              HomeSectionTitleWidget(
                title: "Artisans",
                trailingText: "See all",
                onTrailingTap: () {
                  AppRoutes.instance.pushNamed(AppRoutesKey.instance.artisanListScreen);
                },
              ),
              const Gap(height: 15),
              HomeToggleButtonRow(
                items: artisanToggles,
                selectedItem: selectedArtisanToggle,
                onSelected: (val) {
                  setState(() {
                    selectedArtisanToggle = val;
                  });
                },
              ),
              const Gap(height: 20),

              // Artisans List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ArtisanCardWidget(
                    name: "Alex Mercer",
                    reviews: "(124 reviews)",
                    rate: "€65/hr",
                    isTopRated: index == 1,
                    imageUrl:
                        "https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=200&auto=format&fit=crop",
                  );
                },
              ),
              const Gap(height: 30),

              // Recent viewed Section
              const HomeSectionTitleWidget(title: "Recent viewed"),
              const Gap(height: 20),

              // Recent viewed List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ArtisanCardWidget(
                    name: "Alex Mercer",
                    reviews: "(124 reviews)",
                    rate: "€65/hr",
                    isTopRated: index == 1,
                    imageUrl:
                        "https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=200&auto=format&fit=crop",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
