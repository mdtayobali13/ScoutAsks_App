import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';
import 'package:scoutasks/widgets/buttons/app_button.dart';
import 'package:image_picker/image_picker.dart';
import 'mock_photo_widget.dart';
import 'add_photo_button.dart';

class TaskEvidenceBottomSheet extends StatefulWidget {
  final String issueName;

  const TaskEvidenceBottomSheet({super.key, required this.issueName});

  static void show(BuildContext context, {required String issueName}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: TaskEvidenceBottomSheet(issueName: issueName),
      ),
    );
  }

  @override
  State<TaskEvidenceBottomSheet> createState() => _TaskEvidenceBottomSheetState();
}

class _TaskEvidenceBottomSheetState extends State<TaskEvidenceBottomSheet> {
  final List<XFile> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles.isNotEmpty) {
        setState(() {
          _selectedImages.addAll(pickedFiles);
        });
      }
    } catch (e) {
      debugPrint("Error picking images: \$e");
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: MediaQuery.of(context).viewInsets.bottom + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.instance.primaryBrandOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Task evidence',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Issue name ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              Text('(auto fill)', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
            ],
          ),
          const SizedBox(height: 8),
          TextFormField(
            style: const TextStyle(fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: widget.issueName,
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.instance.primary),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Descriptions',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          TextFormField(
            maxLines: 4,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
            decoration: InputDecoration(
              hintText: 'What happened?',
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.instance.primary),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Photos (optional)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ..._selectedImages.asMap().entries.map((entry) {
                return SelectedPhotoWidget(imagePath: entry.value.path, onRemove: () => _removeImage(entry.key));
              }),
              AddPhotoButton(onTap: _pickImages),
            ],
          ),
          const SizedBox(height: 32),
          AppButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: "Submit evidence",
            backgroundColor: AppColors.instance.primary, // Dark blue
            titleColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ],
      ),
    );
  }
}
