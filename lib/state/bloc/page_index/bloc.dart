import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../pages/index.dart';

enum PageIndex { home, video, recipe, order, mypage }

class PageInfo {
  Widget widget;
  String title;
  PageInfo(this.widget, this.title);
}

final Map<PageIndex, PageInfo> pageInfoMap = {
  PageIndex.home: PageInfo(HomePage(), '홈'),
  PageIndex.video: PageInfo(VideoPage(), 'TV'),
  PageIndex.recipe: PageInfo(RecipePage(), '레시피'),
  PageIndex.order: PageInfo(OrderPage(), '주문내역'),
  PageIndex.mypage: PageInfo(MyPage(), '마이')
};


final Map<PageIndex, Widget> pages = {
  PageIndex.home: HomePage(),
  PageIndex.video: VideoPage(),
  PageIndex.recipe: RecipePage(),
  PageIndex.order: OrderPage(),
  PageIndex.mypage: MyPage(),
};

class PageIndexBloc {
  final _pageIndexSubject = BehaviorSubject<PageIndex>();

  void changePageIndex(int currentPageIndex) {
    _pageIndexSubject.add(PageIndex.values[currentPageIndex]);
  }

  Stream<PageIndex> get pageIndexStream$ => _pageIndexSubject.stream;
}
