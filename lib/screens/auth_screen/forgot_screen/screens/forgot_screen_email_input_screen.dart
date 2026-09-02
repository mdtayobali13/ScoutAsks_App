import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider/forgot_password_provider.dart';
import 'package:scoutasks/constant/app_asserts_image_path.dart';
import 'package:scoutasks/utils/app_log.dart';
import 'package:scoutasks/utils/app_size.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/app_image/app_image.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import '../../widgets/auth_header_widget.dart';
import '../../widgets/auth_submit_button.dart';

class ForgotScreenEmailInputScreen extends ConsumerWidget {
  const ForgotScreenEmailInputScreen({
    super.key,
    required this.emailTextEditingController,
    required this.onChange,
    required this.formKey,
  });
  final void Function(int index) onChange;
  final TextEditingController emailTextEditingController;
  final GlobalKey<FormState> formKey;

  void checkCallSend(WidgetRef ref) async {
    try {
      // if (formKey.currentState!.validate()) {
      // final email = emailTextEditingController.text.trim();
      // final success = await ref.read(forgotPasswordProvider.notifier).forgotPassword(email: email);
      // if (success) {
      // await StorageServices.instance.setEmail(email);
      onChange(1);
      // }
      // }
    } catch (e) {
      errorLog("checkCallSend", e);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  const AuthHeaderWidget(
                    title: "Restore Your Shield",
                    subtitle: "Enter your registered email to receive a secure\nrecovery code",
                  ),
                  Gap(height: AppSize.width(value: 40)),

                  // E-mail Field
                  AppInputWidgetTwo(
                    title: "E-mail",
                    titleFontSize: 15,
                    titleColor: const Color(0xFF262626),
                    hintText: "vuhaithuongnute@gmail.com",
                    padding: EdgeInsets.zero,
                    fillColor: Colors.white,
                    borderColor: Colors.grey.shade400,
                    controller: emailTextEditingController,
                    isEmail: true,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(height: AppSize.width(value: 30)),

                  // Send code Button
                  AuthSubmitButton(
                    title: "Send code",
                    onTap: () => checkCallSend(ref),
                    provider: forgotPasswordProvider,
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
