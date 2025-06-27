import 'package:chatso/services/product_add_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Productaddprovider with ChangeNotifier {
  final Productaddservice _service = Productaddservice();
  List<XFile> imageList = [];
  bool isLoding = false;

  void selectImages(List<XFile> images) {
    imageList = images;
    notifyListeners();
  }

  Future<void> addImageProvider({
    required String name,
    required String price,
    required String description,
  }) async {
    try {
      isLoding = true;
      notifyListeners();

      final uploadedImages = await _service.uploadImages(imageList);

      await _service.saveProduct(
        name: name,
        price: price,
        description: description,
        imageList: uploadedImages,
      );

      isLoding = false;
      notifyListeners();
    } catch (e) {
      isLoding = false;
      notifyListeners();
      throw Exception('Provider Error: $e');
    }
  }
}
