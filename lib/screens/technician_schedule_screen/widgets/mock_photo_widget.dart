import 'dart:io';
import 'package:flutter/material.dart';

class SelectedPhotoWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onRemove;

  const SelectedPhotoWidget({
    super.key,
    required this.imagePath,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: FileImage(File(imagePath)),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 2)
                  ],
                ),
                child: const Icon(Icons.close, size: 10, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
