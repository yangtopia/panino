import 'package:rxdart/rxdart.dart';

class CounterBloc {
  final _countSubject = BehaviorSubject<int>.seeded(0);

  void addCounter() {
    _countSubject.add(_countSubject.value + 1);
  }

  Stream<int> get count$ => _countSubject.stream;
}
