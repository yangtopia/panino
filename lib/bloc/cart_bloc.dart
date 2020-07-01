import 'package:rxdart/rxdart.dart';

import '../item.dart';

enum CartEventType { add, remove }

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc {
  final itemList = [
    Item('맥북', 2000000),
    Item('생존코딩', 32000),
    Item('될때까지 안드로이드', 42000),
    Item('새우깡', 3200),
    Item('신라면', 2000),
  ];

  final _cartList = <Item>[];

  final _cartListSubject = BehaviorSubject<List<Item>>.seeded([]);

  Stream<List<Item>> get cartList$ => _cartListSubject.stream;

  void dispatch(CartEvent event) {
    switch (event.type) {
      case CartEventType.add:
        _cartList.add(event.item);
        break;
      case CartEventType.remove:
        _cartList.remove(event.item);
        break;
    }

    _cartListSubject.add(_cartList);
  }
}
