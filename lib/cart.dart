import 'package:flutter/material.dart';

import 'item.dart';
import 'main.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: StreamBuilder<List<Item>>(
          stream: cartBloc.cartList$,
          builder: (context, snapshot) {
            var sum = (() {
              if (snapshot.data.length > 0) {
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
