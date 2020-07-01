import 'package:flutter/material.dart';

import 'bloc/cart_bloc.dart';
import 'bloc/cart_provider.dart';
import 'cart.dart';
import 'item.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    var cartBloc = CartProvider.of(context);
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
      body: StreamBuilder(
        stream: cartBloc.cartList$,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
                children: cartBloc.itemList
                    .map((item) => _buildItem(item, snapshot.data, cartBloc))
                    .toList());
          } else {
            return CircularProgressIndicator();
          }
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
                  cartBloc.dispatch(CartEvent(CartEventType.remove, item));
                } else {
                  cartBloc.dispatch(CartEvent(CartEventType.add, item));
                }
              });
            }),
      ),
    );
  }
}
