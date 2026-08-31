import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';

class AuthSubmitButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final ProviderListenable<bool> provider;

  const AuthSubmitButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var isLoading = ref.watch(provider);
        return AppButton(
          isLoading: isLoading,
          onTap: onTap,
          title: title,
          backgroundColor: const Color(0xFF143B66),
          titleColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 12)),
        );
      },
    );
  }
}
