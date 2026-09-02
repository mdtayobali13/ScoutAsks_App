import 'package:flutter/material.dart';
import 'package:scoutasks/screens/artisan_list_screen/widgets/artisan_full_card_widget.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/routes/app_routes.dart';
import 'package:scoutasks/routes/app_routes_key.dart';

class ArtisanListScreen extends StatefulWidget {
  const ArtisanListScreen({super.key});

  @override
  State<ArtisanListScreen> createState() => _ArtisanListScreenState();
}

class _ArtisanListScreenState extends State<ArtisanListScreen> {
  // Mock data for the artisan list
  final List<Map<String, dynamic>> artisans = [
    {
      "name": "Brooklyn Simmons",
      "rating": 4.5,
      "category": "Plumbing",
      "distance": "2km",
      "hourlyRate": "€65",
      "responseTime": "24/7",
      "image": "https://images.unsplash.com/photo-1540569014015-19a7be504e3a?q=80&w=600&auto=format&fit=crop"
    },
    {
      "name": "Brooklyn Simmons",
      "rating": 4.5,
      "category": "Plumbing",
      "distance": "2km",
      "hourlyRate": "€65",
      "responseTime": "24/7",
      "image": "https://images.unsplash.com/photo-1504328345606-18bbc8c9d7d1?q=80&w=600&auto=format&fit=crop"
    },
    {
      "name": "Alex Mercer",
      "rating": 4.8,
      "category": "Electrician",
      "distance": "5km",
      "hourlyRate": "€70",
      "responseTime": "1 hr",
      "image": "https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=600&auto=format&fit=crop"
    }
  ];

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
              const Gap(height: 20),
              // Header
              Row(
                children: [
                  const AuthBackButtonWidget(),
                  const Gap(width: 15),
                  AppText(
                    text: "Artisan/Technician",
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ],
              ),
              const Gap(height: 25),
              // Artisan List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: AppSize.width(value: 20)),
                  itemCount: artisans.length,
                  itemBuilder: (context, index) {
                    final artisan = artisans[index];
                    return ArtisanFullCardWidget(
                      imageUrl: artisan["image"],
                      name: artisan["name"],
                      rating: artisan["rating"],
                      category: artisan["category"],
                      distance: artisan["distance"],
                      hourlyRate: artisan["hourlyRate"],
                      responseTime: artisan["responseTime"],
                      onChatTap: () {},
                      onViewProfileTap: () {
                        AppRoutes.instance.pushNamed(AppRoutesKey.instance.artisanProfileScreen);
                      },
                    );
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
