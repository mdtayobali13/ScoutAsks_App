import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/constant/app_asserts_image_path.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/app_image/app_image.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import 'package:scoutasks/screens/auth_screen/forgot_screen/screens/provider/forgot_reset_password_provider.dart';
import '../../widgets/auth_header_widget.dart';
import '../../widgets/auth_submit_button.dart';
class ForgotScreenPasswordInputScreen extends ConsumerWidget {
  const ForgotScreenPasswordInputScreen({
    super.key,
    required this.formKey,
    required this.confirmPasswordTextEditingController,
    required this.passwordTextEditingController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController passwordTextEditingController;
  final TextEditingController confirmPasswordTextEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: AppSize.size.width,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20)),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(height: AppSize.width(value: 60)),
              // Logo
              Center(
                child: AppImage(
                  path: AppAssertsImagePath.instance.scoutasksLogo,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),
              Gap(height: AppSize.width(value: 40)),
              
              // Header
              const AuthHeaderWidget(
                title: "Create new password",
                subtitle: "Keep your account safe with a unique numeric\npassword",
              ),
              Gap(height: AppSize.width(value: 40)),

              // Password Field
              AppInputWidgetTwo(
                title: "Password",
                titleFontSize: 15,
                titleColor: const Color(0xFF262626),
                hintText: "1234",
                padding: EdgeInsets.zero,
                fillColor: Colors.white,
                borderColor: Colors.grey.shade400,
                isPassWord: true,
                maxLines: 1,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordTextEditingController,
                textInputAction: TextInputAction.next,
              ),
              Gap(height: AppSize.width(value: 20)),

              // Confirm Password Field
              AppInputWidgetTwo(
                title: "Confirm Password",
                titleFontSize: 15,
                titleColor: const Color(0xFF262626),
                hintText: "1234",
                padding: EdgeInsets.zero,
                fillColor: Colors.white,
                borderColor: Colors.grey.shade400,
                isPassWord: true,
                isPassWordSecondValidation: true,
                isPassWordSecondValidationController: passwordTextEditingController,
                maxLines: 1,
                keyboardType: TextInputType.visiblePassword,
                controller: confirmPasswordTextEditingController,
                textInputAction: TextInputAction.next,
              ),

              Gap(height: AppSize.width(value: 30)),

              // Update Password Button
              AuthSubmitButton(
                title: "Update Password",
                onTap: () {
                  ref
                      .read(forgotResetPasswordProvider.notifier)
                      .resetPassword(
                        formKey: formKey,
                        passwordController: passwordTextEditingController,
                        confirmPasswordController: confirmPasswordTextEditingController,
                      );
                },
                provider: forgotResetPasswordProvider,
              ),
              Gap(height: AppSize.width(value: 40)),
            ],
          ),
        ),
      ),
    );
  }
}
