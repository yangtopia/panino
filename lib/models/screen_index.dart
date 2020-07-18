import 'package:flutter/material.dart';
import '../screens/screens.dart';

enum ScreenIndex { home, recipe, order, mypage }

final Map<ScreenIndex, Widget> screens = {
  ScreenIndex.home: HomeScreen(),
  ScreenIndex.recipe: RecipeScreen(),
  ScreenIndex.order: OrderScreen(),
  ScreenIndex.mypage: MyScreen(),
};

final bottomNavigationBarItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('홈')),
  BottomNavigationBarItem(icon: Icon(Icons.fastfood), title: Text('주문하기')),
  BottomNavigationBarItem(icon: Icon(Icons.receipt), title: Text('주문내역')),
  BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('설정')),
];
