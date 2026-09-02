import 'package:flutter/material.dart';
import 'package:scoutasks/routes/app_routes.dart';
import 'package:scoutasks/routes/app_routes_key.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/app_image/app_image.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';


class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage(
                      path: "assets/images/Error.png",
                      width: AppSize.size.width * 0.7,
                      fit: BoxFit.contain,
                    ),
                    Gap(height: AppSize.width(value: 30)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 40)),
                      child: AppText(
                        text: "We're Unable to Find This\nPage",
                        fontSize: AppSize.width(value: 22),
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gap(height: AppSize.width(value: 15)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 30)),
                      child: AppText(
                        text: "The page you requested may have been moved\nor no longer exists. Please return to a familiar\nlocation.",
                        textAlign: TextAlign.center,
                        height: 1.5,
                        fontSize: AppSize.width(value: 14),
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(value: 20),
                  vertical: AppSize.width(value: 20),
                ),
                child: AppButton(
                  onTap: () {
                    AppRoutes.instance.go(AppRoutesKey.instance.initial);
                  },
                  height: AppSize.width(value: 50),
                  title: "Go to Home",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
