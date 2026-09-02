import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/screens/home_screen/widgets/category_card_widget.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class AllServicesScreen extends StatefulWidget {
  const AllServicesScreen({super.key});

  @override
  State<AllServicesScreen> createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
  late TextEditingController searchController;

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20)),
          child: Column(
            children: [
              const Gap(height: 20),
              // Header
              Row(
                children: [
                  const AuthBackButtonWidget(),
                  const Gap(width: 15),
                  AppText(
                    text: "Here is all services",
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ],
              ),
              const Gap(height: 20),
              // Search Box
              AppInputWidgetTwo(
                padding: EdgeInsets.zero,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(value: 15),
                  vertical: AppSize.width(value: 15),
                ),
                prefix: const Icon(CupertinoIcons.search, color: Colors.grey),
                hintText: "Search by service",
                controller: searchController,
                fillColor: const Color(0xFFEFF2F6),
                borderColor: Colors.grey.shade400,
                maxLines: 1,
              ),
              const Gap(height: 20),
              // Services Grid
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: AppSize.width(value: 20)),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
