import 'dart:developer';

import 'package:chatso/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UsersAddService {
  final userDetails = Supabase.instance.client.from('products');

  Future<void> addToSupa(ProductModel data) async {
    try {
      await userDetails.insert([data.toSupa()]);
      log('error in adding service');
    } on Supabase catch (e) {
      log('user not added : $e');
      
    }
  }
}
