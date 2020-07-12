import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../pages/pages.dart';

enum PageIndex { home, recipe, order, mypage }

final Map<PageIndex, Widget> pages = {
  PageIndex.home: HomePage(),
  PageIndex.recipe: RecipePage(),
  PageIndex.order: OrderPage(),
  PageIndex.mypage: MyPage(),
};

final bottomNavigationBarItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('홈')),
  BottomNavigationBarItem(icon: Icon(Icons.fastfood), title: Text('레시피')),
  BottomNavigationBarItem(
      icon: Icon(Icons.airport_shuttle), title: Text('주문내역')),
  BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('MY')),
];

class PageIndexProvider with ChangeNotifier {
  PageIndex _currentIndex = PageIndex.home;
  PageIndex get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = PageIndex.values[index];
    notifyListeners();
  }
}
