import 'dart:developer';

import 'package:chatso/data/service/image_add_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageAddProvider extends ChangeNotifier {
  ImageAddService service = ImageAddService();
  final ImagePicker picked = ImagePicker();

  List<XFile> selectedImages = [];
  List<String> uploadImageUrl = [];
  bool isLoading = false;
  String? error;

  Future<void> pickImage() async {
    try {
      final images = await picked.pickMultiImage();
      if (images.isNotEmpty || images != null) {
        selectedImages = images;
        await uploadImages();
      }
    } catch (e) {
      log('image not found : $e');
      error = 'picking image failed';
    }
    notifyListeners();
  }

  Future<List<String>> uploadImages() async {
    isLoading = true;
    notifyListeners();

    try {
      uploadImageUrl = await service.uploadImage(selectedImages);
      return uploadImageUrl;

    } catch (e) {
      log('Image not uploaded : $e');
      error = 'Image upload failed';
      return [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clearAll() {
    selectedImages.clear();
    uploadImageUrl.clear();
    error = null;
    notifyListeners();
  }
}
