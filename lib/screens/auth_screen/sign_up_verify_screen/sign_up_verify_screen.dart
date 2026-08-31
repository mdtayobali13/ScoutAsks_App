import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/screens/auth_screen/sign_up_screen/provider/sign_up_provider.dart';
import 'package:scoutasks/screens/auth_screen/sign_up_verify_screen/provider/otp_verify_provider.dart';
import 'package:scoutasks/utils/app_log.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/app_snack_bar.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import '../../../constant/app_asserts_image_path.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/app_routes_key.dart';
import '../../../widgets/app_image/app_image.dart';
import '../../../widgets/texts/app_text.dart';

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
    final isLoading = ref.watch(otpVerifyProvider);
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(height: AppSize.width(value: 60)),
                  // Logo
                  SizedBox(
                    width: AppSize.size.width * 0.45,
                    child: AppImage(path: AppAssertsImagePath.instance.logo),
                  ),
                  Gap(height: AppSize.width(value: 40)),
                  // Title
                  AppText(
                    text: "Enter code",
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF262626),
                  ),
                  Gap(height: 12),
                  // Subtitle
                  AppText(
                    text: "We sent code to your E-mail",
                    textAlign: TextAlign.center,
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                  Gap(height: AppSize.width(value: 40)),

                  // Code Field
                  AppInputWidgetTwo(
                    title: "Code",
                    titleFontSize: 15,
                    titleColor: const Color(0xFF262626),
                    hintText: "123456",
                    padding: EdgeInsets.zero,
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
                  AppButton(
                    onTap: isLoading
                        ? null
                        : () async {
                            if (formKey.currentState!.validate()) {
                              final isSuccess = await ref
                                  .read(otpVerifyProvider.notifier)
                                  .verifyOtp(otpController.text.trim());
                              if (isSuccess) {
                                AppSnackBar.instance.success("Verified successfully!");
                                final provider = ref.read(signUpProvider);
                                if (provider.isCustomer) {
                                  AppRoutes.instance.go(AppRoutesKey.instance.signInScreen);
                                } else {
                                  // AppRoutes.instance.go(
                                  //   AppRoutesKey
                                  //       .instance
                                  //       .verificationInProgressScreen,
                                  // );
                                }
                              } else {
                                AppSnackBar.instance.error("Invalid OTP");
                              }
                            }
                          },
                    isLoading: isLoading,
                    title: "Verify",
                    backgroundColor: const Color(0xFF143B66),
                    borderColor: const Color(0xFF143B66),
                    padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 15)),
                    borderRadius: BorderRadius.circular(8),
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
