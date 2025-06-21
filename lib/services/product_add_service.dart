import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class Productaddservice {
  final supabase = Supabase.instance.client;

  Future<List<String>> uploadImages(List<XFile> images) async {
    List<String> imageList = [];

    for (XFile image in images) {
      final bytes = await image.readAsBytes();
      final fileName = '${Uuid().v4()}-${image.name}';
      final filePath = 'products/${fileName}';

      try {
        final response = await supabase.storage
            .from('products')
            .uploadBinary(
              filePath,
              bytes,
              fileOptions: FileOptions(contentType: 'image/jpeg'),
            );

         final publicUrl = supabase.storage
          .from('products')
          .getPublicUrl(filePath);

      imageList.add(publicUrl);
      
      } catch (e) {
        print('Insert failde : $e');
      }
     
    }
    return imageList;
  }

  Future<void> saveProduct({
    required String name,
    required String price,
    required String description,
    required List<String> imageList,
  }) async {
    try {
      final response = await supabase.from('products').insert({
        'name': name,
        'price': price,
        'description': description,
        'images': imageList,
        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
