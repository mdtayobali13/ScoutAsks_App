import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_asserts_image_path.dart';
import 'package:scoutasks/widgets/app_image/app_image.dart';

class AuthLogoWidget extends StatelessWidget {
  const AuthLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: AppImage(
          path: AppAssertsImagePath.instance.scoutasksLogo,
          width: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
