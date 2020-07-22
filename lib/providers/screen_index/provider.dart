import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';

class ScreenIndexProvider with ChangeNotifier {
  ScreenIndex _currentIndex = ScreenIndex.home;
  ScreenIndex get currentIndex => _currentIndex;

  void changeIndex(ScreenIndex screenIndex) {
    _currentIndex = ScreenIndex.values[screenIndex.index];
    notifyListeners();
  }
}
