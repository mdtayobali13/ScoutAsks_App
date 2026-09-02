import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoutasks/screens/auth_screen/widgets/auth_back_button_widget.dart';
import 'package:scoutasks/utils/gap.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:scoutasks/widgets/inputs/app_input_widget_tow.dart';
import 'package:scoutasks/widgets/texts/app_text.dart';

class CreateJobDialog extends StatefulWidget {
  const CreateJobDialog({super.key});

  @override
  State<CreateJobDialog> createState() => _CreateJobDialogState();
}

class _CreateJobDialogState extends State<CreateJobDialog> {
  String _selectedLevel = "Medium Urgency";
  final List<String> _levels = ["High Urgency", "Medium Urgency", "Low Urgency"];

  final List<dynamic> _images = [
    "https://images.unsplash.com/photo-1581578731548-c64695cc6952?q=80&w=300&auto=format&fit=crop",
    "https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=300&auto=format&fit=crop",
    "https://images.unsplash.com/photo-1513694203232-719a280e022f?q=80&w=300&auto=format&fit=crop",
  ];

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
          _images.add(image);
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

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
              child: Row(
                children: [
                  const AuthBackButtonWidget(),
                  const Gap(width: 15),
                  AppText(text: "Create a job", fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                ],
              ),
            ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(height: 10),
                    _buildLabel("Job title"),
                    const Gap(height: 6),
                    const AppInputWidgetTwo(
                      hintText: "Enter job title",
                      fillColor: Colors.white,
                      padding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    ),
                    const Gap(height: 12),

                    _buildLabel("Level"),
                    const Gap(height: 6),
                    PopupMenuButton<String>(
                      color: Colors.white,
                      offset: const Offset(0, 50),
                      onSelected: (value) {
                        setState(() {
                          _selectedLevel = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return _levels.map((String level) {
                          return PopupMenuItem<String>(
                            value: level,
                            child: AppText(text: level, fontSize: 14, color: Colors.black87),
                          );
                        }).toList();
                      },
                      child: AbsorbPointer(
                        child: AppInputWidgetTwo(
                          hintText: _selectedLevel,
                          fillColor: Colors.white,
                          readOnly: true,
                          padding: EdgeInsets.zero,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                          suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
                        ),
                      ),
                    ),
                    const Gap(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel("Budget (Min)"),
                              const Gap(height: 6),
                              const AppInputWidgetTwo(
                                hintText: "\$65",
                                fillColor: Colors.white,
                                keyboardType: TextInputType.number,
                                padding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                              ),
                            ],
                          ),
                        ),
                        const Gap(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel("Budget (Max)"),
                              const Gap(height: 6),
                              const AppInputWidgetTwo(
                                hintText: "\$120",
                                fillColor: Colors.white,
                                keyboardType: TextInputType.number,
                                padding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(height: 12),

                    _buildLabel("Address"),
                    const Gap(height: 6),
                    const AppInputWidgetTwo(
                      hintText: "Enter",
                      fillColor: Colors.white,
                      padding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    ),
                    const Gap(height: 12),

                    _buildLabel("Description"),
                    const Gap(height: 6),
                    const AppInputWidgetTwo(
                      hintText: "Describe yor task",
                      fillColor: Colors.white,
                      maxLines: 4,
                      padding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    ),
                    const Gap(height: 15),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildLabel("Images"),
                        const Gap(width: 5),
                        AppText(text: "(optional)", fontSize: 12, color: Colors.grey.shade500),
                      ],
                    ),
                    const Gap(height: 10),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ..._images
                              .asMap()
                              .entries
                              .map((entry) => _buildImageThumbnail(entry.key, entry.value))
                              .toList(),
                          _buildAddButton(),
                        ],
                      ),
                    ),
                    const Gap(height: 30),

                    AppButton(
                      title: "Register asset",
                      onTap: () {},
                      backgroundColor: const Color(0xFF143B66), // Dark Blue
                      titleColor: Colors.white,
                      height: 50,
                      borderRadius: BorderRadius.circular(8),
                      fontWeight: FontWeight.w600,
                    ),
                    const Gap(height: 15),
                    AppButton(
                      title: "Cancel",
                      onTap: () => Navigator.of(context).pop(),
                      backgroundColor: Colors.grey.shade600,
                      titleColor: Colors.white,
                      height: 50,
                      borderRadius: BorderRadius.circular(8),
                      fontWeight: FontWeight.w600,
                    ),
                    const Gap(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return AppText(text: text, fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87);
  }

  Widget _buildImageThumbnail(int index, dynamic image) {
    ImageProvider imageProvider;
    if (image is String) {
      imageProvider = NetworkImage(image);
    } else if (image is XFile) {
      imageProvider = FileImage(File(image.path));
    } else {
      imageProvider = const NetworkImage("");
    }

    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 70,
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: GestureDetector(
              onTap: () => _removeImage(index),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.close, color: Colors.red, size: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: Colors.black54, size: 24),
            const Gap(height: 4),
            AppText(text: "Add", fontSize: 12, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
