import 'package:chatso/services/product_add_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Productaddprovider extends ChangeNotifier {
  Productaddservice service = Productaddservice();

  List<XFile> imageList = [];
  bool isLoding = false;

  void selectImages(List<XFile> image) {
    imageList = image;
    notifyListeners();
  }

  Future<void> addImageProvider({
    required String name,
    required String price,
    required String description,
  }) async {
    isLoding = true;
    notifyListeners();

    try {
      final uploadUrl = await service.uploadImages(imageList);
      await service.saveProduct(
        name: name,
        price: price,
        description: description,
        imageList: uploadUrl,
      );
    } catch (e) {
      rethrow;
    }
    finally{
      isLoding =false;
      notifyListeners();
    }
  }
}
