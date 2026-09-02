import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/screens/auth_screen/sign_up_screen/provider/sign_up_provider.dart';
import 'package:scoutasks/screens/auth_screen/sign_up_verify_screen/provider/otp_verify_provider.dart';
import 'package:scoutasks/utils/app_log.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/app_snack_bar.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/app_routes_key.dart';
import '../../../widgets/texts/app_text.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/auth_submit_button.dart';
import 'package:scoutasks/constant/app_asserts_image_path.dart';
import 'package:scoutasks/widgets/app_image/app_image.dart';

class SignUpVerifyScreen extends ConsumerStatefulWidget {
  const SignUpVerifyScreen({super.key});

  @override
  ConsumerState<SignUpVerifyScreen> createState() => _SignUpVerifyScreenState();
}

class _SignUpVerifyScreenState extends ConsumerState<SignUpVerifyScreen> {
  late TextEditingController otpController;
  late GlobalKey<FormState> formKey;

  void onAppInitial() {
    try {
      otpController = TextEditingController();
      formKey = GlobalKey<FormState>();
    } catch (e) {
      errorLog("onAppInitial", e);
    }
  }

  void onAppClose() {
    otpController.dispose();
  }

  @override
  void initState() {
    super.initState();
    onAppInitial();
  }

  @override
  void dispose() {
    onAppClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
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
                    child: AppImage(path: AppAssertsImagePath.instance.scoutasksLogo, width: 150, fit: BoxFit.contain),
                  ),
                  Gap(height: AppSize.width(value: 40)),

                  // Header
                  const AuthHeaderWidget(title: "Enter code", subtitle: "We sent code to your E-mail"),
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
                    controller: otpController,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter code";
                      }
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
                          ref.read(otpVerifyProvider.notifier).resendOtp();
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
                    onTap: () async {
                      // if (formKey.currentState!.validate()) {
                        // final isSuccess = await ref
                        //     .read(otpVerifyProvider.notifier)
                        //     .verifyOtp(otpController.text.trim());
                        // if (isSuccess) {
                          AppSnackBar.instance.success("Verified successfully!");
                          final provider = ref.read(signUpProvider);
                          if (provider.isCustomer) {
                            AppRoutes.instance.go(AppRoutesKey.instance.signInScreen);
                          } else {
                            AppRoutes.instance.goNamed(AppRoutesKey.instance.verificationInProgressScreen);
                          }
                        // } else {
                        //   AppSnackBar.instance.error("Invalid OTP");
                        // }
                      // }
                    },
                    provider: otpVerifyProvider,
                  ),
                  Gap(height: AppSize.width(value: 40)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
