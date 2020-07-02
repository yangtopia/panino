import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY'),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: null)
        ],
      ),
    );
  }
}
