import 'package:flutter/material.dart';
import 'bloc/cart_provider.dart';

import 'item.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var cartBloc = CartProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: StreamBuilder<List<Item>>(
          stream: cartBloc.cartList$,
          builder: (context, snapshot) {
            var sum = (() {
              if (snapshot.hasData && snapshot.data.length > 0) {
                return snapshot.data
                    .map((e) => e.price)
                    .reduce((value, element) => value + element);
              }
              return 0;
            })();
            return Center(
              child: Text(
                '합계: $sum',
                style: TextStyle(fontSize: 30),
              ),
            );
          },
        ));
  }
}
