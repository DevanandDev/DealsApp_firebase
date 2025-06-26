import 'package:flutter/foundation.dart';

class Bottomnavprovider extends ChangeNotifier{
  int index = 0;

  void ChangeIndex(int newIndex){
    index = newIndex;
    notifyListeners();
  }
}