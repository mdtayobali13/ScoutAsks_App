import 'package:flutter/material.dart';
import 'package:scoutasks/routes/app_routes.dart';
import 'package:scoutasks/routes/app_routes_key.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/app_image/app_image.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';


class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

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
                      path: "assets/images/InternetError.png",
                      width: AppSize.size.width * 0.8,
                      fit: BoxFit.contain,
                    ),
                    Gap(height: AppSize.width(value: 30)),
                    AppText(
                      text: "No Internet Connection",
                      fontSize: AppSize.width(value: 22),
                      fontWeight: FontWeight.bold,
                    ),
                    Gap(height: AppSize.width(value: 10)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 40)),
                      child: AppText(
                        text: "No Internet connection found, Please check\nyour connection or try again.",
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
                  title: "Retry",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
