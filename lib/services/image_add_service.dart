import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class ImageAddService {
  final supabase = Supabase.instance.client;
  final bucketName = 'images';

  Future<List<String>> uploadImage(List<XFile> files) async {
    List<String> uploaded = [];

    for (XFile file in files) {
      try {
        final fileName = ('${const Uuid().v4()}-${file.name}');
        final bytes = await file.readAsBytes();

        await supabase.storage.from(bucketName).uploadBinary(fileName, bytes);

        final url =  supabase.storage
            .from(bucketName)
            .getPublicUrl(fileName);

        uploaded.add(url);
      } catch (e) {
        log('the image service not worked : $e');
        throw Exception('image upload failed');
      }
    }
    return uploaded;
  }
}
