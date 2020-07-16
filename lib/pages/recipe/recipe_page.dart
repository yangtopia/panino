import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('레시피'),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: null)
        ],
      ),
      body: Text('TEST'),
    );
  }
}
