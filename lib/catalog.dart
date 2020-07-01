import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'cart.dart';
import 'item.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    // print(_cartBloc.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: [
          IconButton(
              icon: Icon(Icons.archive),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(),
                    ));
              })
        ],
      ),
      body: BlocBuilder<CartBloc, List<Item>>(
        builder: (context, state) {
          return ListView(
              children: _itemList
                  .map((item) => _buildItem(item, state, _cartBloc))
                  .toList());
        },
      ),
    );
  }

  Widget _buildItem(Item item, List<Item> state, CartBloc cartBloc) {
    final isChecked = state.contains(item);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(fontSize: 31.0),
        ),
        subtitle: Text('${item.price}'),
        trailing: IconButton(
            icon: isChecked
                ? Icon(Icons.check, color: Colors.red)
                : Icon(
                    Icons.check,
                  ),
            onPressed: () {
              setState(() {
                if (isChecked) {
                  cartBloc.add(CartEvent(CartEventType.remove, item));
                } else {
                  cartBloc.add(CartEvent(CartEventType.add, item));
                }
              });
            }),
      ),
    );
  }
}
