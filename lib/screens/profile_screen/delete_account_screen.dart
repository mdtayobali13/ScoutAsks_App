import 'package:flutter/material.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/screens/profile_screen/widgets/profile_input_widget.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool _isConfirmStep = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  const AuthBackButtonWidget(),
                  const Gap(width: 15),
                  Expanded(
                    child: AppText(
                      text: "Delete account",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: _isConfirmStep ? _buildConfirmStep() : _buildInitialStep(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialStep() {
    return Column(
      children: [
        const Gap(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 15, color: Colors.grey.shade600, height: 1.5),
            children: const [
              TextSpan(text: "Deleting your "),
              TextSpan(
                text: "Scoutasks",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              TextSpan(
                text:
                    " account will permanently remove all public and private information associated with your profile.",
              ),
            ],
          ),
        ),
        const Gap(height: 30),
        AppButton(
          title: "Continue to delete account",
          onTap: () {
            setState(() {
              _isConfirmStep = true;
            });
          },
          backgroundColor: const Color(0xFFFC394A),
          borderColor: Colors.transparent,
          titleColor: Colors.white,
          borderRadius: BorderRadius.circular(8),
          height: 50,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ],
    );
  }

  Widget _buildConfirmStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Gap(height: 20),
        Center(
          child: AppText(text: "Log in to confirm", fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const Gap(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.5),
            children: const [
              TextSpan(text: "Enter the login information for your "),
              TextSpan(
                text: "Scoutasks",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              TextSpan(text: " account to confirm deletion."),
            ],
          ),
        ),
        const Gap(height: 30),
        const ProfileInputWidget(label: "Gmail", hint: "example@gmail.com"),
        const Gap(height: 20),
        const ProfileInputWidget(label: "Password", hint: "123456", obscureText: true),
        const Gap(height: 30),
        AppButton(
          title: "Continue to delete account",
          onTap: () {
            // Final delete action
          },
          backgroundColor: const Color(0xFFFC394A),
          borderColor: Colors.transparent,
          titleColor: Colors.white,
          borderRadius: BorderRadius.circular(8),
          height: 50,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        const Gap(height: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              _isConfirmStep = false;
            });
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              children: const [
                TextSpan(text: "Don't want delete account, "),
                TextSpan(
                  text: "go back",
                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
