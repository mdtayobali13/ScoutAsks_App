import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/screens/auth_screen/forgot_screen/screens/provider/forgot_verify_email_provider.dart';
import 'package:scoutasks/constant/app_asserts_image_path.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/app_image/app_image.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import '../../widgets/auth_header_widget.dart';
import '../../widgets/auth_submit_button.dart';

class ForgotScreenOtpInputScreen extends ConsumerWidget {
  const ForgotScreenOtpInputScreen({super.key, required this.onChange, required this.formKey, required this.otpTextEditingController});
  final void Function(int index) onChange;
  final GlobalKey<FormState> formKey;
  final TextEditingController otpTextEditingController;

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
                title: "Enter code",
                subtitle: "We sent code to your E-mail",
              ),
              Gap(height: AppSize.width(value: 40)),

              // Code Field
              AppInputWidgetTwo(
                title: "Code",
                titleFontSize: 15,
                titleColor: const Color(0xFF262626),
                hintText: "123456",
                padding: EdgeInsets.zero,
                fillColor: Colors.white,
                borderColor: Colors.grey.shade400,
                controller: otpTextEditingController,
                validator: (String? value) {
                  // if (value?.isEmpty ?? true) {
                  //   return "Enter code";
                  // }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              Gap(height: 12),

              // Resend Text
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText(text: "If you didn't receive a code, ", color: Colors.grey.shade600, fontSize: 13),
                  GestureDetector(
                    onTap: () {
                      ref.read(forgotVerifyEmailProvider.notifier).resendOtp();
                    },
                    child: AppText(
                      text: "Resend",
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF262626),
                    ),
                  ),
                ],
              ),
              Gap(height: AppSize.width(value: 30)),

              // Verify Button
              AuthSubmitButton(
                title: "Verify",
                onTap: () {
                  ref
                      .read(forgotVerifyEmailProvider.notifier)
                      .verifyEmail(formKey: formKey, otpController: otpTextEditingController, onChange: onChange);
                },
                provider: forgotVerifyEmailProvider,
              ),
              Gap(height: AppSize.width(value: 40)),
            ],
          ),
        ),
      ),
    );
  }
}
