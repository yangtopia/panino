import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('동영상'),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: null)
        ],
      ),
    );
  }
}
