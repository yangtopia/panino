import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: null)
        ],
      ),
    );
  }
}
