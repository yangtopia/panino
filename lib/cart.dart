import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'item.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocProvider<CartBloc>(
        create: (context) => _cartBloc,
        child: BlocBuilder<CartBloc, List<Item>>(
          builder: (context, state) {
            var sum = (() {
              if (state.length > 0) {
                return state
                    .map((e) => e.price)
                    .reduce((acc, price) => acc + price);
              }
              return 0;
            })();
            return Center(
              child: Text(
                '합계 $sum',
                style: TextStyle(fontSize: 30),
              ),
            );
          },
        ),
      ),
    );
  }
}
