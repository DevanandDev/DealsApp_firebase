import 'package:chatso/data/service/product_fetch_service.dart';
import 'package:flutter/material.dart';

class ProductFetchProvider extends ChangeNotifier{
   ProductFetchService _service = ProductFetchService();

   List<Map<String,dynamic>> productList=[];
  bool isLoding = false;

   Future<void> loadData()async{
    isLoding = true;
    notifyListeners();
    try {
      productList = await _service.fetchService();
    } catch (e) {
      throw Exception('Provider data not loaded : $e');
    }
    finally{
      isLoding =false;
      notifyListeners();
    }
   }
}