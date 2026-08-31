import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/constant/app_asserts_image_path.dart';
import 'package:scoutasks/routes/app_routes.dart';
import 'package:scoutasks/routes/app_routes_key.dart';
import 'package:scoutasks/screens/auth_screen/sign_in_screen/provider/sign_in_provider.dart';
import 'package:scoutasks/utils/app_log.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/app_snack_bar.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import '../widgets/social_login_button.dart';
import '../widgets/remember_me_checkbox.dart';
import '../widgets/auth_redirection_text.dart';
import '../widgets/auth_logo_widget.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/forgot_password_button.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  late GlobalKey<FormState> formKey;
  bool isRememberMe = false;

  Future<void> checkLoginFunction() async {
    try {
      // if (!formKey.currentState!.validate()) {
      //   return;
      // }

      // Call provider but don't strictly require response since backend is commented out
      await ref
          .read(signInProvider.notifier)
          .signIn(emailTextEditingController.text.trim(), passwordTextEditingController.text.trim());

      // Navigate to choose role screen
      AppRoutes.instance.pushNamed(AppRoutesKey.instance.chooseRoleScreen);
    } catch (e) {
      errorLog("checkLoginFunction", e);
    }
  }

  void onInitialApp() {
    try {
      emailTextEditingController = .new();
      passwordTextEditingController = .new();
      formKey = .new();
    } catch (e) {
      errorLog("onInitialApp", e);
    }
  }

  @override
  void initState() {
    super.initState();
    onInitialApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const AuthLogoWidget(),
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFEFF2F6),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 20),
                    vertical: AppSize.width(value: 30),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppInputWidgetTwo(
                          padding: EdgeInsets.zero,
                          title: "E-mail",
                          hintText: "Enter email address",
                          prefix: const Icon(Icons.mail_outline, color: Colors.grey, size: 20),
                          suffixIcon: const Icon(Icons.fingerprint, color: Colors.grey, size: 20),
                          fillColor: const Color(0xFFE5E7EB),
                          borderColor: Colors.grey.shade400,
                          isEmail: true,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailTextEditingController,
                          textInputAction: TextInputAction.next,
                        ),
                        const Gap(height: 15),
                        AppInputWidgetTwo(
                          padding: EdgeInsets.zero,
                          title: "Password",
                          hintText: "123456",
                          prefix: const Icon(Icons.lock_outline, color: Colors.grey, size: 20),
                          fillColor: const Color(0xFFE5E7EB),
                          borderColor: Colors.grey.shade400,
                          isPassWord: true,
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          controller: passwordTextEditingController,
                          textInputAction: TextInputAction.done,
                        ),
                        const Gap(height: 10),
                        RememberMeCheckbox(
                          value: isRememberMe,
                          onChanged: (value) {
                            setState(() {
                              isRememberMe = value ?? false;
                            });
                          },
                        ),
                        const Gap(height: 20),
                        AuthSubmitButton(title: "Sign in", onTap: checkLoginFunction, provider: signInProvider),
                        const Gap(height: 20),
                        const ForgotPasswordButton(),
                        const Gap(height: 15),
                        AuthRedirectionText(
                          text: "Don't have an account? ",
                          actionText: "Sign up",
                          onTap: () {
                            AppRoutes.instance.pushNamed(AppRoutesKey.instance.chooseRoleScreen);
                          },
                        ),
                        const Gap(height: 20),
                        const Center(
                          child: AppText(text: "Or", color: Colors.black87),
                        ),
                        const Gap(height: 20),
                        SocialLoginButton(
                          title: "Continue with Google",
                          icon: Image.asset(
                            AppAssertsImagePath.instance.googleIcon,
                            height: 20,
                            width: 20,
                            errorBuilder: (_, __, ___) => const Icon(Icons.g_mobiledata, color: Colors.red),
                          ),
                          onTap: () {},
                        ),
                        const Gap(height: 15),
                        SocialLoginButton(
                          title: "Continue with Apple",
                          icon: Image.asset(
                            AppAssertsImagePath.instance.appleIcon,
                            height: 24,
                            width: 24,
                            errorBuilder: (_, __, ___) => const Icon(Icons.apple, color: Colors.black, size: 24),
                          ),
                          onTap: () {},
                        ),
                        const Gap(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
