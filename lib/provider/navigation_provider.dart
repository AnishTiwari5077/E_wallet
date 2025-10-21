import 'package:flutter/material.dart';

/// Manages navigation and global app state
class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }
}
