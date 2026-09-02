import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/routes/app_routes.dart';
import 'package:scoutasks/screens/auth_screen/sign_up_screen/provider/sign_up_provider.dart';
import 'package:scoutasks/utils/app_log.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import '../../../routes/app_routes_key.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/auth_redirection_text.dart';

class TechnicianSignUpScreen extends ConsumerStatefulWidget {
  const TechnicianSignUpScreen({super.key});

  @override
  ConsumerState<TechnicianSignUpScreen> createState() => _TechnicianSignUpScreenState();
}

class _TechnicianSignUpScreenState extends ConsumerState<TechnicianSignUpScreen> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailTextEditingController;
  late TextEditingController nameTextEditingController;
  late TextEditingController passwordTextEditingController;
  late TextEditingController confirmPasswordTextEditingController;

  late TextEditingController govIdController;
  late TextEditingController businessRegController;
  late TextEditingController certController;
  late TextEditingController insuranceController;

  void onAppInitial() {
    try {
      emailTextEditingController = TextEditingController();
      nameTextEditingController = TextEditingController();
      passwordTextEditingController = TextEditingController();
      confirmPasswordTextEditingController = TextEditingController();

      govIdController = TextEditingController();
      businessRegController = TextEditingController();
      certController = TextEditingController();
      insuranceController = TextEditingController();

      var provider = ref.read(signUpProvider);
      emailTextEditingController.text = provider.email;
      nameTextEditingController.text = provider.name;
      passwordTextEditingController.text = provider.password;
      confirmPasswordTextEditingController.text = provider.confirmPassword;
      formKey = GlobalKey<FormState>();
    } catch (e) {
      errorLog("onAppInitial", e);
    }
  }

  void onAppClose() {
    try {
      emailTextEditingController.dispose();
      nameTextEditingController.dispose();
      passwordTextEditingController.dispose();
      confirmPasswordTextEditingController.dispose();

      govIdController.dispose();
      businessRegController.dispose();
      certController.dispose();
      insuranceController.dispose();
    } catch (e) {
      errorLog("onAppClose", e);
    }
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
                  const AuthHeaderWidget(
                    title: "Your daily helper",
                    subtitle: "Daily house work management\nmade simple",
                  ),
                  Gap(height: AppSize.width(value: 30)),

                  // Corporate E-mail Field
                  AppInputWidgetTwo(
                    title: "Corporate E-mail",
                    titleFontSize: 15,
                    titleColor: const Color(0xFF262626),
                    hintText: "Enter email address",
                    padding: EdgeInsets.zero,
                    controller: emailTextEditingController,
                    isEmail: true,
                    prefix: Icon(Icons.mail_outline, color: Colors.grey.shade600, size: 20),
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade400,
                    onChanged: (v) {
                      ref.read(signUpProvider.notifier).stateUpdate(email: v);
                    },
                  ),
                  Gap(height: AppSize.width(value: 15)),

                  // Full name Field
                  AppInputWidgetTwo(
                    title: "Full name",
                    titleFontSize: 15,
                    titleColor: const Color(0xFF262626),
                    hintText: "Enter full name",
                    padding: EdgeInsets.zero,
                    controller: nameTextEditingController,
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade400,
                    onChanged: (v) {
                      ref.read(signUpProvider.notifier).stateUpdate(name: v);
                    },
                  ),
                  Gap(height: AppSize.width(value: 15)),

                  // Government ID Upload
                  AppInputWidgetTwo(
                    title: "Government ID Upload",
                    titleFontSize: 15,
                    titleColor: const Color(0xFF262626),
                    hintText: "Attach file",
                    padding: EdgeInsets.zero,
                    controller: govIdController,
                    readOnly: true,
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade400,
                    suffixIcon: Icon(Icons.attach_file, color: Colors.grey.shade600, size: 20),
                    onTap: () {
                      // Handle file upload
                    },
                  ),
                  Gap(height: AppSize.width(value: 15)),

                  // Business Registration Upload
                  AppInputWidgetTwo(
                    title: "Business Registration Upload (if applicable)",
                    titleFontSize: 15,
                    titleColor: const Color(0xFF262626),
                    hintText: "Attach file",
                    padding: EdgeInsets.zero,
                    controller: businessRegController,
                    readOnly: true,
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade400,
                    suffixIcon: Icon(Icons.attach_file, color: Colors.grey.shade600, size: 20),
                    onTap: () {
                      // Handle file upload
                    },
                  ),
                  Gap(height: AppSize.width(value: 15)),

                  // Certifications Upload
                  AppInputWidgetTwo(
                    title: "Certifications Upload",
                    titleFontSize: 15,
                    titleColor: const Color(0xFF262626),
                    hintText: "Attach file",
                    padding: EdgeInsets.zero,
                    controller: certController,
                    readOnly: true,
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade400,
                    suffixIcon: Icon(Icons.attach_file, color: Colors.grey.shade600, size: 20),
                    onTap: () {
                      // Handle file upload
                    },
                  ),
                  Gap(height: AppSize.width(value: 15)),

                  // Insurance Documents Upload
                  AppInputWidgetTwo(
                    title: "Insurance Documents Upload",
                    titleFontSize: 15,
                    titleColor: const Color(0xFF262626),
                    hintText: "Attach file",
                    padding: EdgeInsets.zero,
                    controller: insuranceController,
                    readOnly: true,
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade400,
                    suffixIcon: Icon(Icons.attach_file, color: Colors.grey.shade600, size: 20),
                    onTap: () {
                      // Handle file upload
                    },
                  ),
                  Gap(height: AppSize.width(value: 15)),

                  // Password Field
                  AppInputWidgetTwo(
                    title: "Password",
                    titleFontSize: 15,
                    titleColor: const Color(0xFF262626),
                    hintText: "123456",
                    padding: EdgeInsets.zero,
                    controller: passwordTextEditingController,
                    isPassWord: true,
                    prefix: Icon(Icons.lock_outline, color: Colors.grey.shade600, size: 20),
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade400,
                    onChanged: (v) {
                      ref.read(signUpProvider.notifier).stateUpdate(password: v);
                    },
                  ),
                  Gap(height: AppSize.width(value: 15)),

                  // Confirm password Field
                  AppInputWidgetTwo(
                    title: "Confirm password",
                    titleFontSize: 15,
                    titleColor: const Color(0xFF262626),
                    hintText: "123456",
                    padding: EdgeInsets.zero,
                    controller: confirmPasswordTextEditingController,
                    isPassWord: true,
                    prefix: Icon(Icons.lock_outline, color: Colors.grey.shade600, size: 20),
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade400,
                  ),
                  Gap(height: AppSize.width(value: 30)),

                  // Create an account Button
                  AuthSubmitButton(
                    title: "Create an account",
                    onTap: () async {
                      // if (formKey.currentState!.validate()) {
                      // await ref.read(signUpProvider.notifier).vendorSignup();
                      // }
                      AppRoutes.instance.pushNamed(AppRoutesKey.instance.signUpVerifyScreen);
                    },
                    provider: signUpProvider.select((p) => p.isLoading),
                  ),
                  Gap(height: AppSize.width(value: 20)),

                  // Sign in Redirection
                  AuthRedirectionText(
                    text: "Already have an account? ",
                    actionText: "Sign in",
                    onTap: () {
                      AppRoutes.instance.go(AppRoutesKey.instance.signInScreen);
                    },
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
