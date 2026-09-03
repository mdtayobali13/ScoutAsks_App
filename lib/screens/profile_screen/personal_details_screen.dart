import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoutasks/screens/auth_screen/choose_role_screen/role_provider.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoutasks/screens/auth_screen/choose_role_screen/choose_role_screen.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/constant/app_colors.dart';

class PersonalDetailsScreen extends ConsumerStatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  ConsumerState<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends ConsumerState<PersonalDetailsScreen> {
  XFile? _profileImage;
  final ImagePicker _picker = ImagePicker();
  bool _isPickingImage = false;

  Future<void> _pickImage() async {
    if (_isPickingImage) return;

    setState(() {
      _isPickingImage = true;
    });

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _profileImage = image;
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    } finally {
      if (mounted) {
        setState(() {
          _isPickingImage = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final role = ref.watch(userRoleProvider);
    final isTechnician = role == 'technician';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  const AuthBackButtonWidget(),
                  const Gap(width: 15),
                  AppText(text: "Personal details", fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(height: 20),
                    // Profile Image with Camera Badge
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.red.shade700,
                            backgroundImage: _profileImage != null ? FileImage(File(_profileImage!.path)) : null,
                            child: _profileImage == null
                                ? const Icon(Icons.person, size: 50, color: Colors.white)
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: _pickImage,
                              borderRadius: BorderRadius.circular(20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.4),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
                                    ),
                                    child: Icon(Icons.camera_alt_outlined, size: 16, color: Colors.red.shade700),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(height: 30),

                    // Form Fields
                    const AppInputWidgetTwo(
                      title: "Full name",
                      titleFontSize: 16,
                      fontWeight: FontWeight.bold,
                      hintText: "Enter full name",
                      fillColor: Colors.white,
                      borderColor: Colors.grey,
                    ),
                    const Gap(height: 15),

                    AppInputWidgetTwo(
                      title: "Corporate E-mail",
                      titleFontSize: 16,
                      fontWeight: FontWeight.bold,
                      hintText: "Enter email address",
                      prefix: Icon(Icons.mail_outline, color: Colors.grey.shade500),
                      fillColor: Colors.white,
                      borderColor: Colors.grey,
                    ),
                    const Gap(height: 15),

                    if (isTechnician) ...[
                      AppInputWidgetTwo(
                        title: "Government ID Upload",
                        titleFontSize: 16,
                        fontWeight: FontWeight.bold,
                        hintText: "Attach file",
                        readOnly: true,
                        suffixIcon: Icon(Icons.attach_file, color: Colors.grey.shade600),
                        fillColor: Colors.white,
                        borderColor: Colors.grey,
                      ),
                      const Gap(height: 15),
                      AppInputWidgetTwo(
                        title: "Business Registration Upload (if applicable)",
                        titleFontSize: 16,
                        fontWeight: FontWeight.bold,
                        hintText: "Attach file",
                        readOnly: true,
                        suffixIcon: Icon(Icons.attach_file, color: Colors.grey.shade600),
                        fillColor: Colors.white,
                        borderColor: Colors.grey,
                      ),
                      const Gap(height: 15),
                      AppInputWidgetTwo(
                        title: "Certifications Upload",
                        titleFontSize: 16,
                        fontWeight: FontWeight.bold,
                        hintText: "Attach file",
                        readOnly: true,
                        suffixIcon: Icon(Icons.attach_file, color: Colors.grey.shade600),
                        fillColor: Colors.white,
                        borderColor: Colors.grey,
                      ),
                      const Gap(height: 15),
                      AppInputWidgetTwo(
                        title: "Insurance Documents Upload",
                        titleFontSize: 16,
                        fontWeight: FontWeight.bold,
                        hintText: "Attach file",
                        readOnly: true,
                        suffixIcon: Icon(Icons.attach_file, color: Colors.grey.shade600),
                        fillColor: Colors.white,
                        borderColor: Colors.grey,
                      ),
                      const Gap(height: 15),
                    ],

                    AppInputWidgetTwo(
                      title: "Address",
                      titleFontSize: 16,
                      fontWeight: FontWeight.bold,
                      hintText: "Enter address",
                      prefix: Icon(Icons.location_on_outlined, color: Colors.grey.shade500),
                      fillColor: Colors.white,
                      borderColor: Colors.grey,
                    ),
                    const Gap(height: 15),

                    AppInputWidgetTwo(
                      title: "Mobile",
                      titleFontSize: 16,
                      fontWeight: FontWeight.bold,
                      hintText: "Enter mobile number",
                      keyboardType: TextInputType.phone,
                      prefix: Icon(Icons.phone_outlined, color: Colors.grey.shade500),
                      fillColor: Colors.white,
                      borderColor: Colors.grey,
                    ),
                    const Gap(height: 30),
                  ],
                ),
              ),
            ),

            // Save Changes Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: AppButton(
                title: "Save changes",
                onTap: () {},
                backgroundColor: AppColors.instance.primaryBrandBlue,
                titleColor: Colors.white,
                borderRadius: BorderRadius.circular(8),
                height: 50,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
