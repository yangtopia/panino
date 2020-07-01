import 'package:flutter/material.dart';
import 'cart_bloc.dart';

class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  CartProvider({Key key, CartBloc cartBloc, Widget child})
      : cartBloc = cartBloc ?? CartBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static CartBloc of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<CartProvider>())
          .cartBloc;
}
