import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../pages/index.dart';

enum PageIndex {
  home,
  video,
  favorite,
  order,
  mypage
}

final Map<PageIndex, Widget> pages = {
  PageIndex.home: HomePage(),
  PageIndex.video: VideoPage(),
  PageIndex.favorite: FavoritePage(),
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
