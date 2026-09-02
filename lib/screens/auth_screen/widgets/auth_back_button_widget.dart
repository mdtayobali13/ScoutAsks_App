import 'package:flutter/material.dart';
import 'package:scoutasks/routes/app_routes.dart';

class AuthBackButtonWidget extends StatelessWidget {
  const AuthBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRoutes.instance.pop(),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.orange.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
      ),
    );
  }
}
