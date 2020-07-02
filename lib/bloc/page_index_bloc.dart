import 'package:rxdart/rxdart.dart';

class PageIndexBloc {
  final _pageIndexSubject = BehaviorSubject<int>.seeded(0);

  void changePageIndex(int currentPageIndex) {
    _pageIndexSubject.add(currentPageIndex);
  }

  Stream<int> get pageIndexStream$ => _pageIndexSubject.stream;
}
