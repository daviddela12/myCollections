import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationNotifier with ChangeNotifier {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  int get getCurrentIndex => _currentIndex;

  void updateCurrentIndex(int index) {
    _currentIndex = index;

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    notifyListeners();
  }

  PageController get getPageController => _pageController;
}
