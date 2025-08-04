import 'package:supabase_flutter/supabase_flutter.dart';

class ProductFetchService {
  final supabase = Supabase.instance.client;

  Future<List<Map<String,dynamic>>> fetchService()async{
  try {
    final response = await supabase.from('products').select();
    return List<Map<String,dynamic>>.from(response);
  } catch (e) {
    throw Exception('Fetch Error : $e');
  }
  }
}