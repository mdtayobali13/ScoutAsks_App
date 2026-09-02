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

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late GlobalKey<FormState> formKey;
  late TextEditingController nameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController phoneNumberTextEditingController;
  late TextEditingController passwordTextEditingController;
  late TextEditingController confirmPasswordTextEditingController;
  late TextEditingController storeNameTextEditingController;
  late TextEditingController storeBioTextEditingController;
  late TextEditingController storeAddressTextEditingController;
  late TextEditingController storeImageController;

  late TextEditingController fontImageController;
  late TextEditingController backImageController;

  void onAppInitial() {
    try {
      nameTextEditingController = TextEditingController();
      emailTextEditingController = TextEditingController();
      phoneNumberTextEditingController = TextEditingController();
      passwordTextEditingController = TextEditingController();
      confirmPasswordTextEditingController = TextEditingController();
      storeNameTextEditingController = TextEditingController();
      storeBioTextEditingController = TextEditingController();
      storeAddressTextEditingController = TextEditingController();
      fontImageController = TextEditingController();
      backImageController = TextEditingController();
      storeImageController = TextEditingController();
      var provider = ref.read(signUpProvider);
      nameTextEditingController.text = provider.name;
      emailTextEditingController.text = provider.email;
      phoneNumberTextEditingController.text = provider.phoneNumber;
      passwordTextEditingController.text = provider.password;
      confirmPasswordTextEditingController.text = provider.confirmPassword;
      fontImageController.text = provider.idCardFrontendPart;
      backImageController.text = provider.idCardBackendPart;
      storeNameTextEditingController.text = provider.storeName;
      storeBioTextEditingController.text = provider.storeBio;
      storeAddressTextEditingController.text = provider.storeAddress;
      storeImageController.text = provider.storePhoto;
      formKey = GlobalKey<FormState>();
    } catch (e) {
      errorLog("onAppInitial", e);
    }
  }

  void onAppClose() {
    try {
      nameTextEditingController.dispose();
      emailTextEditingController.dispose();
      phoneNumberTextEditingController.dispose();
      passwordTextEditingController.dispose();
      confirmPasswordTextEditingController.dispose();
      fontImageController.dispose();
      backImageController.dispose();
      storeAddressTextEditingController.dispose();
      storeBioTextEditingController.dispose();
      storeNameTextEditingController.dispose();
      storeImageController.dispose();
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

                  // E-mail Field
                  AppInputWidgetTwo(
                    title: "E-mail",
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
                      //   await ref.read(signUpProvider.notifier).customerSignUp(formKey: formKey);
                      // }
                      AppRoutes.instance.pushNamed(AppRoutesKey.instance.signUpVerifyScreen);
                    },
                    provider: signUpProvider.select((p) => p.isLoading),
                  ),
                  Gap(height: AppSize.width(value: 20)),
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
