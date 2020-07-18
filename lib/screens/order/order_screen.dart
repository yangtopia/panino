import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주문내역'),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: null)
        ],
      ),
    );
  }
}
