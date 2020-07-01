import 'package:flutter_bloc/flutter_bloc.dart';

import '../item.dart';

enum CartEventType { add, remove }

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc extends Bloc<CartEvent, List<Item>> {
  @override
  List<Item> get initialState => [];

  @override
  Stream<List<Item>> mapEventToState(CartEvent event) async* {
    switch (event.type) {
      case CartEventType.add:
        state.add(event.item);
        yield state;
        break;
      case CartEventType.remove:
        state.remove(event.item);
        yield state;
        break;
    }
  }
}
