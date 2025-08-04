import 'dart:developer';

import 'package:chatso/data/models/product_model.dart';
import 'package:chatso/data/service/users_add_service.dart';
import 'package:flutter/material.dart';

class AddUsersProvider extends ChangeNotifier {
  UsersAddService service = UsersAddService();

  bool isLoading = false;
  String? error;

  Future<void> userAdd(ProductModel products) async {
    isLoading = true;
    error = null;
    notifyListeners();  
    try {
      await service.addToSupa(products);
      log('Product added provider success');
    } catch (e) {
      error = e.toString();
      log('failed to add product');
    }
    finally{
      isLoading = false;
      notifyListeners();
    }
  }
}
