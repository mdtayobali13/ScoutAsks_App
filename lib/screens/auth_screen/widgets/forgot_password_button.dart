import 'package:flutter/material.dart';
import 'package:scoutasks/routes/app_routes.dart';
import 'package:scoutasks/routes/app_routes_key.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          AppRoutes.instance.pushNamed(AppRoutesKey.instance.forgotScreen);
        },
        child: AppText(text: "Forgot password?", color: Colors.red.shade400, fontWeight: FontWeight.w500),
      ),
    );
  }
}
